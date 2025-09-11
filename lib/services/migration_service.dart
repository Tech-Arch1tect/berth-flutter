import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'api_client.dart';

class MigrationService {
  final ApiClient _apiClient;

  MigrationService(this._apiClient);

  Future<File> exportData(String password) async {
    final response = await _apiClient.post(
      '/api/v1/admin/migration/export',
      body: {'password': password},
    );

    if (response.statusCode != 200) {
      throw Exception('Export failed: ${response.statusCode} ${response.body}');
    }

    
    String filename = 'berth-backup.json';
    final contentDisposition = response.headers['content-disposition'];
    if (contentDisposition != null && contentDisposition.contains('filename=')) {
      final match = RegExp(r'filename="([^"]+)"').firstMatch(contentDisposition);
      if (match != null) {
        filename = match.group(1)!;
      }
    }

    
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$filename');
    await file.writeAsBytes(response.bodyBytes);

    return file;
  }

  Future<Map<String, dynamic>> importData(File backupFile, String password) async {
    final response = await _apiClient.postMultipartWithFields(
      '/api/v1/admin/migration/import',
      backupFile,
      'backup_file',
      {'password': password},
    );

    if (response.statusCode != 200) {
      throw Exception('Import failed: ${response.statusCode} ${response.body}');
    }

    return json.decode(response.body);
  }

  Future<void> downloadBackup(File file, String suggestedName) async {
    final downloadsDir = await getDownloadsDirectory();
    if (downloadsDir == null) {
      throw Exception('Could not access downloads directory');
    }

    final destination = File('${downloadsDir.path}/$suggestedName');
    await file.copy(destination.path);
  }
}