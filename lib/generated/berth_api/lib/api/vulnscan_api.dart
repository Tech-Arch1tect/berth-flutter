//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class VulnscanApi {
  VulnscanApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get latest scan for stack
  ///
  /// Returns the most recent vulnerability scan and summary for a stack. Requires stacks.read permission.
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
  Future<Response> apiV1ServersServeridStacksStacknameVulnscanGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/vulnscan'
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

  /// Get latest scan for stack
  ///
  /// Returns the most recent vulnerability scan and summary for a stack. Requires stacks.read permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<GetLatestScanResponse?> apiV1ServersServeridStacksStacknameVulnscanGet(int serverid, String stackname,) async {
    final response = await apiV1ServersServeridStacksStacknameVulnscanGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetLatestScanResponse',) as GetLatestScanResponse;
    
    }
    return null;
  }

  /// Get scan history for stack
  ///
  /// Returns all vulnerability scans for a stack with summaries. Requires stacks.read permission.
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
  Future<Response> apiV1ServersServeridStacksStacknameVulnscanHistoryGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/vulnscan/history'
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

  /// Get scan history for stack
  ///
  /// Returns all vulnerability scans for a stack with summaries. Requires stacks.read permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<GetScansHistoryResponse?> apiV1ServersServeridStacksStacknameVulnscanHistoryGet(int serverid, String stackname,) async {
    final response = await apiV1ServersServeridStacksStacknameVulnscanHistoryGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetScansHistoryResponse',) as GetScansHistoryResponse;
    
    }
    return null;
  }

  /// Start vulnerability scan
  ///
  /// Starts a vulnerability scan for a stack. Requires stacks.read permission.
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
  /// * [StartScanRequest] startScanRequest (required):
  ///   Optional list of services to scan
  Future<Response> apiV1ServersServeridStacksStacknameVulnscanPostWithHttpInfo(int serverid, String stackname, StartScanRequest startScanRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/vulnscan'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody = startScanRequest;

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

  /// Start vulnerability scan
  ///
  /// Starts a vulnerability scan for a stack. Requires stacks.read permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [StartScanRequest] startScanRequest (required):
  ///   Optional list of services to scan
  Future<StartScanResponse?> apiV1ServersServeridStacksStacknameVulnscanPost(int serverid, String stackname, StartScanRequest startScanRequest,) async {
    final response = await apiV1ServersServeridStacksStacknameVulnscanPostWithHttpInfo(serverid, stackname, startScanRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StartScanResponse',) as StartScanResponse;
    
    }
    return null;
  }

  /// Get scan trend for stack
  ///
  /// Returns vulnerability trend data for a stack. Requires stacks.read permission.
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
  /// * [int] limit:
  ///   Maximum number of scans to include (default 10, max 50)
  Future<Response> apiV1ServersServeridStacksStacknameVulnscanTrendGetWithHttpInfo(int serverid, String stackname, { int? limit, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/vulnscan/trend'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get scan trend for stack
  ///
  /// Returns vulnerability trend data for a stack. Requires stacks.read permission.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [int] limit:
  ///   Maximum number of scans to include (default 10, max 50)
  Future<GetScanTrendResponse?> apiV1ServersServeridStacksStacknameVulnscanTrendGet(int serverid, String stackname, { int? limit, }) async {
    final response = await apiV1ServersServeridStacksStacknameVulnscanTrendGetWithHttpInfo(serverid, stackname,  limit: limit, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetScanTrendResponse',) as GetScanTrendResponse;
    
    }
    return null;
  }

  /// Compare two scans
  ///
  /// Compares two vulnerability scans and returns new, fixed, and unchanged vulnerabilities. Both scans must be from the same stack. Requires stacks.read permission.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] baseScanId (required):
  ///   Base scan ID
  ///
  /// * [int] compareScanId (required):
  ///   Comparison scan ID
  Future<Response> apiV1VulnscanCompareBaseScanIdCompareScanIdGetWithHttpInfo(int baseScanId, int compareScanId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/vulnscan/compare/{baseScanId}/{compareScanId}'
      .replaceAll('{baseScanId}', baseScanId.toString())
      .replaceAll('{compareScanId}', compareScanId.toString());

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

  /// Compare two scans
  ///
  /// Compares two vulnerability scans and returns new, fixed, and unchanged vulnerabilities. Both scans must be from the same stack. Requires stacks.read permission.
  ///
  /// Parameters:
  ///
  /// * [int] baseScanId (required):
  ///   Base scan ID
  ///
  /// * [int] compareScanId (required):
  ///   Comparison scan ID
  Future<CompareScanResponse?> apiV1VulnscanCompareBaseScanIdCompareScanIdGet(int baseScanId, int compareScanId,) async {
    final response = await apiV1VulnscanCompareBaseScanIdCompareScanIdGetWithHttpInfo(baseScanId, compareScanId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CompareScanResponse',) as CompareScanResponse;
    
    }
    return null;
  }

  /// Get scan by ID
  ///
  /// Returns a specific vulnerability scan with all vulnerabilities. Requires stacks.read permission for the scanned stack.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] scanid (required):
  ///   Scan ID
  Future<Response> apiV1VulnscanScanidGetWithHttpInfo(int scanid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/vulnscan/{scanid}'
      .replaceAll('{scanid}', scanid.toString());

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

  /// Get scan by ID
  ///
  /// Returns a specific vulnerability scan with all vulnerabilities. Requires stacks.read permission for the scanned stack.
  ///
  /// Parameters:
  ///
  /// * [int] scanid (required):
  ///   Scan ID
  Future<GetScanResponse?> apiV1VulnscanScanidGet(int scanid,) async {
    final response = await apiV1VulnscanScanidGetWithHttpInfo(scanid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetScanResponse',) as GetScanResponse;
    
    }
    return null;
  }

  /// Get scan summary
  ///
  /// Returns vulnerability counts by severity for a scan. Requires stacks.read permission for the scanned stack.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] scanid (required):
  ///   Scan ID
  Future<Response> apiV1VulnscanScanidSummaryGetWithHttpInfo(int scanid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/vulnscan/{scanid}/summary'
      .replaceAll('{scanid}', scanid.toString());

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

  /// Get scan summary
  ///
  /// Returns vulnerability counts by severity for a scan. Requires stacks.read permission for the scanned stack.
  ///
  /// Parameters:
  ///
  /// * [int] scanid (required):
  ///   Scan ID
  Future<GetScanSummaryResponse?> apiV1VulnscanScanidSummaryGet(int scanid,) async {
    final response = await apiV1VulnscanScanidSummaryGetWithHttpInfo(scanid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetScanSummaryResponse',) as GetScanSummaryResponse;
    
    }
    return null;
  }
}
