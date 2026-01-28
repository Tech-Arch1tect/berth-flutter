import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import '../services/migration_service.dart';
import '../services/berth_api_provider.dart';
import '../theme/app_theme.dart';

class MigrationScreen extends StatefulWidget {
  const MigrationScreen({super.key});

  @override
  State<MigrationScreen> createState() => _MigrationScreenState();
}

class _MigrationScreenState extends State<MigrationScreen> {
  final TextEditingController _exportPasswordController = TextEditingController();
  final TextEditingController _importPasswordController = TextEditingController();
  
  File? _selectedBackupFile;
  bool _exportProcessing = false;
  bool _importProcessing = false;
  String? _importResult;
  String? _encryptionSecret;

  @override
  void dispose() {
    _exportPasswordController.dispose();
    _importPasswordController.dispose();
    super.dispose();
  }

  Future<void> _exportData() async {
    if (_exportPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password is required for export')),
      );
      return;
    }

    if (_exportPasswordController.text.length < 12) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password must be at least 12 characters long')),
      );
      return;
    }

    
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    if (selectedDirectory == null) {
      return; 
    }

    setState(() => _exportProcessing = true);

    try {
      final berthApiProvider = Provider.of<BerthApiProvider>(context, listen: false);
      final migrationService = MigrationService(berthApiProvider);

      final backupFile = await migrationService.exportData(_exportPasswordController.text);
      
      
      final fileName = 'berth-backup-${DateTime.now().millisecondsSinceEpoch}.json';
      final destinationFile = File('$selectedDirectory/$fileName');
      await backupFile.copy(destinationFile.path);
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export completed successfully. Saved to: $selectedDirectory/$fileName'),
            action: SnackBarAction(
              label: 'Open Folder',
              onPressed: () {},
            ),
          ),
        );
        _exportPasswordController.clear();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Export failed: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _exportProcessing = false);
      }
    }
  }

  Future<void> _importData() async {
    if (_importPasswordController.text.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password is required for import')),
        );
      }
      return;
    }

    if (_selectedBackupFile == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Backup file is required for import')),
        );
      }
      return;
    }

    setState(() => _importProcessing = true);

    try {
      final berthApiProvider = Provider.of<BerthApiProvider>(context, listen: false);
      final migrationService = MigrationService(berthApiProvider);

      final result = await migrationService.importData(_selectedBackupFile!, _importPasswordController.text);

      setState(() {
        _importResult = 'Import completed successfully';
        _encryptionSecret = result.data.encryptionSecret;
      });
      
      _importPasswordController.clear();
      _selectedBackupFile = null;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Import failed: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _importProcessing = false);
      }
    }
  }

  Future<void> _pickBackupFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedBackupFile = File(result.files.single.path!);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick file: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text('Data Migration'),
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data Migration',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Export and import your Berth configuration data including users, servers, roles, and permissions',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),

            const SizedBox(height: 32),

            
            _buildSection(
              context: context,
              title: 'Export Data',
              color: Colors.blue,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: BoxDecoration(
                      color: Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Export Information',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '• All users, roles, and permissions with original IDs preserved\n'
                          '• Server configurations and access tokens with original IDs\n'
                          '• TOTP secrets for 2FA users with original IDs\n'
                          '• Role-based access control settings and relationships\n'
                          '• Encryption secret for reference (not imported)\n'
                          '• Auto-increment sequence information for proper reset',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _exportPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Export Password',
                      hintText: 'Enter a strong password to encrypt the export (min 12 chars)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This password will be required to decrypt the backup during import.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _exportProcessing ? null : _exportData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: _exportProcessing
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : const Text('Export Data'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            
            _buildSection(
              context: context,
              title: 'Import Data',
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: BoxDecoration(
                      color: Colors.orange.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '⚠️ Import Warning',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '• This will COMPLETELY REPLACE ALL existing data\n'
                          '• All users, roles, permissions, servers, and TOTP secrets will be replaced\n'
                          '• Original IDs and relationships will be preserved\n'
                          '• Auto-increment sequences will be properly reset\n'
                          '• Ensure you have a backup of current data\n'
                          '• Server agents must be reconfigured after import\n'
                          '• You will need to update your .env file with the encryption secret',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.orange.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _pickBackupFile,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: colorScheme.outline),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.upload_file_rounded),
                          const SizedBox(width: 8),
                          Text(_selectedBackupFile != null
                              ? _selectedBackupFile!.path.split('/').last
                              : 'Select Backup File'),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _importPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Decryption Password',
                      hintText: 'Enter the password used during export',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _importProcessing ? null : _importData,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: _importProcessing
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation(Colors.white),
                              ),
                            )
                          : const Text('Import Data'),
                    ),
                  ),
                ],
              ),
            ),

            
            if (_importResult != null) ...[
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Import Completed Successfully',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _importResult!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.green.shade700,
                      ),
                    ),
                    if (_encryptionSecret != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Required: Update Encryption Secret',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Add this to your .env file:',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.orange.shade700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SelectableText(
                          'ENCRYPTION_SECRET=$_encryptionSecret',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontFamily: 'Monospace',
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Restart the application after updating your .env file.',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.orange.shade700,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required Color color,
    required Widget child,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        GlassCard(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: child,
          ),
        ),
      ],
    );
  }
}