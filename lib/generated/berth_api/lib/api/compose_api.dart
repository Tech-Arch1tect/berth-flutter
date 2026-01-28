//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ComposeApi {
  ComposeApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get compose configuration
  ///
  /// Returns the parsed Docker Compose configuration for a stack. Requires files.read permission.
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
  Future<Response> apiV1ServersServeridStacksStacknameComposeGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/compose'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get compose configuration
  ///
  /// Returns the parsed Docker Compose configuration for a stack. Requires files.read permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<RawComposeConfig?> apiV1ServersServeridStacksStacknameComposeGet(int serverid, String stackname,) async {
    final response = await apiV1ServersServeridStacksStacknameComposeGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RawComposeConfig',) as RawComposeConfig;
    
    }
    return null;
  }

  /// Update compose configuration
  ///
  /// Updates the Docker Compose configuration with the specified changes. Supports preview mode to see changes without applying. Requires files.write permission.
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
  /// * [UpdateComposeRequest] updateComposeRequest (required):
  ///   Changes to apply to the compose file
  Future<Response> apiV1ServersServeridStacksStacknameComposePatchWithHttpInfo(int serverid, String stackname, UpdateComposeRequest updateComposeRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/compose'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody = updateComposeRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PATCH',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update compose configuration
  ///
  /// Updates the Docker Compose configuration with the specified changes. Supports preview mode to see changes without applying. Requires files.write permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [UpdateComposeRequest] updateComposeRequest (required):
  ///   Changes to apply to the compose file
  Future<UpdateComposeResponse?> apiV1ServersServeridStacksStacknameComposePatch(int serverid, String stackname, UpdateComposeRequest updateComposeRequest,) async {
    final response = await apiV1ServersServeridStacksStacknameComposePatchWithHttpInfo(serverid, stackname, updateComposeRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UpdateComposeResponse',) as UpdateComposeResponse;
    
    }
    return null;
  }
}
