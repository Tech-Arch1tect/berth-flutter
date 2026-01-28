//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({this.basePath = 'http://localhost', this.authentication,});

  final String basePath;
  final Authentication? authentication;

  var _client = Client();
  final _defaultHeaderMap = <String, String>{};

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  set client(Client newClient) {
    _client = newClient;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType,
  ) async {
    await authentication?.applyToParams(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty ? '?${urlEncodedQueryParams.join('&')}' : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (
        body is MultipartFile && (contentType == null ||
        !contentType.toLowerCase().startsWith('multipart/form-data'))
      ) {
        final request = StreamedRequest(method, uri);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
          request.sink.add,
          onDone: request.sink.close,
          // ignore: avoid_types_on_closure_parameters
          onError: (Object error, StackTrace trace) => request.sink.close(),
          cancelOnError: true,
        );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = MultipartRequest(method, uri);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
        ? formParams
        : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      switch(method) {
        case 'POST': return await _client.post(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PUT': return await _client.put(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'DELETE': return await _client.delete(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'PATCH': return await _client.patch(uri, headers: nullableHeaderParams, body: msgBody,);
        case 'HEAD': return await _client.head(uri, headers: nullableHeaderParams,);
        case 'GET': return await _client.get(uri, headers: nullableHeaderParams,);
      }
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }

    throw ApiException(
      HttpStatus.badRequest,
      'Invalid HTTP operation: $method $path',
    );
  }

  Future<dynamic> deserializeAsync(String value, String targetType, {bool growable = false,}) async =>
    // ignore: deprecated_member_use_from_same_package
    deserialize(value, targetType, growable: growable);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(String value, String targetType, {bool growable = false,}) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType = targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
      ? value
      : fromJson(json.decode(value), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Returns a native instance of an OpenAPI class matching the [specified type][targetType].
  static dynamic fromJson(dynamic value, String targetType, {bool growable = false,}) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'DateTime':
          return value is DateTime ? value : DateTime.tryParse(value);
        case 'APIKeyResponse':
          return APIKeyResponse.fromJson(value);
        case 'APIKeyScopeResponse':
          return APIKeyScopeResponse.fromJson(value);
        case 'AddScopeRequest':
          return AddScopeRequest.fromJson(value);
        case 'AdminCreateServerResponse':
          return AdminCreateServerResponse.fromJson(value);
        case 'AdminCreateServerResponseData':
          return AdminCreateServerResponseData.fromJson(value);
        case 'AdminDeleteServerResponse':
          return AdminDeleteServerResponse.fromJson(value);
        case 'AdminListServersResponse':
          return AdminListServersResponse.fromJson(value);
        case 'AdminListServersResponseData':
          return AdminListServersResponseData.fromJson(value);
        case 'AdminTestConnectionResponse':
          return AdminTestConnectionResponse.fromJson(value);
        case 'AdminUpdateServerResponse':
          return AdminUpdateServerResponse.fromJson(value);
        case 'AdminUpdateServerResponseData':
          return AdminUpdateServerResponseData.fromJson(value);
        case 'AssignRoleRequest':
          return AssignRoleRequest.fromJson(value);
        case 'AssignRoleResponse':
          return AssignRoleResponse.fromJson(value);
        case 'BaseModel':
          return BaseModel.fromJson(value);
        case 'BuildCacheInfo':
          return BuildCacheInfo.fromJson(value);
        case 'BuildCacheSummary':
          return BuildCacheSummary.fromJson(value);
        case 'BuildConfig':
          return BuildConfig.fromJson(value);
        case 'CanCreateStackResponse':
          return CanCreateStackResponse.fromJson(value);
        case 'ChmodRequest':
          return ChmodRequest.fromJson(value);
        case 'ChownRequest':
          return ChownRequest.fromJson(value);
        case 'CommandConfig':
          return CommandConfig.fromJson(value);
        case 'CompareScanData':
          return CompareScanData.fromJson(value);
        case 'CompareScanResponse':
          return CompareScanResponse.fromJson(value);
        case 'ComposeChanges':
          return ComposeChanges.fromJson(value);
        case 'ComposeService':
          return ComposeService.fromJson(value);
        case 'ConfigConfig':
          return ConfigConfig.fromJson(value);
        case 'Container':
          return Container.fromJson(value);
        case 'ContainerImageDetails':
          return ContainerImageDetails.fromJson(value);
        case 'ContainerInfo':
          return ContainerInfo.fromJson(value);
        case 'ContainerMount':
          return ContainerMount.fromJson(value);
        case 'ContainerNetwork':
          return ContainerNetwork.fromJson(value);
        case 'ContainerStats':
          return ContainerStats.fromJson(value);
        case 'ContainerSummary':
          return ContainerSummary.fromJson(value);
        case 'CopyRequest':
          return CopyRequest.fromJson(value);
        case 'CreateAPIKeyRequest':
          return CreateAPIKeyRequest.fromJson(value);
        case 'CreateAPIKeyResponse':
          return CreateAPIKeyResponse.fromJson(value);
        case 'CreateAPIKeyResponseData':
          return CreateAPIKeyResponseData.fromJson(value);
        case 'CreateCredentialRequest':
          return CreateCredentialRequest.fromJson(value);
        case 'CreateCredentialResponse':
          return CreateCredentialResponse.fromJson(value);
        case 'CreateDirectoryRequest':
          return CreateDirectoryRequest.fromJson(value);
        case 'CreateRoleRequest':
          return CreateRoleRequest.fromJson(value);
        case 'CreateRoleResponse':
          return CreateRoleResponse.fromJson(value);
        case 'CreateStackPermissionRequest':
          return CreateStackPermissionRequest.fromJson(value);
        case 'CreateStackPermissionResponse':
          return CreateStackPermissionResponse.fromJson(value);
        case 'CreateStackRequest':
          return CreateStackRequest.fromJson(value);
        case 'CreateStackResponse':
          return CreateStackResponse.fromJson(value);
        case 'CreateUserRequest':
          return CreateUserRequest.fromJson(value);
        case 'CreateUserResponse':
          return CreateUserResponse.fromJson(value);
        case 'DeleteCredentialResponse':
          return DeleteCredentialResponse.fromJson(value);
        case 'DeleteRequest':
          return DeleteRequest.fromJson(value);
        case 'DeleteRequest2':
          return DeleteRequest2.fromJson(value);
        case 'DeleteResult':
          return DeleteResult.fromJson(value);
        case 'DeleteRoleResponse':
          return DeleteRoleResponse.fromJson(value);
        case 'DeleteStackPermissionResponse':
          return DeleteStackPermissionResponse.fromJson(value);
        case 'DeletedAt':
          return DeletedAt.fromJson(value);
        case 'DependsOnConfig':
          return DependsOnConfig.fromJson(value);
        case 'DeployConfig':
          return DeployConfig.fromJson(value);
        case 'DirectoryListing':
          return DirectoryListing.fromJson(value);
        case 'DirectoryStats':
          return DirectoryStats.fromJson(value);
        case 'DiskUsage':
          return DiskUsage.fromJson(value);
        case 'EnvironmentVariable':
          return EnvironmentVariable.fromJson(value);
        case 'ErrorResponse':
          return ErrorResponse.fromJson(value);
        case 'EventTypeCountResponse':
          return EventTypeCountResponse.fromJson(value);
        case 'ExportRequest':
          return ExportRequest.fromJson(value);
        case 'FileContent':
          return FileContent.fromJson(value);
        case 'FileEntry':
          return FileEntry.fromJson(value);
        case 'GetAPIKeyResponse':
          return GetAPIKeyResponse.fromJson(value);
        case 'GetCredentialData':
          return GetCredentialData.fromJson(value);
        case 'GetCredentialResponse':
          return GetCredentialResponse.fromJson(value);
        case 'GetLatestScanData':
          return GetLatestScanData.fromJson(value);
        case 'GetLatestScanResponse':
          return GetLatestScanResponse.fromJson(value);
        case 'GetLogAPIResponse':
          return GetLogAPIResponse.fromJson(value);
        case 'GetProfileResponse':
          return GetProfileResponse.fromJson(value);
        case 'GetScanData':
          return GetScanData.fromJson(value);
        case 'GetScanResponse':
          return GetScanResponse.fromJson(value);
        case 'GetScanSummaryData':
          return GetScanSummaryData.fromJson(value);
        case 'GetScanSummaryResponse':
          return GetScanSummaryResponse.fromJson(value);
        case 'GetScanTrendData':
          return GetScanTrendData.fromJson(value);
        case 'GetScanTrendResponse':
          return GetScanTrendResponse.fromJson(value);
        case 'GetScansHistoryData':
          return GetScansHistoryData.fromJson(value);
        case 'GetScansHistoryResponse':
          return GetScansHistoryResponse.fromJson(value);
        case 'GetStatsAPIResponse':
          return GetStatsAPIResponse.fromJson(value);
        case 'GetVersionResponse':
          return GetVersionResponse.fromJson(value);
        case 'HealthLog':
          return HealthLog.fromJson(value);
        case 'HealthStatus':
          return HealthStatus.fromJson(value);
        case 'HealthcheckConfig':
          return HealthcheckConfig.fromJson(value);
        case 'ImageConfig':
          return ImageConfig.fromJson(value);
        case 'ImageHistoryLayer':
          return ImageHistoryLayer.fromJson(value);
        case 'ImageInfo':
          return ImageInfo.fromJson(value);
        case 'ImageInspectInfo':
          return ImageInspectInfo.fromJson(value);
        case 'ImageScan':
          return ImageScan.fromJson(value);
        case 'ImageSummary':
          return ImageSummary.fromJson(value);
        case 'ImageTrendPoint':
          return ImageTrendPoint.fromJson(value);
        case 'ImageUpdate':
          return ImageUpdate.fromJson(value);
        case 'ImageUpdatesResponse':
          return ImageUpdatesResponse.fromJson(value);
        case 'ImageVulnerability':
          return ImageVulnerability.fromJson(value);
        case 'ImportResponse':
          return ImportResponse.fromJson(value);
        case 'ImportResponseData':
          return ImportResponseData.fromJson(value);
        case 'ImportSummary':
          return ImportSummary.fromJson(value);
        case 'IpamConfig':
          return IpamConfig.fromJson(value);
        case 'IpamPool':
          return IpamPool.fromJson(value);
        case 'ListAPIKeysResponse':
          return ListAPIKeysResponse.fromJson(value);
        case 'ListCredentialsData':
          return ListCredentialsData.fromJson(value);
        case 'ListCredentialsResponse':
          return ListCredentialsResponse.fromJson(value);
        case 'ListLogsAPIResponse':
          return ListLogsAPIResponse.fromJson(value);
        case 'ListLogsResponseData':
          return ListLogsResponseData.fromJson(value);
        case 'ListRoleStackPermissionsData':
          return ListRoleStackPermissionsData.fromJson(value);
        case 'ListRoleStackPermissionsResponse':
          return ListRoleStackPermissionsResponse.fromJson(value);
        case 'ListRolesResponse':
          return ListRolesResponse.fromJson(value);
        case 'ListRolesResponseData':
          return ListRolesResponseData.fromJson(value);
        case 'ListScopesResponse':
          return ListScopesResponse.fromJson(value);
        case 'ListServersResponse':
          return ListServersResponse.fromJson(value);
        case 'ListStacksResponse':
          return ListStacksResponse.fromJson(value);
        case 'LogEntry':
          return LogEntry.fromJson(value);
        case 'LogsResponse':
          return LogsResponse.fromJson(value);
        case 'MaintenanceInfo':
          return MaintenanceInfo.fromJson(value);
        case 'MaintenancePermissions':
          return MaintenancePermissions.fromJson(value);
        case 'MessageResponse':
          return MessageResponse.fromJson(value);
        case 'MessageResponse2':
          return MessageResponse2.fromJson(value);
        case 'Network':
          return Network.fromJson(value);
        case 'NetworkConfig':
          return NetworkConfig.fromJson(value);
        case 'NetworkEndpoint':
          return NetworkEndpoint.fromJson(value);
        case 'NetworkIPAM':
          return NetworkIPAM.fromJson(value);
        case 'NetworkIPAMConfig':
          return NetworkIPAMConfig.fromJson(value);
        case 'NetworkInfo':
          return NetworkInfo.fromJson(value);
        case 'NetworkSummary':
          return NetworkSummary.fromJson(value);
        case 'NewServiceConfig':
          return NewServiceConfig.fromJson(value);
        case 'OperationLog':
          return OperationLog.fromJson(value);
        case 'OperationLogDetail':
          return OperationLogDetail.fromJson(value);
        case 'OperationLogMessage':
          return OperationLogMessage.fromJson(value);
        case 'OperationLogResponse':
          return OperationLogResponse.fromJson(value);
        case 'OperationLogStats':
          return OperationLogStats.fromJson(value);
        case 'PaginatedOperationLogs':
          return PaginatedOperationLogs.fromJson(value);
        case 'PaginationInfo':
          return PaginationInfo.fromJson(value);
        case 'PerImageTrend':
          return PerImageTrend.fromJson(value);
        case 'PermissionInfo':
          return PermissionInfo.fromJson(value);
        case 'PermissionsResponse':
          return PermissionsResponse.fromJson(value);
        case 'PlacementConfig':
          return PlacementConfig.fromJson(value);
        case 'PlacementPreference':
          return PlacementPreference.fromJson(value);
        case 'Port':
          return Port.fromJson(value);
        case 'PortMapping':
          return PortMapping.fromJson(value);
        case 'PruneRequest':
          return PruneRequest.fromJson(value);
        case 'PruneResult':
          return PruneResult.fromJson(value);
        case 'RawComposeConfig':
          return RawComposeConfig.fromJson(value);
        case 'RegistryCredentialResponse':
          return RegistryCredentialResponse.fromJson(value);
        case 'RenameRequest':
          return RenameRequest.fromJson(value);
        case 'ResourceLimits':
          return ResourceLimits.fromJson(value);
        case 'ResourceLimits2':
          return ResourceLimits2.fromJson(value);
        case 'ResourcesConfig':
          return ResourcesConfig.fromJson(value);
        case 'RestartPolicy':
          return RestartPolicy.fromJson(value);
        case 'RestartPolicyConfig':
          return RestartPolicyConfig.fromJson(value);
        case 'RevokeAllOtherSessionsRequest':
          return RevokeAllOtherSessionsRequest.fromJson(value);
        case 'RevokeRoleRequest':
          return RevokeRoleRequest.fromJson(value);
        case 'RevokeRoleResponse':
          return RevokeRoleResponse.fromJson(value);
        case 'RevokeSessionRequest':
          return RevokeSessionRequest.fromJson(value);
        case 'Role':
          return Role.fromJson(value);
        case 'RoleInfo':
          return RoleInfo.fromJson(value);
        case 'RoleWithPermissions':
          return RoleWithPermissions.fromJson(value);
        case 'RootFS':
          return RootFS.fromJson(value);
        case 'RunningOperationsResponse':
          return RunningOperationsResponse.fromJson(value);
        case 'ScanComparison':
          return ScanComparison.fromJson(value);
        case 'ScanScope':
          return ScanScope.fromJson(value);
        case 'ScanTrendPoint':
          return ScanTrendPoint.fromJson(value);
        case 'ScanWithSummary':
          return ScanWithSummary.fromJson(value);
        case 'SecretConfig':
          return SecretConfig.fromJson(value);
        case 'SecurityAuditLogResponse':
          return SecurityAuditLogResponse.fromJson(value);
        case 'Server':
          return Server.fromJson(value);
        case 'ServerCreateRequest':
          return ServerCreateRequest.fromJson(value);
        case 'ServerInfo':
          return ServerInfo.fromJson(value);
        case 'ServerResponse':
          return ServerResponse.fromJson(value);
        case 'ServerStatisticsResponse':
          return ServerStatisticsResponse.fromJson(value);
        case 'ServerUpdateRequest':
          return ServerUpdateRequest.fromJson(value);
        case 'ServiceChanges':
          return ServiceChanges.fromJson(value);
        case 'ServiceEnvironment':
          return ServiceEnvironment.fromJson(value);
        case 'ServiceNetworkConfig':
          return ServiceNetworkConfig.fromJson(value);
        case 'SessionMessageResponse':
          return SessionMessageResponse.fromJson(value);
        case 'Stack':
          return Stack.fromJson(value);
        case 'StackDetails':
          return StackDetails.fromJson(value);
        case 'StackImagesResponse':
          return StackImagesResponse.fromJson(value);
        case 'StackNetworksResponse':
          return StackNetworksResponse.fromJson(value);
        case 'StackPermissionRule':
          return StackPermissionRule.fromJson(value);
        case 'StackPermissionsResponse':
          return StackPermissionsResponse.fromJson(value);
        case 'StackStatistics':
          return StackStatistics.fromJson(value);
        case 'StackStats':
          return StackStats.fromJson(value);
        case 'StackStatsResponse':
          return StackStatsResponse.fromJson(value);
        case 'StackVolumesResponse':
          return StackVolumesResponse.fromJson(value);
        case 'StartScanData':
          return StartScanData.fromJson(value);
        case 'StartScanRequest':
          return StartScanRequest.fromJson(value);
        case 'StartScanResponse':
          return StartScanResponse.fromJson(value);
        case 'StatsResponseData':
          return StatsResponseData.fromJson(value);
        case 'SystemInfo':
          return SystemInfo.fromJson(value);
        case 'TOTPDisableRequest':
          return TOTPDisableRequest.fromJson(value);
        case 'TOTPEnableRequest':
          return TOTPEnableRequest.fromJson(value);
        case 'TOTPMessageResponse':
          return TOTPMessageResponse.fromJson(value);
        case 'TOTPSetupData':
          return TOTPSetupData.fromJson(value);
        case 'TOTPSetupResponse':
          return TOTPSetupResponse.fromJson(value);
        case 'TOTPStatusData':
          return TOTPStatusData.fromJson(value);
        case 'TOTPStatusResponse':
          return TOTPStatusResponse.fromJson(value);
        case 'UpdateComposeRequest':
          return UpdateComposeRequest.fromJson(value);
        case 'UpdateComposeResponse':
          return UpdateComposeResponse.fromJson(value);
        case 'UpdateCredentialRequest':
          return UpdateCredentialRequest.fromJson(value);
        case 'UpdateCredentialResponse':
          return UpdateCredentialResponse.fromJson(value);
        case 'UpdateRoleRequest':
          return UpdateRoleRequest.fromJson(value);
        case 'UpdateRoleResponse':
          return UpdateRoleResponse.fromJson(value);
        case 'UpdateRollbackConfig':
          return UpdateRollbackConfig.fromJson(value);
        case 'User':
          return User.fromJson(value);
        case 'UserInfo':
          return UserInfo.fromJson(value);
        case 'VersionData':
          return VersionData.fromJson(value);
        case 'Volume':
          return Volume.fromJson(value);
        case 'VolumeConfig':
          return VolumeConfig.fromJson(value);
        case 'VolumeInfo':
          return VolumeInfo.fromJson(value);
        case 'VolumeMount':
          return VolumeMount.fromJson(value);
        case 'VolumeMount2':
          return VolumeMount2.fromJson(value);
        case 'VolumeSummary':
          return VolumeSummary.fromJson(value);
        case 'VolumeUsage':
          return VolumeUsage.fromJson(value);
        case 'VulnerabilitySummary':
          return VulnerabilitySummary.fromJson(value);
        case 'WriteFileRequest':
          return WriteFileRequest.fromJson(value);
        default:
          dynamic match;
          if (value is List && (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,))
              .toList(growable: growable);
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,))
              .toSet();
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,)),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(HttpStatus.internalServerError, 'Exception during deserialization.', error, trace,);
    }
    throw ApiException(HttpStatus.internalServerError, 'Could not find a suitable class for deserialization',);
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> decodeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : json.decode(message.json);
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : ApiClient.fromJson(
        json.decode(message.json),
        targetType,
        growable: message.growable,
      );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async => value == null ? '' : json.encode(value);
