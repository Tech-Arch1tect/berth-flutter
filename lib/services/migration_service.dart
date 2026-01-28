import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'package:http/http.dart' as http;
import 'berth_api_provider.dart';

class MigrationService {
  final BerthApiProvider _berthApiProvider;

  MigrationService(this._berthApiProvider);

  Future<File> exportData(String password) async {
    debugPrint('[MigrationService] exportData: starting export');
    try {
      final request = berth_api.ExportRequest(password: password);
      final response = await _berthApiProvider.migrationApi.apiV1AdminMigrationExportPostWithHttpInfo(request);

      if (response.statusCode >= 400) {
        throw berth_api.ApiException(response.statusCode, response.body);
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

      debugPrint('[MigrationService] exportData: success, saved to ${file.path}');
      return file;
    } on berth_api.ApiException catch (e) {
      debugPrint('[MigrationService] exportData: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Export failed: ${e.code}');
    }
  }

  Future<berth_api.ImportResponse> importData(File backupFile, String password) async {
    debugPrint('[MigrationService] importData: starting import from ${backupFile.path}');
    try {
      final bytes = await backupFile.readAsBytes();
      final multipartFile = http.MultipartFile.fromBytes(
        'backup_file',
        bytes,
        filename: backupFile.path.split('/').last,
      );

      final response = await _berthApiProvider.migrationApi.apiV1AdminMigrationImportPost(
        multipartFile,
        password,
      );

      if (response == null) {
        throw Exception('Import failed: null response');
      }

      debugPrint('[MigrationService] importData: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[MigrationService] importData: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Import failed: ${e.code}');
    }
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
