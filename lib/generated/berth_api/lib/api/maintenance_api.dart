//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class MaintenanceApi {
  MaintenanceApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get Docker system information
  ///
  /// Returns detailed Docker system information including disk usage, images, containers, volumes, networks, and build cache
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<Response> apiV1ServersServeridMaintenanceInfoGetWithHttpInfo(int serverid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/maintenance/info'
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

  /// Get Docker system information
  ///
  /// Returns detailed Docker system information including disk usage, images, containers, volumes, networks, and build cache
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<MaintenanceInfo?> apiV1ServersServeridMaintenanceInfoGet(int serverid,) async {
    final response = await apiV1ServersServeridMaintenanceInfoGetWithHttpInfo(serverid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MaintenanceInfo',) as MaintenanceInfo;
    
    }
    return null;
  }

  /// Check maintenance permissions
  ///
  /// Returns the user's read and write permissions for Docker maintenance operations on the server
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<Response> apiV1ServersServeridMaintenancePermissionsGetWithHttpInfo(int serverid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/maintenance/permissions'
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

  /// Check maintenance permissions
  ///
  /// Returns the user's read and write permissions for Docker maintenance operations on the server
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<PermissionsResponse?> apiV1ServersServeridMaintenancePermissionsGet(int serverid,) async {
    final response = await apiV1ServersServeridMaintenancePermissionsGetWithHttpInfo(serverid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PermissionsResponse',) as PermissionsResponse;
    
    }
    return null;
  }

  /// Prune Docker resources
  ///
  /// Removes unused Docker resources such as images, containers, volumes, networks, or build cache
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [PruneRequest] pruneRequest (required):
  ///   Prune request specifying the resource type to prune
  Future<Response> apiV1ServersServeridMaintenancePrunePostWithHttpInfo(int serverid, PruneRequest pruneRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/maintenance/prune'
      .replaceAll('{serverid}', serverid.toString());

    // ignore: prefer_final_locals
    Object? postBody = pruneRequest;

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

  /// Prune Docker resources
  ///
  /// Removes unused Docker resources such as images, containers, volumes, networks, or build cache
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [PruneRequest] pruneRequest (required):
  ///   Prune request specifying the resource type to prune
  Future<PruneResult?> apiV1ServersServeridMaintenancePrunePost(int serverid, PruneRequest pruneRequest,) async {
    final response = await apiV1ServersServeridMaintenancePrunePostWithHttpInfo(serverid, pruneRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PruneResult',) as PruneResult;
    
    }
    return null;
  }

  /// Delete Docker resource
  ///
  /// Deletes a specific Docker resource (image, container, volume, or network) by ID
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [DeleteRequest] deleteRequest (required):
  ///   Delete request specifying the resource type and ID
  Future<Response> apiV1ServersServeridMaintenanceResourceDeleteWithHttpInfo(int serverid, DeleteRequest deleteRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/maintenance/resource'
      .replaceAll('{serverid}', serverid.toString());

    // ignore: prefer_final_locals
    Object? postBody = deleteRequest;

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

  /// Delete Docker resource
  ///
  /// Deletes a specific Docker resource (image, container, volume, or network) by ID
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [DeleteRequest] deleteRequest (required):
  ///   Delete request specifying the resource type and ID
  Future<DeleteResult?> apiV1ServersServeridMaintenanceResourceDelete(int serverid, DeleteRequest deleteRequest,) async {
    final response = await apiV1ServersServeridMaintenanceResourceDeleteWithHttpInfo(serverid, deleteRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DeleteResult',) as DeleteResult;
    
    }
    return null;
  }
}
