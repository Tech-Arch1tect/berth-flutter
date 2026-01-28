//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ImageUpdatesApi {
  ImageUpdatesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// List available image updates
  ///
  /// Returns all container images with available updates across servers the user can access
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1ImageUpdatesGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/image-updates';

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

  /// List available image updates
  ///
  /// Returns all container images with available updates across servers the user can access
  Future<ImageUpdatesResponse?> apiV1ImageUpdatesGet() async {
    final response = await apiV1ImageUpdatesGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ImageUpdatesResponse',) as ImageUpdatesResponse;
    
    }
    return null;
  }

  /// List server image updates
  ///
  /// Returns container images with available updates for a specific server
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<Response> apiV1ServersServeridImageUpdatesGetWithHttpInfo(int serverid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/image-updates'
      .replaceAll('{serverid}', serverid.toString());

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

  /// List server image updates
  ///
  /// Returns container images with available updates for a specific server
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<ImageUpdatesResponse?> apiV1ServersServeridImageUpdatesGet(int serverid,) async {
    final response = await apiV1ServersServeridImageUpdatesGetWithHttpInfo(serverid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ImageUpdatesResponse',) as ImageUpdatesResponse;
    
    }
    return null;
  }
}
