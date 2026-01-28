//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FilesApi {
  FilesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Change file permissions
  ///
  /// Changes the permissions (mode) of a file or directory
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [ChmodRequest] chmodRequest (required):
  ///   Chmod request
  Future<Response> apiV1ServersServeridStacksStacknameFilesChmodPostWithHttpInfo(int serverid, String stackname, ChmodRequest chmodRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/chmod'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody = chmodRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Change file permissions
  ///
  /// Changes the permissions (mode) of a file or directory
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [ChmodRequest] chmodRequest (required):
  ///   Chmod request
  Future<MessageResponse?> apiV1ServersServeridStacksStacknameFilesChmodPost(int serverid, String stackname, ChmodRequest chmodRequest,) async {
    final response = await apiV1ServersServeridStacksStacknameFilesChmodPostWithHttpInfo(serverid, stackname, chmodRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse',) as MessageResponse;
    
    }
    return null;
  }

  /// Change file ownership
  ///
  /// Changes the owner and/or group of a file or directory
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [ChownRequest] chownRequest (required):
  ///   Chown request
  Future<Response> apiV1ServersServeridStacksStacknameFilesChownPostWithHttpInfo(int serverid, String stackname, ChownRequest chownRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/chown'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody = chownRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Change file ownership
  ///
  /// Changes the owner and/or group of a file or directory
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [ChownRequest] chownRequest (required):
  ///   Chown request
  Future<MessageResponse?> apiV1ServersServeridStacksStacknameFilesChownPost(int serverid, String stackname, ChownRequest chownRequest,) async {
    final response = await apiV1ServersServeridStacksStacknameFilesChownPostWithHttpInfo(serverid, stackname, chownRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse',) as MessageResponse;
    
    }
    return null;
  }

  /// Copy file or directory
  ///
  /// Copies a file or directory within a stack's file system
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [CopyRequest] copyRequest (required):
  ///   Copy request
  Future<Response> apiV1ServersServeridStacksStacknameFilesCopyPostWithHttpInfo(int serverid, String stackname, CopyRequest copyRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/copy'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody = copyRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Copy file or directory
  ///
  /// Copies a file or directory within a stack's file system
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [CopyRequest] copyRequest (required):
  ///   Copy request
  Future<MessageResponse?> apiV1ServersServeridStacksStacknameFilesCopyPost(int serverid, String stackname, CopyRequest copyRequest,) async {
    final response = await apiV1ServersServeridStacksStacknameFilesCopyPostWithHttpInfo(serverid, stackname, copyRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse',) as MessageResponse;
    
    }
    return null;
  }

  /// Delete file or directory
  ///
  /// Deletes a file or directory from a stack's file system
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [DeleteRequest2] deleteRequest2 (required):
  ///   Delete request
  Future<Response> apiV1ServersServeridStacksStacknameFilesDeleteDeleteWithHttpInfo(int serverid, String stackname, DeleteRequest2 deleteRequest2,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/delete'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody = deleteRequest2;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete file or directory
  ///
  /// Deletes a file or directory from a stack's file system
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [DeleteRequest2] deleteRequest2 (required):
  ///   Delete request
  Future<MessageResponse?> apiV1ServersServeridStacksStacknameFilesDeleteDelete(int serverid, String stackname, DeleteRequest2 deleteRequest2,) async {
    final response = await apiV1ServersServeridStacksStacknameFilesDeleteDeleteWithHttpInfo(serverid, stackname, deleteRequest2,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse',) as MessageResponse;
    
    }
    return null;
  }

  /// Download a file
  ///
  /// Downloads a file from a stack's file system
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] filePath (required):
  ///   File path to download
  ///
  /// * [String] filename:
  ///   Optional filename for the downloaded file
  Future<Response> apiV1ServersServeridStacksStacknameFilesDownloadGetWithHttpInfo(int serverid, String stackname, String filePath, { String? filename, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/download'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'filePath', filePath));
    if (filename != null) {
      queryParams.addAll(_queryParams('', 'filename', filename));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Download a file
  ///
  /// Downloads a file from a stack's file system
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] filePath (required):
  ///   File path to download
  ///
  /// * [String] filename:
  ///   Optional filename for the downloaded file
  Future<MultipartFile?> apiV1ServersServeridStacksStacknameFilesDownloadGet(int serverid, String stackname, String filePath, { String? filename, }) async {
    final response = await apiV1ServersServeridStacksStacknameFilesDownloadGetWithHttpInfo(serverid, stackname, filePath,  filename: filename, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultipartFile',) as MultipartFile;
    
    }
    return null;
  }

  /// List directory contents
  ///
  /// Returns the contents of a directory within a stack's file system
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] filePath:
  ///   Directory path to list
  Future<Response> apiV1ServersServeridStacksStacknameFilesGetWithHttpInfo(int serverid, String stackname, { String? filePath, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (filePath != null) {
      queryParams.addAll(_queryParams('', 'filePath', filePath));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List directory contents
  ///
  /// Returns the contents of a directory within a stack's file system
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] filePath:
  ///   Directory path to list
  Future<DirectoryListing?> apiV1ServersServeridStacksStacknameFilesGet(int serverid, String stackname, { String? filePath, }) async {
    final response = await apiV1ServersServeridStacksStacknameFilesGetWithHttpInfo(serverid, stackname,  filePath: filePath, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DirectoryListing',) as DirectoryListing;
    
    }
    return null;
  }

  /// Create directory
  ///
  /// Creates a new directory within a stack's file system
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [CreateDirectoryRequest] createDirectoryRequest (required):
  ///   Directory creation request
  Future<Response> apiV1ServersServeridStacksStacknameFilesMkdirPostWithHttpInfo(int serverid, String stackname, CreateDirectoryRequest createDirectoryRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/mkdir'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody = createDirectoryRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create directory
  ///
  /// Creates a new directory within a stack's file system
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [CreateDirectoryRequest] createDirectoryRequest (required):
  ///   Directory creation request
  Future<MessageResponse?> apiV1ServersServeridStacksStacknameFilesMkdirPost(int serverid, String stackname, CreateDirectoryRequest createDirectoryRequest,) async {
    final response = await apiV1ServersServeridStacksStacknameFilesMkdirPostWithHttpInfo(serverid, stackname, createDirectoryRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse',) as MessageResponse;
    
    }
    return null;
  }

  /// Read file contents
  ///
  /// Returns the contents of a file within a stack's file system
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] filePath (required):
  ///   File path to read
  Future<Response> apiV1ServersServeridStacksStacknameFilesReadGetWithHttpInfo(int serverid, String stackname, String filePath,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/read'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'filePath', filePath));

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Read file contents
  ///
  /// Returns the contents of a file within a stack's file system
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] filePath (required):
  ///   File path to read
  Future<FileContent?> apiV1ServersServeridStacksStacknameFilesReadGet(int serverid, String stackname, String filePath,) async {
    final response = await apiV1ServersServeridStacksStacknameFilesReadGetWithHttpInfo(serverid, stackname, filePath,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FileContent',) as FileContent;
    
    }
    return null;
  }

  /// Rename file or directory
  ///
  /// Renames or moves a file or directory within a stack's file system
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [RenameRequest] renameRequest (required):
  ///   Rename request
  Future<Response> apiV1ServersServeridStacksStacknameFilesRenamePostWithHttpInfo(int serverid, String stackname, RenameRequest renameRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/rename'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody = renameRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Rename file or directory
  ///
  /// Renames or moves a file or directory within a stack's file system
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [RenameRequest] renameRequest (required):
  ///   Rename request
  Future<MessageResponse?> apiV1ServersServeridStacksStacknameFilesRenamePost(int serverid, String stackname, RenameRequest renameRequest,) async {
    final response = await apiV1ServersServeridStacksStacknameFilesRenamePostWithHttpInfo(serverid, stackname, renameRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse',) as MessageResponse;
    
    }
    return null;
  }

  /// Get directory statistics
  ///
  /// Returns statistics about a directory including most common owner, group, and mode
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] filePath:
  ///   Directory path
  Future<Response> apiV1ServersServeridStacksStacknameFilesStatsGetWithHttpInfo(int serverid, String stackname, { String? filePath, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/stats'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (filePath != null) {
      queryParams.addAll(_queryParams('', 'filePath', filePath));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Get directory statistics
  ///
  /// Returns statistics about a directory including most common owner, group, and mode
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] filePath:
  ///   Directory path
  Future<DirectoryStats?> apiV1ServersServeridStacksStacknameFilesStatsGet(int serverid, String stackname, { String? filePath, }) async {
    final response = await apiV1ServersServeridStacksStacknameFilesStatsGetWithHttpInfo(serverid, stackname,  filePath: filePath, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DirectoryStats',) as DirectoryStats;
    
    }
    return null;
  }

  /// Upload a file
  ///
  /// Uploads a file to a stack's file system using multipart form data
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [MultipartFile] file (required):
  ///
  /// * [String] filePath:
  Future<Response> apiV1ServersServeridStacksStacknameFilesUploadPostWithHttpInfo(int serverid, String stackname, MultipartFile file, { String? filePath, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/upload'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (file != null) {
      hasFields = true;
      mp.fields[r'file'] = file.field;
      mp.files.add(file);
    }
    if (filePath != null) {
      hasFields = true;
      mp.fields[r'filePath'] = parameterToString(filePath);
    }
    if (hasFields) {
      postBody = mp;
    }

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Upload a file
  ///
  /// Uploads a file to a stack's file system using multipart form data
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [MultipartFile] file (required):
  ///
  /// * [String] filePath:
  Future<MessageResponse?> apiV1ServersServeridStacksStacknameFilesUploadPost(int serverid, String stackname, MultipartFile file, { String? filePath, }) async {
    final response = await apiV1ServersServeridStacksStacknameFilesUploadPostWithHttpInfo(serverid, stackname, file,  filePath: filePath, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse',) as MessageResponse;
    
    }
    return null;
  }

  /// Write file contents
  ///
  /// Writes content to a file within a stack's file system
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [WriteFileRequest] writeFileRequest (required):
  ///   File write request
  Future<Response> apiV1ServersServeridStacksStacknameFilesWritePostWithHttpInfo(int serverid, String stackname, WriteFileRequest writeFileRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/files/write'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody = writeFileRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Write file contents
  ///
  /// Writes content to a file within a stack's file system
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [WriteFileRequest] writeFileRequest (required):
  ///   File write request
  Future<MessageResponse?> apiV1ServersServeridStacksStacknameFilesWritePost(int serverid, String stackname, WriteFileRequest writeFileRequest,) async {
    final response = await apiV1ServersServeridStacksStacknameFilesWritePostWithHttpInfo(serverid, stackname, writeFileRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MessageResponse',) as MessageResponse;
    
    }
    return null;
  }
}
