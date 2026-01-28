import 'package:flutter/material.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../models/operation.dart';

class ArchiveOperationDialog extends StatefulWidget {
  final String operation; // 'create' or 'extract'
  final String currentPath;
  final berth_api.FileEntry? selectedFile;
  final Function(OperationRequest) onOperationStart;

  const ArchiveOperationDialog({
    super.key,
    required this.operation,
    required this.currentPath,
    this.selectedFile,
    required this.onOperationStart,
  });

  @override
  State<ArchiveOperationDialog> createState() => _ArchiveOperationDialogState();
}

class _ArchiveOperationDialogState extends State<ArchiveOperationDialog> {
  ArchiveFormat _format = ArchiveFormat.tarGz;
  final TextEditingController _outputController = TextEditingController();
  final TextEditingController _includeController = TextEditingController();
  final TextEditingController _excludeController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  bool _overwrite = false;
  bool _createDirs = true;

  @override
  void initState() {
    super.initState();
    _updateOutputPath();
  }

  @override
  void dispose() {
    _outputController.dispose();
    _includeController.dispose();
    _excludeController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  void _updateOutputPath() {
    if (_outputController.text.isEmpty || 
        _outputController.text == 'archive.zip' || 
        _outputController.text == 'archive.tar' || 
        _outputController.text == 'archive.tar.gz') {
      switch (_format) {
        case ArchiveFormat.zip:
          _outputController.text = 'archive.zip';
          break;
        case ArchiveFormat.tar:
          _outputController.text = 'archive.tar';
          break;
        case ArchiveFormat.tarGz:
          _outputController.text = 'archive.tar.gz';
          break;
      }
    }
  }

  void _handleSubmit() {
    late OperationRequest request;

    if (widget.operation == 'create') {
      final includePaths = _includeController.text.trim().isNotEmpty
          ? _includeController.text.split(',').map((p) => p.trim()).toList()
          : widget.selectedFile != null 
            ? [widget.selectedFile!.name]
            : [widget.currentPath];
      
      var excludePatterns = _excludeController.text.trim().isNotEmpty
          ? _excludeController.text.split(',').map((p) => p.trim()).toList()
          : <String>[];

      // Auto-exclude the output file
      if (_outputController.text.isNotEmpty) {
        excludePatterns.add(_outputController.text);
      }

      final options = ArchiveOperationBuilder.buildCreateArchiveOptions(
        format: _format,
        outputPath: _outputController.text,
        includePaths: includePaths,
        excludePatterns: excludePatterns.isEmpty ? null : excludePatterns,
        compression: _format == ArchiveFormat.tarGz ? 'gzip' : null,
      );

      request = OperationRequest(
        command: 'create-archive',
        options: options,
        services: [],
      );

    } else {
      final options = ArchiveOperationBuilder.buildExtractArchiveOptions(
        archivePath: widget.selectedFile?.name ?? '',
        destinationPath: _destinationController.text.trim().isEmpty ? null : _destinationController.text.trim(),
        overwrite: _overwrite,
        createDirs: _createDirs,
      );

      request = OperationRequest(
        command: 'extract-archive',
        options: options,
        services: [],
      );
    }

    // Close this dialog first
    Navigator.of(context).pop();
    
    // Add a small delay to ensure the dialog closes before starting the operation
    Future.delayed(const Duration(milliseconds: 100), () {
      try {
        widget.onOperationStart(request);
      } catch (e) {
        // Log error but don't prevent dialog from closing
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return AlertDialog(
      title: Text(widget.operation == 'create' ? 'Create Archive' : 'Extract Archive'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.operation == 'create') ...[
              // Archive Format
              Text('Archive Format', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              DropdownButtonFormField<ArchiveFormat>(
                initialValue: _format,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      _format = value;
                      _updateOutputPath();
                    });
                  }
                },
                items: ArchiveFormat.values.map((format) =>
                  DropdownMenuItem(
                    value: format,
                    child: Text(ArchiveOperationBuilder.getFormatDisplayName(format)),
                  ),
                ).toList(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 16),

              // Output Path
              Text('Output Path', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              TextFormField(
                controller: _outputController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'archive.tar.gz',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 16),

              // Include Paths
              Text('Include Paths (comma-separated, leave empty to include all)', 
                   style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              TextFormField(
                controller: _includeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'file1.txt, folder1, *.pdf',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 16),

              // Exclude Patterns
              Text('Exclude Patterns (comma-separated)', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              TextFormField(
                controller: _excludeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '*.log, temp*, .git',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Note: The output file is automatically excluded to prevent self-reference',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ] else ...[
              // Extract Archive
              Text('Archive File', style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: widget.selectedFile?.name ?? '',
                enabled: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 16),

              // Destination Path
              Text('Destination Path (leave empty for current directory)', 
                   style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              TextFormField(
                controller: _destinationController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'extracted/',
                  contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
              ),
              const SizedBox(height: 16),

              // Options
              CheckboxListTile(
                title: const Text('Overwrite existing files'),
                value: _overwrite,
                onChanged: (value) => setState(() => _overwrite = value ?? false),
                contentPadding: EdgeInsets.zero,
              ),
              CheckboxListTile(
                title: const Text('Create directories if they don\'t exist'),
                value: _createDirs,
                onChanged: (value) => setState(() => _createDirs = value ?? true),
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _handleSubmit,
          child: Text(widget.operation == 'create' ? 'Create Archive' : 'Extract Archive'),
        ),
      ],
    );
  }
}