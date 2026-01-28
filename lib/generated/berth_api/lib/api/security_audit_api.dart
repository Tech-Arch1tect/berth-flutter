//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SecurityAuditApi {
  SecurityAuditApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// List security audit logs
  ///
  /// Returns paginated list of security audit logs. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [int] perPage:
  ///   Number of items per page
  ///
  /// * [String] eventType:
  ///   Filter by event type
  ///
  /// * [String] eventCategory:
  ///   Filter by event category
  ///
  /// * [String] severity:
  ///   Filter by severity
  ///
  /// * [String] actorUserId:
  ///   Filter by actor user ID
  ///
  /// * [String] success:
  ///   Filter by success status (true/false)
  ///
  /// * [String] startDate:
  ///   Filter by start date (RFC3339 format)
  ///
  /// * [String] endDate:
  ///   Filter by end date (RFC3339 format)
  ///
  /// * [String] search:
  ///   Search in actor username, target name, or event type
  Future<Response> apiV1AdminSecurityAuditLogsGetWithHttpInfo({ int? page, int? perPage, String? eventType, String? eventCategory, String? severity, String? actorUserId, String? success, String? startDate, String? endDate, String? search, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/security-audit-logs';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (page != null) {
      queryParams.addAll(_queryParams('', 'page', page));
    }
    if (perPage != null) {
      queryParams.addAll(_queryParams('', 'per_page', perPage));
    }
    if (eventType != null) {
      queryParams.addAll(_queryParams('', 'event_type', eventType));
    }
    if (eventCategory != null) {
      queryParams.addAll(_queryParams('', 'event_category', eventCategory));
    }
    if (severity != null) {
      queryParams.addAll(_queryParams('', 'severity', severity));
    }
    if (actorUserId != null) {
      queryParams.addAll(_queryParams('', 'actor_user_id', actorUserId));
    }
    if (success != null) {
      queryParams.addAll(_queryParams('', 'success', success));
    }
    if (startDate != null) {
      queryParams.addAll(_queryParams('', 'start_date', startDate));
    }
    if (endDate != null) {
      queryParams.addAll(_queryParams('', 'end_date', endDate));
    }
    if (search != null) {
      queryParams.addAll(_queryParams('', 'search', search));
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

  /// List security audit logs
  ///
  /// Returns paginated list of security audit logs. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] page:
  ///   Page number
  ///
  /// * [int] perPage:
  ///   Number of items per page
  ///
  /// * [String] eventType:
  ///   Filter by event type
  ///
  /// * [String] eventCategory:
  ///   Filter by event category
  ///
  /// * [String] severity:
  ///   Filter by severity
  ///
  /// * [String] actorUserId:
  ///   Filter by actor user ID
  ///
  /// * [String] success:
  ///   Filter by success status (true/false)
  ///
  /// * [String] startDate:
  ///   Filter by start date (RFC3339 format)
  ///
  /// * [String] endDate:
  ///   Filter by end date (RFC3339 format)
  ///
  /// * [String] search:
  ///   Search in actor username, target name, or event type
  Future<ListLogsAPIResponse?> apiV1AdminSecurityAuditLogsGet({ int? page, int? perPage, String? eventType, String? eventCategory, String? severity, String? actorUserId, String? success, String? startDate, String? endDate, String? search, }) async {
    final response = await apiV1AdminSecurityAuditLogsGetWithHttpInfo( page: page, perPage: perPage, eventType: eventType, eventCategory: eventCategory, severity: severity, actorUserId: actorUserId, success: success, startDate: startDate, endDate: endDate, search: search, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListLogsAPIResponse',) as ListLogsAPIResponse;
    
    }
    return null;
  }

  /// Get security audit log details
  ///
  /// Returns detailed information about a specific security audit log. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Security audit log ID
  Future<Response> apiV1AdminSecurityAuditLogsIdGetWithHttpInfo(int id,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/security-audit-logs/{id}'
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

  /// Get security audit log details
  ///
  /// Returns detailed information about a specific security audit log. Requires admin permissions.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   Security audit log ID
  Future<GetLogAPIResponse?> apiV1AdminSecurityAuditLogsIdGet(int id,) async {
    final response = await apiV1AdminSecurityAuditLogsIdGetWithHttpInfo(id,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetLogAPIResponse',) as GetLogAPIResponse;
    
    }
    return null;
  }

  /// Get security audit statistics
  ///
  /// Returns aggregated statistics for security audit logs. Requires admin permissions.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> apiV1AdminSecurityAuditLogsStatsGetWithHttpInfo() async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/admin/security-audit-logs/stats';

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

  /// Get security audit statistics
  ///
  /// Returns aggregated statistics for security audit logs. Requires admin permissions.
  Future<GetStatsAPIResponse?> apiV1AdminSecurityAuditLogsStatsGet() async {
    final response = await apiV1AdminSecurityAuditLogsStatsGetWithHttpInfo();
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetStatsAPIResponse',) as GetStatsAPIResponse;
    
    }
    return null;
  }
}
