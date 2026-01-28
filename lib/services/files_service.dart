import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'package:http/http.dart' as http;
import 'berth_api_provider.dart';

class FilesService {
  final BerthApiProvider _berthApiProvider;

  FilesService(this._berthApiProvider);

  Future<berth_api.DirectoryListing> listDirectory(int serverId, String stackName, [String? path]) async {
    debugPrint('[FilesService] listDirectory: serverId=$serverId, stackName=$stackName, path=$path');
    try {
      final response = await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesGet(
        serverId,
        stackName,
        filePath: path,
      );
      if (response == null) {
        throw Exception('Failed to list directory: null response');
      }
      debugPrint('[FilesService] listDirectory: returned ${response.entries.length} entries');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] listDirectory: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      } else if (e.code == 404) {
        throw Exception('Path not found');
      }
      throw Exception('Failed to list directory: ${e.code}');
    }
  }

  Future<berth_api.FileContent> readFile(int serverId, String stackName, String path) async {
    debugPrint('[FilesService] readFile: serverId=$serverId, stackName=$stackName, path=$path');
    try {
      final response = await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesReadGet(
        serverId,
        stackName,
        path,
      );
      if (response == null) {
        throw Exception('Failed to read file: null response');
      }
      debugPrint('[FilesService] readFile: returned file with ${response.size} bytes');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] readFile: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      } else if (e.code == 404) {
        throw Exception('File not found');
      }
      throw Exception('Failed to read file: ${e.code}');
    }
  }

  Future<void> writeFile(int serverId, String stackName, berth_api.WriteFileRequest request) async {
    debugPrint('[FilesService] writeFile: serverId=$serverId, stackName=$stackName, path=${request.path}');
    try {
      await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesWritePost(
        serverId,
        stackName,
        request,
      );
      debugPrint('[FilesService] writeFile: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] writeFile: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      }
      throw Exception('Failed to write file: ${e.code}');
    }
  }

  Future<void> createDirectory(int serverId, String stackName, berth_api.CreateDirectoryRequest request) async {
    debugPrint('[FilesService] createDirectory: serverId=$serverId, stackName=$stackName, path=${request.path}');
    try {
      await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesMkdirPost(
        serverId,
        stackName,
        request,
      );
      debugPrint('[FilesService] createDirectory: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] createDirectory: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      }
      throw Exception('Failed to create directory: ${e.code}');
    }
  }

  Future<void> deleteFile(int serverId, String stackName, berth_api.DeleteRequest2 request) async {
    debugPrint('[FilesService] deleteFile: serverId=$serverId, stackName=$stackName, path=${request.path}');
    try {
      await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesDeleteDelete(
        serverId,
        stackName,
        request,
      );
      debugPrint('[FilesService] deleteFile: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] deleteFile: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      }
      throw Exception('Failed to delete: ${e.code}');
    }
  }

  Future<void> renameFile(int serverId, String stackName, berth_api.RenameRequest request) async {
    debugPrint('[FilesService] renameFile: serverId=$serverId, stackName=$stackName');
    try {
      await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesRenamePost(
        serverId,
        stackName,
        request,
      );
      debugPrint('[FilesService] renameFile: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] renameFile: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      }
      throw Exception('Failed to rename: ${e.code}');
    }
  }

  Future<void> copyFile(int serverId, String stackName, berth_api.CopyRequest request) async {
    debugPrint('[FilesService] copyFile: serverId=$serverId, stackName=$stackName');
    try {
      await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesCopyPost(
        serverId,
        stackName,
        request,
      );
      debugPrint('[FilesService] copyFile: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] copyFile: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      }
      throw Exception('Failed to copy: ${e.code}');
    }
  }

  Future<void> uploadFile(int serverId, String stackName, String path, File file, String filename) async {
    debugPrint('[FilesService] uploadFile: serverId=$serverId, stackName=$stackName, path=$path, filename=$filename');
    try {
      final targetPath = path.isEmpty ? filename : '$path/$filename';
      final bytes = await file.readAsBytes();
      final multipartFile = http.MultipartFile.fromBytes(
        'file',
        bytes,
        filename: filename,
      );
      await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesUploadPost(
        serverId,
        stackName,
        multipartFile,
        filePath: targetPath,
      );
      debugPrint('[FilesService] uploadFile: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] uploadFile: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      }
      throw Exception('Failed to upload file: ${e.code}');
    }
  }

  Future<Uint8List> downloadFile(int serverId, String stackName, String path, [String? filename]) async {
    debugPrint('[FilesService] downloadFile: serverId=$serverId, stackName=$stackName, path=$path');
    try {
      final response = await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesDownloadGetWithHttpInfo(
        serverId,
        stackName,
        path,
        filename: filename,
      );
      if (response.statusCode >= 400) {
        throw berth_api.ApiException(response.statusCode, 'Download failed');
      }
      debugPrint('[FilesService] downloadFile: returned ${response.bodyBytes.length} bytes');
      return response.bodyBytes;
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] downloadFile: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      } else if (e.code == 404) {
        throw Exception('File not found');
      }
      throw Exception('Failed to download file: ${e.code}');
    }
  }

  Future<void> chmodFile(int serverId, String stackName, berth_api.ChmodRequest request) async {
    debugPrint('[FilesService] chmodFile: serverId=$serverId, stackName=$stackName, path=${request.path}');
    try {
      await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesChmodPost(
        serverId,
        stackName,
        request,
      );
      debugPrint('[FilesService] chmodFile: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] chmodFile: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      } else if (e.code == 404) {
        throw Exception('File not found');
      }
      throw Exception('Failed to change permissions: ${e.code}');
    }
  }

  Future<void> chownFile(int serverId, String stackName, berth_api.ChownRequest request) async {
    debugPrint('[FilesService] chownFile: serverId=$serverId, stackName=$stackName, path=${request.path}');
    try {
      await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesChownPost(
        serverId,
        stackName,
        request,
      );
      debugPrint('[FilesService] chownFile: success');
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] chownFile: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      } else if (e.code == 404) {
        throw Exception('File not found');
      }
      throw Exception('Failed to change ownership: ${e.code}');
    }
  }

  Future<berth_api.DirectoryStats> getDirectoryStats(int serverId, String stackName, [String? path]) async {
    debugPrint('[FilesService] getDirectoryStats: serverId=$serverId, stackName=$stackName, path=$path');
    try {
      final response = await _berthApiProvider.filesApi.apiV1ServersServeridStacksStacknameFilesStatsGet(
        serverId,
        stackName,
        filePath: path,
      );
      if (response == null) {
        throw Exception('Failed to get directory stats: null response');
      }
      debugPrint('[FilesService] getDirectoryStats: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[FilesService] getDirectoryStats: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 403) {
        throw Exception('Access denied - insufficient permissions');
      } else if (e.code == 404) {
        throw Exception('Directory not found');
      }
      throw Exception('Failed to get directory stats: ${e.code}');
    }
  }
}
