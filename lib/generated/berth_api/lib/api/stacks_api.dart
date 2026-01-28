//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class StacksApi {
  StacksApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Check if user can create stacks
  ///
  /// Returns whether the authenticated user has permission to create stacks on the server
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<Response> apiV1ServersServeridStacksCanCreateGetWithHttpInfo(int serverid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/can-create'
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

  /// Check if user can create stacks
  ///
  /// Returns whether the authenticated user has permission to create stacks on the server
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<CanCreateStackResponse?> apiV1ServersServeridStacksCanCreateGet(int serverid,) async {
    final response = await apiV1ServersServeridStacksCanCreateGetWithHttpInfo(serverid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CanCreateStackResponse',) as CanCreateStackResponse;
    
    }
    return null;
  }

  /// List server stacks
  ///
  /// Returns all stacks on a server that the authenticated user has permission to access
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<Response> apiV1ServersServeridStacksGetWithHttpInfo(int serverid,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks'
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

  /// List server stacks
  ///
  /// Returns all stacks on a server that the authenticated user has permission to access
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  Future<ListStacksResponse?> apiV1ServersServeridStacksGet(int serverid,) async {
    final response = await apiV1ServersServeridStacksGetWithHttpInfo(serverid,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListStacksResponse',) as ListStacksResponse;
    
    }
    return null;
  }

  /// Create a new stack
  ///
  /// Creates a new stack on the server
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [CreateStackRequest] createStackRequest (required):
  ///   Stack creation request
  Future<Response> apiV1ServersServeridStacksPostWithHttpInfo(int serverid, CreateStackRequest createStackRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks'
      .replaceAll('{serverid}', serverid.toString());

    // ignore: prefer_final_locals
    Object? postBody = createStackRequest;

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

  /// Create a new stack
  ///
  /// Creates a new stack on the server
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [CreateStackRequest] createStackRequest (required):
  ///   Stack creation request
  Future<CreateStackResponse?> apiV1ServersServeridStacksPost(int serverid, CreateStackRequest createStackRequest,) async {
    final response = await apiV1ServersServeridStacksPostWithHttpInfo(serverid, createStackRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateStackResponse',) as CreateStackResponse;
    
    }
    return null;
  }

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

  /// Get stack environment variables
  ///
  /// Returns environment variables for all services in a stack. Use unmask=true to see sensitive values.
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
  /// * [String] unmask:
  ///   Set to true to unmask sensitive values
  Future<Response> apiV1ServersServeridStacksStacknameEnvironmentGetWithHttpInfo(int serverid, String stackname, { String? unmask, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/environment'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (unmask != null) {
      queryParams.addAll(_queryParams('', 'unmask', unmask));
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

  /// Get stack environment variables
  ///
  /// Returns environment variables for all services in a stack. Use unmask=true to see sensitive values.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] unmask:
  ///   Set to true to unmask sensitive values
  Future<Map<String, List<ServiceEnvironment>>?> apiV1ServersServeridStacksStacknameEnvironmentGet(int serverid, String stackname, { String? unmask, }) async {
    final response = await apiV1ServersServeridStacksStacknameEnvironmentGetWithHttpInfo(serverid, stackname,  unmask: unmask, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return Map<String, List<ServiceEnvironment>>.from(await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Map<String, List<ServiceEnvironment>>'),);

    }
    return null;
  }

  /// Get stack details
  ///
  /// Returns detailed information about a specific stack including services and containers
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
  Future<Response> apiV1ServersServeridStacksStacknameGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}'
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

  /// Get stack details
  ///
  /// Returns detailed information about a specific stack including services and containers
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<StackDetails?> apiV1ServersServeridStacksStacknameGet(int serverid, String stackname,) async {
    final response = await apiV1ServersServeridStacksStacknameGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StackDetails',) as StackDetails;
    
    }
    return null;
  }

  /// Get container image details
  ///
  /// Returns detailed image information for all containers in a stack
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
  Future<Response> apiV1ServersServeridStacksStacknameImagesGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/images'
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

  /// Get container image details
  ///
  /// Returns detailed image information for all containers in a stack
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<StackImagesResponse?> apiV1ServersServeridStacksStacknameImagesGet(int serverid, String stackname,) async {
    final response = await apiV1ServersServeridStacksStacknameImagesGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StackImagesResponse',) as StackImagesResponse;
    
    }
    return null;
  }

  /// Get stack networks
  ///
  /// Returns network information for a specific stack
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
  Future<Response> apiV1ServersServeridStacksStacknameNetworksGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/networks'
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

  /// Get stack networks
  ///
  /// Returns network information for a specific stack
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<StackNetworksResponse?> apiV1ServersServeridStacksStacknameNetworksGet(int serverid, String stackname,) async {
    final response = await apiV1ServersServeridStacksStacknameNetworksGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StackNetworksResponse',) as StackNetworksResponse;
    
    }
    return null;
  }

  /// Check stack permissions
  ///
  /// Returns the list of permissions the authenticated user has for a specific stack
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
  Future<Response> apiV1ServersServeridStacksStacknamePermissionsGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/permissions'
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

  /// Check stack permissions
  ///
  /// Returns the list of permissions the authenticated user has for a specific stack
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<StackPermissionsResponse?> apiV1ServersServeridStacksStacknamePermissionsGet(int serverid, String stackname,) async {
    final response = await apiV1ServersServeridStacksStacknamePermissionsGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StackPermissionsResponse',) as StackPermissionsResponse;
    
    }
    return null;
  }

  /// Get stack statistics
  ///
  /// Returns resource usage statistics for all containers in a stack
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
  Future<Response> apiV1ServersServeridStacksStacknameStatsGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/stats'
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

  /// Get stack statistics
  ///
  /// Returns resource usage statistics for all containers in a stack
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<StackStatsResponse?> apiV1ServersServeridStacksStacknameStatsGet(int serverid, String stackname,) async {
    final response = await apiV1ServersServeridStacksStacknameStatsGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StackStatsResponse',) as StackStatsResponse;
    
    }
    return null;
  }

  /// Get stack volumes
  ///
  /// Returns volume information for a specific stack
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
  Future<Response> apiV1ServersServeridStacksStacknameVolumesGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/servers/{serverid}/stacks/{stackname}/volumes'
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

  /// Get stack volumes
  ///
  /// Returns volume information for a specific stack
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<StackVolumesResponse?> apiV1ServersServeridStacksStacknameVolumesGet(int serverid, String stackname,) async {
    final response = await apiV1ServersServeridStacksStacknameVolumesGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StackVolumesResponse',) as StackVolumesResponse;
    
    }
    return null;
  }
}
