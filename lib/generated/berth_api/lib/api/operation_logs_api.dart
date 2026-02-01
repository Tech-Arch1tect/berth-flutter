//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class OperationLogsApi {
  OperationLogsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// List all operation logs
  ///
  /// Returns paginated list of all operation logs. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [int] pageSize:
  ///   Number of items per page
  ///
  /// * [String] search:
  ///   Search term for stack name, command, or operation ID
  ///
  /// * [String] serverId:
  ///   Filter by server ID
  ///
  /// * [String] stackName:
  ///   Filter by stack name (partial match)
  ///
  /// * [String] command:
  ///   Filter by command
  ///
  /// * [String] status:
  ///   Filter by status
  ///
  /// * [int] daysBack:
  ///   Only return logs from the last N days
  Future<Response> apiV1AdminOperationLogsGetWithHttpInfo({ int? page, int? pageSize, String? search, String? serverId, String? stackName, String? command, String? status, int? daysBack, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/operation-logs';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'page_size', pageSize));
    }
    if (search != null) {
      queryParams.addAll(_queryParams('', 'search', search));
    }
    if (serverId != null) {
      queryParams.addAll(_queryParams('', 'server_id', serverId));
    }
    if (stackName != null) {
      queryParams.addAll(_queryParams('', 'stack_name', stackName));
    }
    if (command != null) {
      queryParams.addAll(_queryParams('', 'command', command));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (daysBack != null) {
      queryParams.addAll(_queryParams('', 'days_back', daysBack));
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

  /// List all operation logs
  ///
  /// Returns paginated list of all operation logs. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [int] pageSize:
  ///   Number of items per page
  ///
  /// * [String] search:
  ///   Search term for stack name, command, or operation ID
  ///
  /// * [String] serverId:
  ///   Filter by server ID
  ///
  /// * [String] stackName:
  ///   Filter by stack name (partial match)
  ///
  /// * [String] command:
  ///   Filter by command
  ///
  /// * [String] status:
  ///   Filter by status
  ///
  /// * [int] daysBack:
  ///   Only return logs from the last N days
  Future<PaginatedOperationLogsResponse?> apiV1AdminOperationLogsGet({ int? page, int? pageSize, String? search, String? serverId, String? stackName, String? command, String? status, int? daysBack, }) async {
    final response = await apiV1AdminOperationLogsGetWithHttpInfo( page: page, pageSize: pageSize, search: search, serverId: serverId, stackName: stackName, command: command, status: status, daysBack: daysBack, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PaginatedOperationLogsResponse',) as PaginatedOperationLogsResponse;
    
    }
    return null;
  }

  /// Get operation log details
  ///
  /// Returns detailed information about a specific operation log including all messages. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Operation log ID
  Future<Response> apiV1AdminOperationLogsIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/operation-logs/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Get operation log details
  ///
  /// Returns detailed information about a specific operation log including all messages. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Operation log ID
  Future<OperationLogDetailResponse?> apiV1AdminOperationLogsIdGet(int id,) async {
    final response = await apiV1AdminOperationLogsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OperationLogDetailResponse',) as OperationLogDetailResponse;
    
    }
    return null;
  }

  /// Get operation logs statistics
  ///
  /// Returns aggregated statistics for all operation logs. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1AdminOperationLogsStatsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/operation-logs/stats';

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

  /// Get operation logs statistics
  ///
  /// Returns aggregated statistics for all operation logs. Requires admin permissions.
  Future<OperationLogStatsResponse?> apiV1AdminOperationLogsStatsGet() async {
    final response = await apiV1AdminOperationLogsStatsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OperationLogStatsResponse',) as OperationLogStatsResponse;
    
    }
    return null;
  }

  /// Get operation log details by operation ID
  ///
  /// Returns detailed information about a specific operation log by its operation ID. Only returns logs belonging to the authenticated user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] operationId (required):
  ///   Operation ID (UUID)
  Future<Response> apiV1OperationLogsByOperationIdOperationIdGetWithHttpInfo(String operationId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/operation-logs/by-operation-id/{operationId}'
      .replaceAll('{operationId}', operationId);

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

  /// Get operation log details by operation ID
  ///
  /// Returns detailed information about a specific operation log by its operation ID. Only returns logs belonging to the authenticated user.
  ///
  /// Parameters:
  ///
  /// * [String] operationId (required):
  ///   Operation ID (UUID)
  Future<OperationLogDetailResponse?> apiV1OperationLogsByOperationIdOperationIdGet(String operationId,) async {
    final response = await apiV1OperationLogsByOperationIdOperationIdGetWithHttpInfo(operationId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OperationLogDetailResponse',) as OperationLogDetailResponse;
    
    }
    return null;
  }

  /// List user's operation logs
  ///
  /// Returns paginated list of operation logs for the authenticated user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [int] pageSize:
  ///   Number of items per page
  ///
  /// * [String] search:
  ///   Search term for stack name, command, or operation ID
  ///
  /// * [String] serverId:
  ///   Filter by server ID
  ///
  /// * [String] stackName:
  ///   Filter by stack name (partial match)
  ///
  /// * [String] command:
  ///   Filter by command
  ///
  /// * [String] status:
  ///   Filter by status
  ///
  /// * [int] daysBack:
  ///   Only return logs from the last N days
  Future<Response> apiV1OperationLogsGetWithHttpInfo({ int? page, int? pageSize, String? search, String? serverId, String? stackName, String? command, String? status, int? daysBack, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/operation-logs';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }
    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'page_size', pageSize));
    }
    if (search != null) {
      queryParams.addAll(_queryParams('', 'search', search));
    }
    if (serverId != null) {
      queryParams.addAll(_queryParams('', 'server_id', serverId));
    }
    if (stackName != null) {
      queryParams.addAll(_queryParams('', 'stack_name', stackName));
    }
    if (command != null) {
      queryParams.addAll(_queryParams('', 'command', command));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (daysBack != null) {
      queryParams.addAll(_queryParams('', 'days_back', daysBack));
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

  /// List user's operation logs
  ///
  /// Returns paginated list of operation logs for the authenticated user.
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [int] pageSize:
  ///   Number of items per page
  ///
  /// * [String] search:
  ///   Search term for stack name, command, or operation ID
  ///
  /// * [String] serverId:
  ///   Filter by server ID
  ///
  /// * [String] stackName:
  ///   Filter by stack name (partial match)
  ///
  /// * [String] command:
  ///   Filter by command
  ///
  /// * [String] status:
  ///   Filter by status
  ///
  /// * [int] daysBack:
  ///   Only return logs from the last N days
  Future<PaginatedOperationLogsResponse?> apiV1OperationLogsGet({ int? page, int? pageSize, String? search, String? serverId, String? stackName, String? command, String? status, int? daysBack, }) async {
    final response = await apiV1OperationLogsGetWithHttpInfo( page: page, pageSize: pageSize, search: search, serverId: serverId, stackName: stackName, command: command, status: status, daysBack: daysBack, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PaginatedOperationLogsResponse',) as PaginatedOperationLogsResponse;
    
    }
    return null;
  }

  /// Get operation log details
  ///
  /// Returns detailed information about a specific operation log including all messages. Only returns logs belonging to the authenticated user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Operation log ID
  Future<Response> apiV1OperationLogsIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/operation-logs/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Get operation log details
  ///
  /// Returns detailed information about a specific operation log including all messages. Only returns logs belonging to the authenticated user.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Operation log ID
  Future<OperationLogDetailResponse?> apiV1OperationLogsIdGet(int id,) async {
    final response = await apiV1OperationLogsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OperationLogDetailResponse',) as OperationLogDetailResponse;
    
    }
    return null;
  }

  /// Get user's operation logs statistics
  ///
  /// Returns aggregated statistics for the authenticated user's operation logs.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1OperationLogsStatsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/operation-logs/stats';

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

  /// Get user's operation logs statistics
  ///
  /// Returns aggregated statistics for the authenticated user's operation logs.
  Future<OperationLogStatsResponse?> apiV1OperationLogsStatsGet() async {
    final response = await apiV1OperationLogsStatsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'OperationLogStatsResponse',) as OperationLogStatsResponse;
    
    }
    return null;
  }

  /// Get running operations
  ///
  /// Returns list of currently running operations for the authenticated user.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1RunningOperationsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/running-operations';

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

  /// Get running operations
  ///
  /// Returns list of currently running operations for the authenticated user.
  Future<RunningOperationsResponse?> apiV1RunningOperationsGet() async {
    final response = await apiV1RunningOperationsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RunningOperationsResponse',) as RunningOperationsResponse;
    
    }
    return null;
  }
}
