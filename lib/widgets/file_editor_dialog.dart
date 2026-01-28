import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:berth_api/api.dart' as berth_api;
import '../extensions/file_entry_extensions.dart';
import '../services/files_service.dart';
import '../theme/app_theme.dart';

class FileEditorDialog extends StatefulWidget {
  final int serverId;
  final String stackName;
  final berth_api.FileEntry fileEntry;
  final FilesService filesService;
  final bool readOnly;

  const FileEditorDialog({
    super.key,
    required this.serverId,
    required this.stackName,
    required this.fileEntry,
    required this.filesService,
    this.readOnly = false,
  });

  @override
  State<FileEditorDialog> createState() => _FileEditorDialogState();
}

class _FileEditorDialogState extends State<FileEditorDialog> {
  late final TextEditingController _controller;
  bool _isLoading = true;
  bool _isSaving = false;
  String? _error;
  berth_api.FileContent? _fileContent;
  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(_onTextChanged);
    _loadFile();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (!_hasChanges && _fileContent != null) {
      setState(() {
        _hasChanges = _controller.text != _fileContent!.content;
      });
    }
  }

  Future<void> _loadFile() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final fileContent = await widget.filesService.readFile(
        widget.serverId,
        widget.stackName,
        widget.fileEntry.path,
      );

      setState(() {
        _fileContent = fileContent;
        _controller.text = fileContent.content;
        _isLoading = false;
        _hasChanges = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _saveFile() async {
    if (_fileContent == null || !_hasChanges) return;

    setState(() {
      _isSaving = true;
      _error = null;
    });

    try {
      await widget.filesService.writeFile(
        widget.serverId,
        widget.stackName,
        berth_api.WriteFileRequest(
          path: widget.fileEntry.path,
          content: _controller.text,
          encoding: _fileContent!.encoding,
        ),
      );

      setState(() {
        _fileContent = berth_api.FileContent(
          path: _fileContent!.path,
          content: _controller.text,
          size: _controller.text.length,
          encoding: _fileContent!.encoding,
        );
        _hasChanges = false;
        _isSaving = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File saved successfully')),
        );
      }
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isSaving = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save file: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  String _getFileType() {
    final extension = widget.fileEntry.name.split('.').last.toLowerCase();
    if (['jpg', 'jpeg', 'png', 'gif', 'webp', 'bmp'].contains(extension)) {
      return 'image';
    }
    return 'other';
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (_error != null) {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading file',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                _error!,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _loadFile,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (_fileContent?.encoding == 'base64' && _getFileType() == 'image') {
      return Container(
        height: 400,
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: InteractiveViewer(
            panEnabled: true,
            boundaryMargin: const EdgeInsets.all(AppSpacing.lg),
            minScale: 0.5,
            maxScale: 4.0,
            child: Center(
              child: Image.memory(
                base64Decode(_fileContent!.content),
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image,
                            size: 48,
                            color: Theme.of(context).colorScheme.error,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Failed to load image',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'The image file may be corrupted or in an unsupported format.',
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    if (_fileContent?.encoding == 'base64') {
      return SizedBox(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.file_present,
                size: 48,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              const SizedBox(height: 16),
              Text(
                'Binary File',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'This file contains binary data and cannot be edited as text.',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return SizedBox(
      height: 400,
      width: double.maxFinite,
      child: TextField(
        controller: _controller,
        maxLines: null,
        expands: true,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.readOnly ? 'File Content (Read-only)' : 'File Content',
          alignLabelWithHint: true,
        ),
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 14,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            widget.readOnly ? Icons.visibility : Icons.edit,
            size: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              widget.readOnly ? 'View File' : 'Edit File',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.description,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.fileEntry.name,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.fileEntry.displaySize} • ${_formatPath(widget.fileEntry.path)}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildContent(),
            if (_hasChanges && !widget.readOnly) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.edit,
                      size: 14,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Unsaved changes',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
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
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        if (!widget.readOnly && _fileContent?.encoding != 'base64') ...[
          TextButton(
            onPressed: _hasChanges ? _loadFile : null,
            child: const Text('Discard'),
          ),
          FilledButton(
            onPressed: _hasChanges && !_isSaving ? _saveFile : null,
            child: _isSaving
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
        ],
      ],
    );
  }

  String _formatPath(String path) {
    if (path.length <= 30) return path;
    return '...${path.substring(path.length - 27)}';
  }
}