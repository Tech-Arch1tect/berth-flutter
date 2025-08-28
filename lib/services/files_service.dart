import 'dart:convert';
import 'dart:typed_data';
import '../models/file.dart';
import 'api_client.dart';

class FilesService {
  final ApiClient _apiClient;

  FilesService(this._apiClient);

  Future<DirectoryListing> listDirectory(int serverId, String stackName, [String? path]) async {
    final queryParam = path != null && path.isNotEmpty ? '?path=${Uri.encodeComponent(path)}' : '';
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks/$stackName/files$queryParam');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return DirectoryListing.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 403) {
      throw Exception('Access denied - insufficient permissions');
    } else if (response.statusCode == 404) {
      throw Exception('Path not found');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception(errorData['error'] ?? 'Failed to list directory: ${response.statusCode}');
    }
  }

  Future<FileContent> readFile(int serverId, String stackName, String path) async {
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks/$stackName/files/read?path=${Uri.encodeComponent(path)}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return FileContent.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 403) {
      throw Exception('Access denied - insufficient permissions');
    } else if (response.statusCode == 404) {
      throw Exception('File not found');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception(errorData['error'] ?? 'Failed to read file: ${response.statusCode}');
    }
  }

  Future<void> writeFile(int serverId, String stackName, WriteFileRequest request) async {
    final response = await _apiClient.post('/api/v1/servers/$serverId/stacks/$stackName/files/write', 
      body: request.toJson());

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 403) {
      throw Exception('Access denied - insufficient permissions');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception(errorData['error'] ?? 'Failed to write file: ${response.statusCode}');
    }
  }

  Future<void> createDirectory(int serverId, String stackName, CreateDirectoryRequest request) async {
    final response = await _apiClient.post('/api/v1/servers/$serverId/stacks/$stackName/files/mkdir', 
      body: request.toJson());

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 403) {
      throw Exception('Access denied - insufficient permissions');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception(errorData['error'] ?? 'Failed to create directory: ${response.statusCode}');
    }
  }

  Future<void> deleteFile(int serverId, String stackName, DeleteRequest request) async {
    final response = await _apiClient.deleteWithBody('/api/v1/servers/$serverId/stacks/$stackName/files/delete', 
      body: request.toJson());

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 403) {
      throw Exception('Access denied - insufficient permissions');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception(errorData['error'] ?? 'Failed to delete: ${response.statusCode}');
    }
  }

  Future<void> renameFile(int serverId, String stackName, RenameRequest request) async {
    final response = await _apiClient.post('/api/v1/servers/$serverId/stacks/$stackName/files/rename', 
      body: request.toJson());

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 403) {
      throw Exception('Access denied - insufficient permissions');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception(errorData['error'] ?? 'Failed to rename: ${response.statusCode}');
    }
  }

  Future<void> copyFile(int serverId, String stackName, CopyRequest request) async {
    final response = await _apiClient.post('/api/v1/servers/$serverId/stacks/$stackName/files/copy', 
      body: request.toJson());

    if (response.statusCode == 200) {
      return;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 403) {
      throw Exception('Access denied - insufficient permissions');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception(errorData['error'] ?? 'Failed to copy: ${response.statusCode}');
    }
  }

  Future<FileInfo> getFileInfo(int serverId, String stackName, String path) async {
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks/$stackName/files/info?path=${Uri.encodeComponent(path)}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return FileInfo.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 403) {
      throw Exception('Access denied - insufficient permissions');
    } else if (response.statusCode == 404) {
      throw Exception('File not found');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception(errorData['error'] ?? 'Failed to get file info: ${response.statusCode}');
    }
  }

  Future<Uint8List> downloadFile(int serverId, String stackName, String path, [String? filename]) async {
    final queryParams = <String, String>{'path': path};
    if (filename != null && filename.isNotEmpty) {
      queryParams['filename'] = filename;
    }
    
    final queryString = queryParams.entries
        .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
        .join('&');
    
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks/$stackName/files/download?$queryString');

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 403) {
      throw Exception('Access denied - insufficient permissions');
    } else if (response.statusCode == 404) {
      throw Exception('File not found');
    } else {
      final Map<String, dynamic> errorData = json.decode(response.body);
      throw Exception(errorData['error'] ?? 'Failed to download file: ${response.statusCode}');
    }
  }
}