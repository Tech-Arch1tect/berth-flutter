//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class LogsApi {
  LogsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get container logs
  ///
  /// Returns logs for a specific container in a stack
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
  /// * [String] containerName (required):
  ///   Container name
  ///
  /// * [int] tail:
  ///   Number of log lines to return
  ///
  /// * [String] since:
  ///   Only return logs since this timestamp (RFC3339 format)
  ///
  /// * [bool] timestamps:
  ///   Include timestamps in log output
  Future<Response> apiV1ServersServeridStacksStacknameContainersContainerNameLogsGetWithHttpInfo(int serverid, String stackname, String containerName, { int? tail, String? since, bool? timestamps, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/containers/{containerName}/logs'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname)
      .replaceAll('{containerName}', containerName);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (tail != null) {
      queryParams.addAll(_queryParams('', 'tail', tail));
    }
    if (since != null) {
      queryParams.addAll(_queryParams('', 'since', since));
    }
    if (timestamps != null) {
      queryParams.addAll(_queryParams('', 'timestamps', timestamps));
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

  /// Get container logs
  ///
  /// Returns logs for a specific container in a stack
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] containerName (required):
  ///   Container name
  ///
  /// * [int] tail:
  ///   Number of log lines to return
  ///
  /// * [String] since:
  ///   Only return logs since this timestamp (RFC3339 format)
  ///
  /// * [bool] timestamps:
  ///   Include timestamps in log output
  Future<LogsResponse?> apiV1ServersServeridStacksStacknameContainersContainerNameLogsGet(int serverid, String stackname, String containerName, { int? tail, String? since, bool? timestamps, }) async {
    final response = await apiV1ServersServeridStacksStacknameContainersContainerNameLogsGetWithHttpInfo(serverid, stackname, containerName,  tail: tail, since: since, timestamps: timestamps, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LogsResponse',) as LogsResponse;
    
    }
    return null;
  }

  /// Get stack logs
  ///
  /// Returns logs for all containers in a stack
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
  /// * [int] tail:
  ///   Number of log lines to return
  ///
  /// * [String] since:
  ///   Only return logs since this timestamp (RFC3339 format)
  ///
  /// * [bool] timestamps:
  ///   Include timestamps in log output
  Future<Response> apiV1ServersServeridStacksStacknameLogsGetWithHttpInfo(int serverid, String stackname, { int? tail, String? since, bool? timestamps, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/logs'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (tail != null) {
      queryParams.addAll(_queryParams('', 'tail', tail));
    }
    if (since != null) {
      queryParams.addAll(_queryParams('', 'since', since));
    }
    if (timestamps != null) {
      queryParams.addAll(_queryParams('', 'timestamps', timestamps));
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

  /// Get stack logs
  ///
  /// Returns logs for all containers in a stack
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [int] tail:
  ///   Number of log lines to return
  ///
  /// * [String] since:
  ///   Only return logs since this timestamp (RFC3339 format)
  ///
  /// * [bool] timestamps:
  ///   Include timestamps in log output
  Future<LogsResponse?> apiV1ServersServeridStacksStacknameLogsGet(int serverid, String stackname, { int? tail, String? since, bool? timestamps, }) async {
    final response = await apiV1ServersServeridStacksStacknameLogsGetWithHttpInfo(serverid, stackname,  tail: tail, since: since, timestamps: timestamps, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'LogsResponse',) as LogsResponse;
    
    }
    return null;
  }
}
