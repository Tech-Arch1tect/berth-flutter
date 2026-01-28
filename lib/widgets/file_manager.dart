import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../extensions/file_entry_extensions.dart';
import '../models/operation.dart';
import '../services/files_service.dart';
import '../services/berth_api_provider.dart';
import '../services/api_client.dart';
import '../services/operations_service.dart';
import '../services/config_service.dart';
import 'file_editor_dialog.dart';
import 'archive_operation_dialog.dart';
import 'operations_modal.dart';
import '../theme/app_theme.dart';

class FileManager extends StatefulWidget {
  final int serverId;
  final String stackName;

  const FileManager({
    super.key,
    required this.serverId,
    required this.stackName,
  });

  @override
  State<FileManager> createState() => _FileManagerState();
}

class _FileManagerState extends State<FileManager> {
  late final FilesService _filesService;
  berth_api.DirectoryListing? _currentListing;
  bool _isLoading = true;
  String? _error;
  String _currentPath = '';
  final List<String> _pathHistory = [];

  @override
  void initState() {
    super.initState();
    final berthApiProvider = Provider.of<BerthApiProvider>(context, listen: false);
    _filesService = FilesService(berthApiProvider);
    _loadDirectory();
  }

  Future<void> _loadDirectory([String? path]) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final listing = await _filesService.listDirectory(
        widget.serverId,
        widget.stackName,
        path,
      );
      
