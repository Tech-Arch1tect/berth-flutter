import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import '../models/file.dart';
import '../services/files_service.dart';
import '../services/api_client.dart';
import 'file_editor_dialog.dart';

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
  DirectoryListing? _currentListing;
  bool _isLoading = true;
  String? _error;
  String _currentPath = '';
  final List<String> _pathHistory = [];

  @override
  void initState() {
    super.initState();
    final apiClient = Provider.of<ApiClient>(context, listen: false);
    _filesService = FilesService(apiClient);
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
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          // Root
          TextButton.icon(
            onPressed: _navigateToRoot,
            icon: const Icon(Icons.home, size: 16),
            label: const Text('Root'),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            ),
          ),
          
          // Path segments
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

  Widget _buildFileListTile(FileEntry entry) {
    return ListTile(
      leading: Icon(
        entry.isDirectory ? Icons.folder : _getFileIcon(entry.extension),
        color: entry.isDirectory 
          ? Theme.of(context).colorScheme.primary 
          : Theme.of(context).colorScheme.onSurface,
      ),
      title: Text(entry.name),
      subtitle: entry.isDirectory 
        ? const Text('Directory')
        : Text('${entry.displaySize} • ${_formatDate(entry.modTime)}'),
      onTap: entry.isDirectory 
        ? () => _navigateToDirectory(entry.path)
        : () => _showFileOptions(entry),
      trailing: entry.isDirectory 
        ? const Icon(Icons.chevron_right)
        : IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => _showFileOptions(entry),
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

  void _showFileOptions(FileEntry entry) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
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
          ],
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
            leading: const Icon(Icons.delete),
            title: const Text('Delete'),
            onTap: () {
              Navigator.pop(context);
              _confirmDelete(entry);
            },
          ),
        ],
      ),
    );
  }

  void _viewFile(FileEntry entry) {
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

  void _editFile(FileEntry entry) {
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

  Future<void> _downloadFile(FileEntry entry) async {
    _showDownloadLocationDialog(entry);
  }

  void _showDownloadLocationDialog(FileEntry entry) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
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
    );
  }

  Future<void> _downloadToDownloads(FileEntry entry) async {
    try {
      // Request storage permission for Android
      if (Platform.isAndroid) {
        bool hasPermission = await _requestStoragePermission();
        if (!hasPermission) return;
      }

      await _performDownload(entry, _getDownloadsDirectory, 'Downloads folder');
    } catch (e) {
      _showErrorMessage('Failed to download ${entry.name}: $e');
    }
  }

  Future<void> _downloadToCustomLocation(FileEntry entry) async {
    try {
      // Use file picker to let user choose location
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

  Future<void> _downloadToAppFolder(FileEntry entry) async {
    try {
      await _performDownload(entry, _getAppDirectory, 'app folder');
    } catch (e) {
      _showErrorMessage('Failed to download ${entry.name}: $e');
    }
  }

  Future<bool> _requestStoragePermission() async {
    // Check if we need to request permission
    if (await Permission.storage.isGranted || 
        await Permission.manageExternalStorage.isGranted) {
      return true;
    }
    
    // Request storage permission
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
      // Try to use the system Downloads directory
      final downloadsDir = Directory('/storage/emulated/0/Download');
      if (await downloadsDir.exists()) {
        return downloadsDir;
      } else {
        // Fallback to external storage if Downloads folder doesn't exist
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
    FileEntry entry, 
    Future<Directory> Function() getDirectory, 
    String locationName
  ) async {
    // Show downloading message
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Downloading ${entry.name}...')),
      );
    }

    // Download the file
    final fileBytes = await _filesService.downloadFile(
      widget.serverId,
      widget.stackName,
      entry.path,
      entry.name,
    );

    // Get the save directory
    final saveDir = await getDirectory();

    // Create the file path, handle duplicates
    String fileName = entry.name;
    String filePath = '${saveDir.path}/$fileName';
    
    // Handle duplicate files by adding a number suffix
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
    
    // Write the file
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

  void _showRenameDialog(FileEntry entry) {
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

  void _showCopyDialog(FileEntry entry) {
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

  void _confirmDelete(FileEntry entry) {
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

  Future<void> _renameItem(FileEntry entry, String newName) async {
    // Build the new path
    final pathSegments = entry.path.split('/');
    pathSegments[pathSegments.length - 1] = newName;
    final newPath = pathSegments.join('/');
    
    try {
      await _filesService.renameFile(
        widget.serverId,
        widget.stackName,
        RenameRequest(oldPath: entry.path, newPath: newPath),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${entry.name} renamed to $newName')),
        );
        
        // Refresh the directory listing
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

  Future<void> _copyItem(FileEntry entry, String destinationPath, String newName) async {
    // Build the target path
    String targetPath;
    if (destinationPath.isEmpty) {
      // Copy to current directory
      targetPath = _currentPath.isEmpty ? newName : '$_currentPath/$newName';
    } else {
      // Copy to specified path
      targetPath = destinationPath.endsWith('/') 
        ? '$destinationPath$newName' 
        : '$destinationPath/$newName';
    }
    
    try {
      await _filesService.copyFile(
        widget.serverId,
        widget.stackName,
        CopyRequest(sourcePath: entry.path, targetPath: targetPath),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${entry.name} copied to $newName')),
        );
        
        // Refresh the directory listing
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

  Future<void> _deleteItem(FileEntry entry) async {
    try {
      await _filesService.deleteFile(
        widget.serverId,
        widget.stackName,
        DeleteRequest(path: entry.path),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${entry.name} deleted successfully')),
        );
        
        // Refresh the directory listing
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
      builder: (context) => Column(
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
    );
  }

  void _showUploadDialog() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.any,
      );

      if (result != null && result.files.isNotEmpty && mounted) {
        // Show upload confirmation dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Upload Files'),
            content: Column(
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
                  constraints: const BoxConstraints(maxHeight: 200),
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
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: () {
                  Navigator.pop(context);
                  _uploadFiles(result.files);
                },
                child: const Text('Upload'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      _showErrorMessage('Failed to select files: $e');
    }
  }

  Future<void> _uploadFiles(List<PlatformFile> files) async {
    int successCount = 0;
    int errorCount = 0;

    // Show progress dialog
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
          successCount++;
        }
      } catch (e) {
        errorCount++;
        debugPrint('Failed to upload ${file.name}: $e');
      }

      // Update progress dialog
      if (mounted) {
        // Find the dialog and update its content
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

    // Close progress dialog
    if (mounted) {
      Navigator.of(context, rootNavigator: true).pop();
    }

    // Show result
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

      // Refresh the directory listing
      _loadDirectory(_currentPath.isEmpty ? null : _currentPath);
    }
  }

  void _showCreateFileDialog() {
    final controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New File'),
        content: TextField(
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
              _createNewFile(value);
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
              final fileName = controller.text.trim();
              if (fileName.isNotEmpty) {
                Navigator.pop(context);
                _createNewFile(fileName);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  void _showCreateDirectoryDialog() {
    final controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create New Directory'),
        content: TextField(
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
              _createNewDirectory(value);
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
              final dirName = controller.text.trim();
              if (dirName.isNotEmpty) {
                Navigator.pop(context);
                _createNewDirectory(dirName);
              }
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Future<void> _createNewFile(String fileName) async {
    // Build the file path
    final filePath = _currentPath.isEmpty ? fileName : '$_currentPath/$fileName';
    
    try {
      await _filesService.writeFile(
        widget.serverId,
        widget.stackName,
        WriteFileRequest(path: filePath, content: ''),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File $fileName created successfully')),
        );
        
        // Refresh the directory listing
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

  Future<void> _createNewDirectory(String dirName) async {
    // Build the directory path
    final dirPath = _currentPath.isEmpty ? dirName : '$_currentPath/$dirName';
    
    try {
      await _filesService.createDirectory(
        widget.serverId,
        widget.stackName,
        CreateDirectoryRequest(path: dirPath),
      );
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Directory $dirName created successfully')),
        );
        
        // Refresh the directory listing
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
          // Navigation bar
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
          
          // File list
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
}