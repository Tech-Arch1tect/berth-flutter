//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MigrationApi {
  MigrationApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Export data
  ///
  /// Export all configuration data (users, roles, servers, etc.) as an encrypted backup file. Requires admin.system.export permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [ExportRequest] exportRequest (required):
  ///   Export password (min 12 characters)
  Future<Response> apiV1AdminMigrationExportPostWithHttpInfo(ExportRequest exportRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/migration/export';

    // ignore: prefer_final_locals
    Object? postBody = exportRequest;

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

  /// Export data
  ///
  /// Export all configuration data (users, roles, servers, etc.) as an encrypted backup file. Requires admin.system.export permission.
  ///
  /// Parameters:
  ///
  /// * [ExportRequest] exportRequest (required):
  ///   Export password (min 12 characters)
  Future<MultipartFile?> apiV1AdminMigrationExportPost(ExportRequest exportRequest,) async {
    final response = await apiV1AdminMigrationExportPostWithHttpInfo(exportRequest,);
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

  /// Import data
  ///
  /// Import configuration data from an encrypted backup file. WARNING: This will completely replace all existing data. Requires admin.system.import permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] backupFile (required):
  ///
  /// * [String] password (required):
  Future<Response> apiV1AdminMigrationImportPostWithHttpInfo(MultipartFile backupFile, String password,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/migration/import';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (backupFile != null) {
      hasFields = true;
      mp.fields[r'backup_file'] = backupFile.field;
      mp.files.add(backupFile);
    }
    if (password != null) {
      hasFields = true;
      mp.fields[r'password'] = parameterToString(password);
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

  /// Import data
  ///
  /// Import configuration data from an encrypted backup file. WARNING: This will completely replace all existing data. Requires admin.system.import permission.
  ///
  /// Parameters:
  ///
  /// * [MultipartFile] backupFile (required):
  ///
  /// * [String] password (required):
  Future<ImportResponse?> apiV1AdminMigrationImportPost(MultipartFile backupFile, String password,) async {
    final response = await apiV1AdminMigrationImportPostWithHttpInfo(backupFile, password,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ImportResponse',) as ImportResponse;
    
    }
    return null;
  }
}