      setState(() {
        _currentListing = listing;
        _currentPath = path ?? '';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  void _navigateToDirectory(String path) {
    _pathHistory.add(_currentPath);
    _loadDirectory(path);
  }

  void _navigateBack() {
    if (_pathHistory.isNotEmpty) {
      final previousPath = _pathHistory.removeLast();
      _loadDirectory(previousPath.isEmpty ? null : previousPath);
    }
  }

  void _navigateToRoot() {
    _pathHistory.clear();
    _loadDirectory();
  }

  Widget _buildPathBreadcrumb() {
    final segments = _currentPath.isEmpty ? <String>[] : _currentPath.split('/').where((s) => s.isNotEmpty).toList();
    
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Wrap(
        children: [
          TextButton.icon(
            onPressed: _navigateToRoot,
            icon: const Icon(Icons.home, size: 16),
            label: const Text('Root'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
          ),
          ...segments.asMap().entries.map((entry) {
            final index = entry.key;
            final segment = entry.value;
            final pathToSegment = segments.sublist(0, index + 1).join('/');
            
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                TextButton(
                  onPressed: () => _loadDirectory(pathToSegment),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  child: Text(segment),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget _buildFileList() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 16),
            Text(
              'Error loading directory',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              _error!,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _loadDirectory(_currentPath.isEmpty ? null : _currentPath),
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_currentListing?.entries.isEmpty ?? true) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_open,
              size: 64,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
            const SizedBox(height: 16),
            Text(
              'Empty Directory',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'This directory contains no files or folders.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _currentListing!.entries.length,
      itemBuilder: (context, index) {
        final entry = _currentListing!.entries[index];
        return _buildFileListTile(entry);
      },
    );
  }

  Widget _buildFileListTile(berth_api.FileEntry entry) {
    return ListTile(
      leading: Icon(
        entry.isDirectory ? Icons.folder : _getFileIcon(entry.extension_),
        color: entry.isDirectory 
          ? Theme.of(context).colorScheme.primary 
          : Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(entry.name),
      subtitle: entry.isDirectory 
        ? Text('Directory • ${entry.mode} • ${_formatOwnership(entry)}')
        : Text('${entry.displaySize} • ${entry.mode} • ${_formatOwnership(entry)} • ${_formatDate(entry.modTime)}'),
      onTap: entry.isDirectory 
        ? () => _navigateToDirectory(entry.path)
        : () => _showFileOptions(entry),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (entry.isDirectory) ...[
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => _showFileOptions(entry),
            ),
            const Icon(Icons.chevron_right),
          ] else ...[
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => _showFileOptions(entry),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getFileIcon(String? extension) {
    if (extension == null) return Icons.description;
    
    switch (extension.toLowerCase()) {
      case 'txt':
      case 'md':
      case 'readme':
        return Icons.description;
      case 'yml':
      case 'yaml':
      case 'json':
      case 'xml':
        return Icons.code;
      case 'sh':
      case 'bat':
        return Icons.terminal;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'svg':
        return Icons.image;
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'zip':
      case 'tar':
      case 'gz':
        return Icons.archive;
      default:
        return Icons.description;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 7) {
      return '${date.day}/${date.month}/${date.year}';
    } else if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  String _formatOwnership(berth_api.FileEntry entry) {
    final ownerPart = entry.owner != null ? '${entry.owner}' : '${entry.ownerId ?? 'unknown'}';
    final groupPart = entry.group != null ? '${entry.group}' : '${entry.groupId ?? 'unknown'}';
    return '$ownerPart:$groupPart';
  }

  void _showFileOptions(berth_api.FileEntry entry) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          if (!entry.isDirectory) ...[
            ListTile(
              leading: const Icon(Icons.visibility),
              title: const Text('View'),
              onTap: () {
                Navigator.pop(context);
                _viewFile(entry);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit'),
              onTap: () {
                Navigator.pop(context);
                _editFile(entry);
              },
            ),
            ListTile(
              leading: const Icon(Icons.download),
              title: const Text('Download'),
              onTap: () {
                Navigator.pop(context);
                _downloadFile(entry);
              },
            ),
            // Archive extraction for archive files
            if (ArchiveOperationBuilder.isArchiveFile(entry.name)) ...[
              ListTile(
                leading: const Icon(Icons.unarchive),
                title: const Text('Extract Archive'),
                onTap: () {
                  Navigator.pop(context);
                  _showExtractArchiveDialog(entry);
                },
              ),
            ],
          ],
          // Archive creation option
          ListTile(
            leading: const Icon(Icons.archive),
            title: const Text('Create Archive'),
            onTap: () {
              Navigator.pop(context);
              _showCreateArchiveDialog(entry);
            },
          ),
          ListTile(
            leading: const Icon(Icons.drive_file_rename_outline),
            title: const Text('Rename'),
            onTap: () {
              Navigator.pop(context);
              _showRenameDialog(entry);
            },
          ),
          ListTile(
            leading: const Icon(Icons.copy),
            title: const Text('Copy'),
            onTap: () {
              Navigator.pop(context);
              _showCopyDialog(entry);
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Permissions'),
            onTap: () {
              Navigator.pop(context);
              _showChmodDialog(entry);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Ownership'),
            onTap: () {
              Navigator.pop(context);
              _showChownDialog(entry);
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () {
              Navigator.pop(context);
              _confirmDelete(entry);
            },
          ),
        ],
        ),
      ),
    );
  }

  void _viewFile(berth_api.FileEntry entry) {
    showDialog(
      context: context,
      builder: (context) => FileEditorDialog(
        serverId: widget.serverId,
        stackName: widget.stackName,
        fileEntry: entry,
        filesService: _filesService,
        readOnly: true,
      ),
    );
  }

  void _editFile(berth_api.FileEntry entry) {
    showDialog(
      context: context,
      builder: (context) => FileEditorDialog(
        serverId: widget.serverId,
        stackName: widget.stackName,
        fileEntry: entry,
        filesService: _filesService,
        readOnly: false,
      ),
    );
  }

  Future<void> _downloadFile(berth_api.FileEntry entry) async {
    _showDownloadLocationDialog(entry);
  }

  void _showDownloadLocationDialog(berth_api.FileEntry entry) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Text(
              'Choose download location for ${entry.name}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Downloads Folder'),
            subtitle: const Text('Save to system Downloads folder'),
            onTap: () {
              Navigator.pop(context);
              _downloadToDownloads(entry);
            },
          ),
          ListTile(
            leading: const Icon(Icons.folder_open),
            title: const Text('Choose Location'),
            subtitle: const Text('Pick a custom folder'),
            onTap: () {
              Navigator.pop(context);
              _downloadToCustomLocation(entry);
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: const Text('App Folder'),
            subtitle: const Text('Save to app-specific folder (no permissions needed)'),
            onTap: () {
              Navigator.pop(context);
              _downloadToAppFolder(entry);
            },
          ),
          const SizedBox(height: 16),
        ],
        ),
      ),
    );
  }

  Future<void> _downloadToDownloads(berth_api.FileEntry entry) async {
    try {
      if (Platform.isAndroid) {
        bool hasPermission = await _requestStoragePermission();
        if (!hasPermission) return;
      }

      await _performDownload(entry, _getDownloadsDirectory, 'Downloads folder');
    } catch (e) {
      _showErrorMessage('Failed to download ${entry.name}: $e');
    }
  }

  Future<void> _downloadToCustomLocation(berth_api.FileEntry entry) async {
    try {
      String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
      
      if (selectedDirectory != null) {
        await _performDownload(
          entry, 
          () async => Directory(selectedDirectory), 
          'selected folder'
        );
      }
    } catch (e) {
      _showErrorMessage('Failed to download ${entry.name}: $e');
    }
  }

  Future<void> _downloadToAppFolder(berth_api.FileEntry entry) async {
    try {
      await _performDownload(entry, _getAppDirectory, 'app folder');
    } catch (e) {
      _showErrorMessage('Failed to download ${entry.name}: $e');
    }
  }

  Future<bool> _requestStoragePermission() async {
    if (await Permission.storage.isGranted || 
        await Permission.manageExternalStorage.isGranted) {
      return true;
    }
    final storageStatus = await Permission.storage.request();
    if (storageStatus.isGranted) {
      return true;
    } else if (storageStatus.isPermanentlyDenied) {
      _showPermissionDialog();
      return false;
    }
    
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Storage permission is required to download files'),
          backgroundColor: Theme.of(context).colorScheme.error,
          action: SnackBarAction(
            label: 'Grant Permission',
            onPressed: () => openAppSettings(),
          ),
        ),
      );
    }
    return false;
  }

  Future<Directory> _getDownloadsDirectory() async {
    if (Platform.isAndroid) {
      final downloadsDir = Directory('/storage/emulated/0/Download');
      if (await downloadsDir.exists()) {
        return downloadsDir;
      } else {
        final externalDir = await getExternalStorageDirectory();
        if (externalDir != null) {
          final appDownloads = Directory('${externalDir.path}/Download');
          await appDownloads.create(recursive: true);
          return appDownloads;
        } else {
          throw Exception('Could not access external storage');
        }
      }
    } else if (Platform.isIOS) {
      return await getApplicationDocumentsDirectory();
    } else {
      return await getApplicationSupportDirectory();
    }
  }

  Future<Directory> _getAppDirectory() async {
    if (Platform.isAndroid) {
      final externalDir = await getExternalStorageDirectory();
      if (externalDir != null) {
        final downloadsDir = Directory('${externalDir.path}/Downloads');
        await downloadsDir.create(recursive: true);
        return downloadsDir;
      } else {
        return await getApplicationSupportDirectory();
      }
    } else if (Platform.isIOS) {
      return await getApplicationDocumentsDirectory();
    } else {
      return await getApplicationSupportDirectory();
    }
  }

  Future<void> _performDownload(
    berth_api.FileEntry entry, 
    Future<Directory> Function() getDirectory, 
    String locationName
  ) async {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloading ${entry.name}...')),
      );
    }

    final fileBytes = await _filesService.downloadFile(
      widget.serverId,
      widget.stackName,
      entry.path,
      entry.name,
    );

    final saveDir = await getDirectory();

    String fileName = entry.name;
    String filePath = '${saveDir.path}/$fileName';
    int counter = 1;
    while (await File(filePath).exists()) {
      final nameWithoutExt = fileName.contains('.') 
          ? fileName.substring(0, fileName.lastIndexOf('.'))
          : fileName;
      final extension = fileName.contains('.') 
          ? fileName.substring(fileName.lastIndexOf('.'))
          : '';
      fileName = '$nameWithoutExt ($counter)$extension';
      filePath = '${saveDir.path}/$fileName';
      counter++;
    }
    final file = File(filePath);
    await file.writeAsBytes(fileBytes);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${entry.name} saved to $locationName'),
          action: SnackBarAction(
            label: 'Show Path',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Saved as: $fileName\nLocation: ${saveDir.path}'),
                  duration: const Duration(seconds: 5),
                ),
              );
            },
          ),
        ),
      );
    }
  }

  void _showErrorMessage(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).colorScheme.error,
        ),
      );
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Storage Permission Required'),
        content: const Text(
          'To download files to your Downloads folder, this app needs storage permission. '
          'Please grant permission in the app settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  void _showRenameDialog(berth_api.FileEntry entry) {
    final controller = TextEditingController(text: entry.name);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Rename ${entry.isDirectory ? 'Directory' : 'File'}'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'New name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              Navigator.pop(context);
              _renameItem(entry, value);
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final newName = controller.text.trim();
              if (newName.isNotEmpty) {
                Navigator.pop(context);
                _renameItem(entry, newName);
              }
            },
            child: const Text('Rename'),
          ),
        ],
      ),
    );
  }

  void _showCopyDialog(berth_api.FileEntry entry) {
    final pathController = TextEditingController();
    final nameController = TextEditingController(text: entry.name);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Copy ${entry.isDirectory ? 'Directory' : 'File'}'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: pathController,
              decoration: InputDecoration(
                labelText: 'Destination path (optional)',
                hintText: 'Leave empty for current directory',
                border: const OutlineInputBorder(),
                helperText: _currentPath.isEmpty 
                  ? 'Current: root directory' 
                  : 'Current: $_currentPath',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'New name',
                border: OutlineInputBorder(),
              ),
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              final destinationPath = pathController.text.trim();
              final newName = nameController.text.trim();
              if (newName.isNotEmpty) {
                Navigator.pop(context);
                _copyItem(entry, destinationPath, newName);
              }
            },
            child: const Text('Copy'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(berth_api.FileEntry entry) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete ${entry.isDirectory ? 'Directory' : 'File'}'),
        content: Text('Are you sure you want to delete "${entry.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteItem(entry);
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _renameItem(berth_api.FileEntry entry, String newName) async {
    final pathSegments = entry.path.split('/');
    pathSegments[pathSegments.length - 1] = newName;
    final newPath = pathSegments.join('/');
    
    try {
      await _filesService.renameFile(
        widget.serverId,
        widget.stackName,
        berth_api.RenameRequest(oldPath: entry.path, newPath: newPath),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${entry.name} renamed to $newName')),
        );
        
        _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to rename ${entry.name}: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _copyItem(berth_api.FileEntry entry, String destinationPath, String newName) async {
    String targetPath;
    if (destinationPath.isEmpty) {
      targetPath = _currentPath.isEmpty ? newName : '$_currentPath/$newName';
    } else {
      targetPath = destinationPath.endsWith('/') 
        ? '$destinationPath$newName' 
        : '$destinationPath/$newName';
    }
    
    try {
      await _filesService.copyFile(
        widget.serverId,
        widget.stackName,
        berth_api.CopyRequest(sourcePath: entry.path, targetPath: targetPath),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${entry.name} copied to $newName')),
        );
        
        _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to copy ${entry.name}: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _deleteItem(berth_api.FileEntry entry) async {
    try {
      await _filesService.deleteFile(
        widget.serverId,
        widget.stackName,
        berth_api.DeleteRequest2(path: entry.path),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${entry.name} deleted successfully')),
        );
        
        _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete ${entry.name}: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _showCreateMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
          ListTile(
            leading: const Icon(Icons.upload_file),
            title: const Text('Upload File'),
            onTap: () {
              Navigator.pop(context);
              _showUploadDialog();
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_add),
            title: const Text('New File'),
            onTap: () {
              Navigator.pop(context);
              _showCreateFileDialog();
            },
          ),
          ListTile(
            leading: const Icon(Icons.create_new_folder),
            title: const Text('New Directory'),
            onTap: () {
              Navigator.pop(context);
              _showCreateDirectoryDialog();
            },
          ),
        ],
        ),
      ),
    );
  }

  void _showUploadDialog() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null && result.files.isNotEmpty && mounted) {
        final modeController = TextEditingController();
        final ownerIdController = TextEditingController();
        final groupIdController = TextEditingController();
        bool showAdvanced = false;

        final stats = await _loadSmartDefaults(_currentPath);
        
        if (stats != null) {
          modeController.text = stats.mostCommonMode == '755' ? '644' : (stats.mostCommonMode ?? '644');
          ownerIdController.text = stats.mostCommonOwner?.toString() ?? '';
          groupIdController.text = stats.mostCommonGroup?.toString() ?? '';
        } else {
          modeController.text = '644';
        }

        if (!mounted) return;

        showDialog(
          context: context,
          builder: (context) => StatefulBuilder(
            builder: (context, setState) {

              return AlertDialog(
                title: const Text('Upload Files'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Upload ${result.files.length} file${result.files.length > 1 ? 's' : ''} to:'),
                      const SizedBox(height: 8),
                      Text(
                        _currentPath.isEmpty ? 'Root directory' : _currentPath,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 120),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: result.files.map((file) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(
                                '• ${file.name}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            )).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      
                          TextButton.icon(
                        onPressed: () {
                          setState(() {
                            showAdvanced = !showAdvanced;
                          });
                        },
                        icon: Icon(showAdvanced ? Icons.expand_less : Icons.expand_more),
                        label: const Text('Permissions & Ownership'),
                      ),

                      if (showAdvanced) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextField(
                                controller: modeController,
                                decoration: const InputDecoration(
                                  labelText: 'Permissions (octal)',
                                  hintText: '644',
                                  border: OutlineInputBorder(),
                                  helperText: 'Leave empty to use default permissions',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 12),
                              
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: ownerIdController,
                                      decoration: const InputDecoration(
                                        labelText: 'Owner ID',
                                        hintText: '1000',
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: TextField(
                                      controller: groupIdController,
                                      decoration: const InputDecoration(
                                        labelText: 'Group ID',
                                        hintText: '1000',
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Leave empty to use server defaults',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _uploadFilesWithOptions(result.files, modeController.text.trim(), ownerIdController.text.trim(), groupIdController.text.trim());
                    },
                    child: const Text('Upload'),
                  ),
                ],
              );
            },
          ),
        );
      }
    } catch (e) {
      _showErrorMessage('Failed to select files: $e');
    }
  }

  Future<void> _uploadFilesWithOptions(List<PlatformFile> files, String mode, String ownerId, String groupId) async {
    int successCount = 0;
    int errorCount = 0;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Uploading Files'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text('Uploading files... (0/${files.length})'),
          ],
        ),
      ),
    );

    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      try {
        if (file.path != null) {
          final ioFile = File(file.path!);
          final uploadPath = _currentPath.isEmpty ? '' : _currentPath;
          
          await _filesService.uploadFile(
            widget.serverId,
            widget.stackName,
            uploadPath,
            ioFile,
            file.name,
          );

          final filePath = uploadPath.isEmpty ? file.name : '$uploadPath/${file.name}';
          
          if (mode.isNotEmpty) {
            await _filesService.chmodFile(
              widget.serverId,
              widget.stackName,
              berth_api.ChmodRequest(
                path: filePath,
                mode: mode,
                recursive: false,
              ),
            );
          }

          if (ownerId.isNotEmpty || groupId.isNotEmpty) {
            await _filesService.chownFile(
              widget.serverId,
              widget.stackName,
              berth_api.ChownRequest(
                path: filePath,
                ownerId: ownerId.isNotEmpty ? int.tryParse(ownerId) : null,
                groupId: groupId.isNotEmpty ? int.tryParse(groupId) : null,
                recursive: false,
              ),
            );
          }
          successCount++;
        }
      } catch (e) {
        errorCount++;
      }

      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Uploading Files'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text('Uploading files... (${i + 1}/${files.length})'),
              ],
            ),
          ),
        );
      }
    }

    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    if (mounted) {
      if (errorCount == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Successfully uploaded $successCount file${successCount > 1 ? 's' : ''}')),
        );
      } else if (successCount == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to upload all files'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Uploaded $successCount file${successCount > 1 ? 's' : ''}, failed: $errorCount'),
            backgroundColor: Theme.of(context).colorScheme.tertiary,
          ),
        );
      }

      _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
    }
  }

  void _showCreateFileDialog() async {
    final controller = TextEditingController();
    final modeController = TextEditingController();
    final ownerIdController = TextEditingController();
    final groupIdController = TextEditingController();
    bool showAdvanced = false;

    final stats = await _loadSmartDefaults(_currentPath);
    
    if (stats != null) {
      final defaultMode = stats.mostCommonMode == '755' ? '644' : (stats.mostCommonMode ?? '644');
      modeController.text = defaultMode;
      ownerIdController.text = stats.mostCommonOwner?.toString() ?? '';
      groupIdController.text = stats.mostCommonGroup?.toString() ?? '';
    } else {
      modeController.text = '644';
    }

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {

          return AlertDialog(
            title: const Text('Create New File'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'File name',
                      border: const OutlineInputBorder(),
                      helperText: _currentPath.isEmpty 
                        ? 'Location: root directory' 
                        : 'Location: $_currentPath',
                    ),
                    autofocus: true,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        Navigator.pop(context);
                        _createNewFileWithOptions(value, modeController.text.trim(), ownerIdController.text.trim(), groupIdController.text.trim());
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        showAdvanced = !showAdvanced;
                      });
                    },
                    icon: Icon(showAdvanced ? Icons.expand_less : Icons.expand_more),
                    label: const Text('Permissions & Ownership'),
                  ),

                  if (showAdvanced) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: modeController,
                            decoration: const InputDecoration(
                              labelText: 'Permissions (octal)',
                              hintText: '644',
                              border: OutlineInputBorder(),
                              helperText: 'Leave empty to use default permissions',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 12),
                          
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: ownerIdController,
                                  decoration: const InputDecoration(
                                    labelText: 'Owner ID',
                                    hintText: '1000',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: groupIdController,
                                  decoration: const InputDecoration(
                                    labelText: 'Group ID',
                                    hintText: '1000',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Leave empty to use server defaults',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  final fileName = controller.text.trim();
                  if (fileName.isNotEmpty) {
                    Navigator.pop(context);
                    _createNewFileWithOptions(fileName, modeController.text.trim(), ownerIdController.text.trim(), groupIdController.text.trim());
                  }
                },
                child: const Text('Create'),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showCreateDirectoryDialog() async {
    final controller = TextEditingController();
    final modeController = TextEditingController();
    final ownerIdController = TextEditingController();
    final groupIdController = TextEditingController();
    bool showAdvanced = false;

    final stats = await _loadSmartDefaults(_currentPath);
    
    if (stats != null) {
      modeController.text = stats.mostCommonMode ?? '755';
      ownerIdController.text = stats.mostCommonOwner?.toString() ?? '';
      groupIdController.text = stats.mostCommonGroup?.toString() ?? '';
    } else {
      modeController.text = '755';
    }

    if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {

          return AlertDialog(
            title: const Text('Create New Directory'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Directory name',
                      border: const OutlineInputBorder(),
                      helperText: _currentPath.isEmpty 
                        ? 'Location: root directory' 
                        : 'Location: $_currentPath',
                    ),
                    autofocus: true,
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        Navigator.pop(context);
                        _createNewDirectoryWithOptions(value, modeController.text.trim(), ownerIdController.text.trim(), groupIdController.text.trim());
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        showAdvanced = !showAdvanced;
                      });
                    },
                    icon: Icon(showAdvanced ? Icons.expand_less : Icons.expand_more),
                    label: const Text('Permissions & Ownership'),
                  ),

                  if (showAdvanced) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: modeController,
                            decoration: const InputDecoration(
                              labelText: 'Permissions (octal)',
                              hintText: '755',
                              border: OutlineInputBorder(),
                              helperText: 'Leave empty to use default permissions',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 12),
                          
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: ownerIdController,
                                  decoration: const InputDecoration(
                                    labelText: 'Owner ID',
                                    hintText: '1000',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextField(
                                  controller: groupIdController,
                                  decoration: const InputDecoration(
                                    labelText: 'Group ID',
                                    hintText: '1000',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Leave empty to use server defaults',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  final dirName = controller.text.trim();
                  if (dirName.isNotEmpty) {
                    Navigator.pop(context);
                    _createNewDirectoryWithOptions(dirName, modeController.text.trim(), ownerIdController.text.trim(), groupIdController.text.trim());
                  }
                },
                child: const Text('Create'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<berth_api.DirectoryStats?> _loadSmartDefaults(String path) async {
    try {
      return await _filesService.getDirectoryStats(
        widget.serverId,
        widget.stackName,
        path.isEmpty ? null : path,
      );
    } catch (e) {
      return null;
    }
  }

  Future<void> _createNewFileWithOptions(String fileName, String mode, String ownerId, String groupId) async {
    final filePath = _currentPath.isEmpty ? fileName : '$_currentPath/$fileName';
    
    try {
      final request = berth_api.WriteFileRequest(
        path: filePath,
        content: '',
        mode: mode.isNotEmpty ? mode : null,
        ownerId: ownerId.isNotEmpty ? int.tryParse(ownerId) : null,
        groupId: groupId.isNotEmpty ? int.tryParse(groupId) : null,
      );

      await _filesService.writeFile(widget.serverId, widget.stackName, request);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File $fileName created successfully')),
        );
        
        _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create file $fileName: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _createNewDirectoryWithOptions(String dirName, String mode, String ownerId, String groupId) async {
    final dirPath = _currentPath.isEmpty ? dirName : '$_currentPath/$dirName';
    
    try {
      final request = berth_api.CreateDirectoryRequest(
        path: dirPath,
        mode: mode.isNotEmpty ? mode : null,
        ownerId: ownerId.isNotEmpty ? int.tryParse(ownerId) : null,
        groupId: groupId.isNotEmpty ? int.tryParse(groupId) : null,
      );

      await _filesService.createDirectory(widget.serverId, widget.stackName, request);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Directory $dirName created successfully')),
        );
        
        _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create directory $dirName: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
                ),
              ),
            ),
            child: Row(
              children: [
                if (_pathHistory.isNotEmpty)
                  IconButton(
                    onPressed: _navigateBack,
                    icon: const Icon(Icons.arrow_back),
                    tooltip: 'Back',
                  ),
                Expanded(child: _buildPathBreadcrumb()),
                IconButton(
                  onPressed: () => _loadDirectory(_currentPath.isEmpty ? null : _currentPath),
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
                ),
              ],
            ),
          ),
          Expanded(child: _buildFileList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateMenu,
        tooltip: 'Create new file or directory',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showChmodDialog(berth_api.FileEntry entry) {
    final octalController = TextEditingController();
    bool userRead = false;
    bool userWrite = false;
    bool userExecute = false;
    bool groupRead = false;
    bool groupWrite = false;
    bool groupExecute = false;
    bool otherRead = false;
    bool otherWrite = false;
    bool otherExecute = false;
    bool recursive = false;

    _parsePermissions(entry.mode, (permissions) {
      userRead = permissions['userRead']!;
      userWrite = permissions['userWrite']!;
      userExecute = permissions['userExecute']!;
      groupRead = permissions['groupRead']!;
      groupWrite = permissions['groupWrite']!;
      groupExecute = permissions['groupExecute']!;
      otherRead = permissions['otherRead']!;
      otherWrite = permissions['otherWrite']!;
      otherExecute = permissions['otherExecute']!;
    });

    String octalMode = _calculateOctal(userRead, userWrite, userExecute, groupRead, groupWrite, groupExecute, otherRead, otherWrite, otherExecute);
    octalController.text = octalMode;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          void updateFromCheckboxes() {
            octalMode = _calculateOctal(userRead, userWrite, userExecute, groupRead, groupWrite, groupExecute, otherRead, otherWrite, otherExecute);
            octalController.text = octalMode;
          }

          void updateFromOctal(String value) {
            if (value.length == 3 && RegExp(r'^\d{3}$').hasMatch(value)) {
              final permissions = _parseFromOctal(value);
              setState(() {
                userRead = permissions['userRead']!;
                userWrite = permissions['userWrite']!;
                userExecute = permissions['userExecute']!;
                groupRead = permissions['groupRead']!;
                groupWrite = permissions['groupWrite']!;
                groupExecute = permissions['groupExecute']!;
                otherRead = permissions['otherRead']!;
                otherWrite = permissions['otherWrite']!;
                otherExecute = permissions['otherExecute']!;
              });
            }
          }

          return AlertDialog(
            title: Text('Change Permissions - ${entry.name}'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: octalController,
                    decoration: const InputDecoration(
                      labelText: 'Octal Notation (e.g., 755)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    onChanged: (value) {
                      updateFromOctal(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text('Permissions:', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  
                  _buildPermissionRow('Owner', userRead, userWrite, userExecute, (r, w, x) {
                    setState(() {
                      userRead = r;
                      userWrite = w;
                      userExecute = x;
                      updateFromCheckboxes();
                    });
                  }),
                  
                  _buildPermissionRow('Group', groupRead, groupWrite, groupExecute, (r, w, x) {
                    setState(() {
                      groupRead = r;
                      groupWrite = w;
                      groupExecute = x;
                      updateFromCheckboxes();
                    });
                  }),
                  
                  _buildPermissionRow('Others', otherRead, otherWrite, otherExecute, (r, w, x) {
                    setState(() {
                      otherRead = r;
                      otherWrite = w;
                      otherExecute = x;
                      updateFromCheckboxes();
                    });
                  }),

                  if (entry.isDirectory) ...[
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: recursive,
                            onChanged: (value) {
                              setState(() {
                                recursive = value ?? false;
                              });
                            },
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Apply recursively',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  ),
                                ),
                                Text(
                                  'Change permissions for all files and subdirectories',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: octalController.text.length == 3
                  ? () {
                      Navigator.pop(context);
                      _changePermissions(entry, octalController.text, recursive && entry.isDirectory);
                    }
                  : null,
                child: const Text('Change Permissions'),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPermissionRow(
    String label,
    bool read,
    bool write,
    bool execute,
    Function(bool read, bool write, bool execute) onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Row(
              children: [
                _buildPermissionCheckbox('Read', read, (value) => onChanged(value, write, execute)),
                const SizedBox(width: 16),
                _buildPermissionCheckbox('Write', write, (value) => onChanged(read, value, execute)),
                const SizedBox(width: 16),
                _buildPermissionCheckbox('Execute', execute, (value) => onChanged(read, write, value)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPermissionCheckbox(String label, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) => onChanged(newValue ?? false),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  void _parsePermissions(String mode, Function(Map<String, bool>) callback) {
    Map<String, bool> permissions = {
      'userRead': false,
      'userWrite': false,
      'userExecute': false,
      'groupRead': false,
      'groupWrite': false,
      'groupExecute': false,
      'otherRead': false,
      'otherWrite': false,
      'otherExecute': false,
    };

    if (mode.length >= 9) {
      final perms = mode.substring(mode.length - 9);
      permissions['userRead'] = perms[0] == 'r';
      permissions['userWrite'] = perms[1] == 'w';
      permissions['userExecute'] = perms[2] == 'x' || perms[2] == 's';
      permissions['groupRead'] = perms[3] == 'r';
      permissions['groupWrite'] = perms[4] == 'w';
      permissions['groupExecute'] = perms[5] == 'x' || perms[5] == 's';
      permissions['otherRead'] = perms[6] == 'r';
      permissions['otherWrite'] = perms[7] == 'w';
      permissions['otherExecute'] = perms[8] == 'x' || perms[8] == 't';
    } else if (RegExp(r'^\d{3,4}$').hasMatch(mode)) {
      final octal = mode.length == 3 ? mode : mode.substring(1);
      permissions = _parseFromOctal(octal);
    }

    callback(permissions);
  }

  Map<String, bool> _parseFromOctal(String octal) {
    if (octal.length != 3) {
      return {
        'userRead': false,
        'userWrite': false,
        'userExecute': false,
        'groupRead': false,
        'groupWrite': false,
        'groupExecute': false,
        'otherRead': false,
        'otherWrite': false,
        'otherExecute': false,
      };
    }

    final userValue = int.parse(octal[0]);
    final groupValue = int.parse(octal[1]);
    final otherValue = int.parse(octal[2]);

    return {
      'userRead': (userValue & 4) != 0,
      'userWrite': (userValue & 2) != 0,
      'userExecute': (userValue & 1) != 0,
      'groupRead': (groupValue & 4) != 0,
      'groupWrite': (groupValue & 2) != 0,
      'groupExecute': (groupValue & 1) != 0,
      'otherRead': (otherValue & 4) != 0,
      'otherWrite': (otherValue & 2) != 0,
      'otherExecute': (otherValue & 1) != 0,
    };
  }

  String _calculateOctal(bool userRead, bool userWrite, bool userExecute,
                        bool groupRead, bool groupWrite, bool groupExecute,
                        bool otherRead, bool otherWrite, bool otherExecute) {
    final userValue = (userRead ? 4 : 0) + (userWrite ? 2 : 0) + (userExecute ? 1 : 0);
    final groupValue = (groupRead ? 4 : 0) + (groupWrite ? 2 : 0) + (groupExecute ? 1 : 0);
    final otherValue = (otherRead ? 4 : 0) + (otherWrite ? 2 : 0) + (otherExecute ? 1 : 0);

    return '$userValue$groupValue$otherValue';
  }

  Future<void> _changePermissions(berth_api.FileEntry entry, String mode, bool recursive) async {
    try {
      await _filesService.chmodFile(
        widget.serverId,
        widget.stackName,
        berth_api.ChmodRequest(path: entry.path, mode: mode, recursive: recursive),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              recursive 
                ? 'Permissions changed recursively for ${entry.name}' 
                : 'Permissions changed for ${entry.name}',
            ),
          ),
        );

        _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to change permissions for ${entry.name}: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _showChownDialog(berth_api.FileEntry entry) {
    final ownerIdController = TextEditingController(text: entry.ownerId?.toString() ?? '');
    final groupIdController = TextEditingController(text: entry.groupId?.toString() ?? '');
    bool recursive = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('Change Ownership - ${entry.name}'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Current ownership display
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Ownership',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text('Owner: ', style: Theme.of(context).textTheme.bodySmall),
                            Expanded(
                              child: Text(
                                entry.owner != null ? '${entry.owner} (${entry.ownerId})' : 'UID ${entry.ownerId ?? 'Unknown'}',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontFamily: 'monospace',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text('Group: ', style: Theme.of(context).textTheme.bodySmall),
                            Expanded(
                              child: Text(
                                entry.group != null ? '${entry.group} (${entry.groupId})' : 'GID ${entry.groupId ?? 'Unknown'}',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  fontFamily: 'monospace',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Owner input
                  TextField(
                    controller: ownerIdController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'New Owner ID',
                      hintText: 'User ID (leave empty to keep current)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Group input
                  TextField(
                    controller: groupIdController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'New Group ID',
                      hintText: 'Group ID (leave empty to keep current)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Recursive option for directories
                  if (entry.isDirectory)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                        ),
                      ),
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Apply recursively'),
                        subtitle: const Text('Change ownership for all files and subdirectories'),
                        value: recursive,
                        onChanged: (value) {
                          setState(() {
                            recursive = value ?? false;
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: (ownerIdController.text.trim().isNotEmpty || groupIdController.text.trim().isNotEmpty)
                    ? () {
                        Navigator.pop(context);
                        _executeChown(entry, ownerIdController.text.trim(), groupIdController.text.trim(), recursive);
                      }
                    : null,
                child: const Text('Change Ownership'),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _executeChown(berth_api.FileEntry entry, String ownerIdStr, String groupIdStr, bool recursive) async {
    try {
      final request = berth_api.ChownRequest(
        path: entry.path,
        ownerId: ownerIdStr.isNotEmpty ? int.tryParse(ownerIdStr) : null,
        groupId: groupIdStr.isNotEmpty ? int.tryParse(groupIdStr) : null,
        recursive: recursive && entry.isDirectory,
      );

      await _filesService.chownFile(widget.serverId, widget.stackName, request);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ownership changed successfully for ${entry.name}'),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
        _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to change ownership for ${entry.name}: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  void _showCreateArchiveDialog(berth_api.FileEntry? entry) {
    showDialog(
      context: context,
      builder: (context) => ArchiveOperationDialog(
        operation: 'create',
        currentPath: _currentPath,
        selectedFile: entry,
        onOperationStart: _handleArchiveOperation,
      ),
    );
  }

  void _showExtractArchiveDialog(berth_api.FileEntry entry) {
    showDialog(
      context: context,
      builder: (context) => ArchiveOperationDialog(
        operation: 'extract',
        currentPath: _currentPath,
        selectedFile: entry,
        onOperationStart: _handleArchiveOperation,
      ),
    );
  }

  Future<void> _handleArchiveOperation(OperationRequest request) async {
    try {
      final apiClient = context.read<ApiClient>();
      final configService = context.read<ConfigService>();
      
      // Show operations modal for real-time feedback
      final operationsService = OperationsService(apiClient, configService);
      
      if (mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => OperationsModal(
            serverId: widget.serverId,
            stackName: widget.stackName,
            services: [], // Archive operations don't operate on services
            operationsService: operationsService,
          ),
        );
        
        // Connect and start the operation
        await operationsService.connect(widget.serverId, widget.stackName);
        await operationsService.startOperation(request);
        
        // Refresh directory after operation (with delay to allow completion)
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
          }
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to start archive operation: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}