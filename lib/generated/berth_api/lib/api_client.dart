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
        case 'APIKeyInfo':
          return APIKeyInfo.fromJson(value);
        case 'APIKeyScopeInfo':
          return APIKeyScopeInfo.fromJson(value);
        case 'AddScopeRequest':
          return AddScopeRequest.fromJson(value);
        case 'AdminCreateServerData':
          return AdminCreateServerData.fromJson(value);
        case 'AdminListServersData':
          return AdminListServersData.fromJson(value);
        case 'AdminUpdateServerData':
          return AdminUpdateServerData.fromJson(value);
        case 'ApiV1AuthLoginPost200Response':
          return ApiV1AuthLoginPost200Response.fromJson(value);
        case 'ApiV1ProfileGet200Response':
          return ApiV1ProfileGet200Response.fromJson(value);
        case 'AssignRoleRequest':
          return AssignRoleRequest.fromJson(value);
        case 'AuthLoginData':
          return AuthLoginData.fromJson(value);
        case 'AuthLoginRequest':
          return AuthLoginRequest.fromJson(value);
        case 'AuthLogoutData':
          return AuthLogoutData.fromJson(value);
        case 'AuthLogoutRequest':
          return AuthLogoutRequest.fromJson(value);
        case 'AuthMessageData':
          return AuthMessageData.fromJson(value);
        case 'AuthPasswordResetConfirmRequest':
          return AuthPasswordResetConfirmRequest.fromJson(value);
        case 'AuthPasswordResetRequest':
          return AuthPasswordResetRequest.fromJson(value);
        case 'AuthRefreshData':
          return AuthRefreshData.fromJson(value);
        case 'AuthRefreshRequest':
          return AuthRefreshRequest.fromJson(value);
        case 'AuthResendVerificationRequest':
          return AuthResendVerificationRequest.fromJson(value);
        case 'AuthTOTPRequiredData':
          return AuthTOTPRequiredData.fromJson(value);
        case 'AuthTOTPVerifyRequest':
          return AuthTOTPVerifyRequest.fromJson(value);
        case 'AuthVerifyEmailRequest':
          return AuthVerifyEmailRequest.fromJson(value);
        case 'BuildCacheInfo':
          return BuildCacheInfo.fromJson(value);
        case 'BuildCacheSummary':
          return BuildCacheSummary.fromJson(value);
        case 'BuildConfig':
          return BuildConfig.fromJson(value);
        case 'CanCreateStackData':
          return CanCreateStackData.fromJson(value);
        case 'ChmodRequest':
          return ChmodRequest.fromJson(value);
        case 'ChownRequest':
          return ChownRequest.fromJson(value);
        case 'CommandConfig':
          return CommandConfig.fromJson(value);
        case 'CompareScanData':
          return CompareScanData.fromJson(value);
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
        case 'ContainerStatusEvent':
          return ContainerStatusEvent.fromJson(value);
        case 'ContainerSummary':
          return ContainerSummary.fromJson(value);
        case 'CopyRequest':
          return CopyRequest.fromJson(value);
        case 'CreateAPIKeyData':
          return CreateAPIKeyData.fromJson(value);
        case 'CreateAPIKeyRequest':
          return CreateAPIKeyRequest.fromJson(value);
        case 'CreateCredentialRequest':
          return CreateCredentialRequest.fromJson(value);
        case 'CreateDirectoryRequest':
          return CreateDirectoryRequest.fromJson(value);
        case 'CreateRoleRequest':
          return CreateRoleRequest.fromJson(value);
        case 'CreateStackData':
          return CreateStackData.fromJson(value);
        case 'CreateStackPermissionRequest':
          return CreateStackPermissionRequest.fromJson(value);
        case 'CreateStackRequest':
          return CreateStackRequest.fromJson(value);
        case 'CreateUserRequest':
          return CreateUserRequest.fromJson(value);
        case 'DeleteCredentialMessageData':
          return DeleteCredentialMessageData.fromJson(value);
        case 'DeleteRequest':
          return DeleteRequest.fromJson(value);
        case 'DeleteRequest2':
          return DeleteRequest2.fromJson(value);
        case 'DeleteResult':
          return DeleteResult.fromJson(value);
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
        case 'Error':
          return Error.fromJson(value);
        case 'EventTypeCount':
          return EventTypeCount.fromJson(value);
        case 'ExportRequest':
          return ExportRequest.fromJson(value);
        case 'FileContent':
          return FileContent.fromJson(value);
        case 'FileEntry':
          return FileEntry.fromJson(value);
        case 'FileMessageData':
          return FileMessageData.fromJson(value);
        case 'GetCredentialData':
          return GetCredentialData.fromJson(value);
        case 'GetLatestScanData':
          return GetLatestScanData.fromJson(value);
        case 'GetScanData':
          return GetScanData.fromJson(value);
        case 'GetScanSummaryData':
          return GetScanSummaryData.fromJson(value);
        case 'GetScanTrendData':
          return GetScanTrendData.fromJson(value);
        case 'GetScansHistoryData':
          return GetScansHistoryData.fromJson(value);
        case 'GetServerData':
          return GetServerData.fromJson(value);
        case 'GetSessionsData':
          return GetSessionsData.fromJson(value);
        case 'GetUserRolesData':
          return GetUserRolesData.fromJson(value);
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
        case 'ImageUpdatesData':
          return ImageUpdatesData.fromJson(value);
        case 'ImageVulnerability':
          return ImageVulnerability.fromJson(value);
        case 'ImportData':
          return ImportData.fromJson(value);
        case 'ImportSummary':
          return ImportSummary.fromJson(value);
        case 'IpamConfig':
          return IpamConfig.fromJson(value);
        case 'IpamPool':
          return IpamPool.fromJson(value);
        case 'ListCredentialsData':
          return ListCredentialsData.fromJson(value);
        case 'ListPermissionsData':
          return ListPermissionsData.fromJson(value);
        case 'ListRoleStackPermissionsData':
          return ListRoleStackPermissionsData.fromJson(value);
        case 'ListRolesData':
          return ListRolesData.fromJson(value);
        case 'ListServersData':
          return ListServersData.fromJson(value);
        case 'ListStacksData':
          return ListStacksData.fromJson(value);
        case 'ListUsersData':
          return ListUsersData.fromJson(value);
        case 'LogEntry':
          return LogEntry.fromJson(value);
        case 'LogsData':
          return LogsData.fromJson(value);
        case 'MaintenanceInfo':
          return MaintenanceInfo.fromJson(value);
        case 'MaintenancePermissions':
          return MaintenancePermissions.fromJson(value);
        case 'MessageData':
          return MessageData.fromJson(value);
        case 'MessageData2':
          return MessageData2.fromJson(value);
        case 'MessageData3':
          return MessageData3.fromJson(value);
        case 'Meta':
          return Meta.fromJson(value);
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
        case 'OperationLogDetailData':
          return OperationLogDetailData.fromJson(value);
        case 'OperationLogInfo':
          return OperationLogInfo.fromJson(value);
        case 'OperationLogMessage':
          return OperationLogMessage.fromJson(value);
        case 'OperationLogStatsData':
          return OperationLogStatsData.fromJson(value);
        case 'OperationRequest':
          return OperationRequest.fromJson(value);
        case 'OperationStartData':
          return OperationStartData.fromJson(value);
        case 'PerImageTrend':
          return PerImageTrend.fromJson(value);
        case 'PermissionInfo':
          return PermissionInfo.fromJson(value);
        case 'PermissionsData':
          return PermissionsData.fromJson(value);
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
        case 'RegistryCredential':
          return RegistryCredential.fromJson(value);
        case 'RegistryCredentialInfo':
          return RegistryCredentialInfo.fromJson(value);
        case 'RenameRequest':
          return RenameRequest.fromJson(value);
        case 'ResourceLimits':
          return ResourceLimits.fromJson(value);
        case 'ResourceLimits2':
          return ResourceLimits2.fromJson(value);
        case 'ResourcesConfig':
          return ResourcesConfig.fromJson(value);
        case 'ResponseAPIKeyInfo':
          return ResponseAPIKeyInfo.fromJson(value);
        case 'ResponseAPIKeyInfo2':
          return ResponseAPIKeyInfo2.fromJson(value);
        case 'ResponseAPIKeyScopeInfo':
          return ResponseAPIKeyScopeInfo.fromJson(value);
        case 'ResponseAdminCreateServerData':
          return ResponseAdminCreateServerData.fromJson(value);
        case 'ResponseAdminListServersData':
          return ResponseAdminListServersData.fromJson(value);
        case 'ResponseAdminUpdateServerData':
          return ResponseAdminUpdateServerData.fromJson(value);
        case 'ResponseAuthLoginData':
          return ResponseAuthLoginData.fromJson(value);
        case 'ResponseAuthLogoutData':
          return ResponseAuthLogoutData.fromJson(value);
        case 'ResponseAuthMessageData':
          return ResponseAuthMessageData.fromJson(value);
        case 'ResponseAuthRefreshData':
          return ResponseAuthRefreshData.fromJson(value);
        case 'ResponseAuthTOTPRequiredData':
          return ResponseAuthTOTPRequiredData.fromJson(value);
        case 'ResponseCanCreateStackData':
          return ResponseCanCreateStackData.fromJson(value);
        case 'ResponseCompareScanData':
          return ResponseCompareScanData.fromJson(value);
        case 'ResponseCreateAPIKeyData':
          return ResponseCreateAPIKeyData.fromJson(value);
        case 'ResponseCreateStackData':
          return ResponseCreateStackData.fromJson(value);
        case 'ResponseDeleteCredentialMessageData':
          return ResponseDeleteCredentialMessageData.fromJson(value);
        case 'ResponseDeleteResult':
          return ResponseDeleteResult.fromJson(value);
        case 'ResponseDirectoryListing':
          return ResponseDirectoryListing.fromJson(value);
        case 'ResponseDirectoryStats':
          return ResponseDirectoryStats.fromJson(value);
        case 'ResponseEmpty':
          return ResponseEmpty.fromJson(value);
        case 'ResponseFileContent':
          return ResponseFileContent.fromJson(value);
        case 'ResponseFileMessageData':
          return ResponseFileMessageData.fromJson(value);
        case 'ResponseGetCredentialData':
          return ResponseGetCredentialData.fromJson(value);
        case 'ResponseGetLatestScanData':
          return ResponseGetLatestScanData.fromJson(value);
        case 'ResponseGetScanData':
          return ResponseGetScanData.fromJson(value);
        case 'ResponseGetScanSummaryData':
          return ResponseGetScanSummaryData.fromJson(value);
        case 'ResponseGetScanTrendData':
          return ResponseGetScanTrendData.fromJson(value);
        case 'ResponseGetScansHistoryData':
          return ResponseGetScansHistoryData.fromJson(value);
        case 'ResponseGetServerData':
          return ResponseGetServerData.fromJson(value);
        case 'ResponseGetSessionsData':
          return ResponseGetSessionsData.fromJson(value);
        case 'ResponseGetUserRolesData':
          return ResponseGetUserRolesData.fromJson(value);
        case 'ResponseImageUpdatesData':
          return ResponseImageUpdatesData.fromJson(value);
        case 'ResponseImportData':
          return ResponseImportData.fromJson(value);
        case 'ResponseListCredentialsData':
          return ResponseListCredentialsData.fromJson(value);
        case 'ResponseListPermissionsData':
          return ResponseListPermissionsData.fromJson(value);
        case 'ResponseListRoleStackPermissionsData':
          return ResponseListRoleStackPermissionsData.fromJson(value);
        case 'ResponseListRolesData':
          return ResponseListRolesData.fromJson(value);
        case 'ResponseListServersData':
          return ResponseListServersData.fromJson(value);
        case 'ResponseListStacksData':
          return ResponseListStacksData.fromJson(value);
        case 'ResponseListUsersData':
          return ResponseListUsersData.fromJson(value);
        case 'ResponseLogsData':
          return ResponseLogsData.fromJson(value);
        case 'ResponseMaintenanceInfo':
          return ResponseMaintenanceInfo.fromJson(value);
        case 'ResponseMessageData':
          return ResponseMessageData.fromJson(value);
        case 'ResponseMessageData2':
          return ResponseMessageData2.fromJson(value);
        case 'ResponseMessageData3':
          return ResponseMessageData3.fromJson(value);
        case 'ResponseOperationLogDetailData':
          return ResponseOperationLogDetailData.fromJson(value);
        case 'ResponseOperationLogInfo':
          return ResponseOperationLogInfo.fromJson(value);
        case 'ResponseOperationLogStatsData':
          return ResponseOperationLogStatsData.fromJson(value);
        case 'ResponseOperationStartData':
          return ResponseOperationStartData.fromJson(value);
        case 'ResponsePermissionsData':
          return ResponsePermissionsData.fromJson(value);
        case 'ResponsePruneResult':
          return ResponsePruneResult.fromJson(value);
        case 'ResponseRawComposeConfig':
          return ResponseRawComposeConfig.fromJson(value);
        case 'ResponseRoleWithPermissions':
          return ResponseRoleWithPermissions.fromJson(value);
        case 'ResponseRunningOperationsData':
          return ResponseRunningOperationsData.fromJson(value);
        case 'ResponseSecurityAuditLogInfo':
          return ResponseSecurityAuditLogInfo.fromJson(value);
        case 'ResponseSecurityAuditLogInfo2':
          return ResponseSecurityAuditLogInfo2.fromJson(value);
        case 'ResponseServerStatisticsData':
          return ResponseServerStatisticsData.fromJson(value);
        case 'ResponseSessionMessageData':
          return ResponseSessionMessageData.fromJson(value);
        case 'ResponseStackDetails':
          return ResponseStackDetails.fromJson(value);
        case 'ResponseStackEnvironmentData':
          return ResponseStackEnvironmentData.fromJson(value);
        case 'ResponseStackImagesData':
          return ResponseStackImagesData.fromJson(value);
        case 'ResponseStackNetworksData':
          return ResponseStackNetworksData.fromJson(value);
        case 'ResponseStackPermissionsData':
          return ResponseStackPermissionsData.fromJson(value);
        case 'ResponseStackStats':
          return ResponseStackStats.fromJson(value);
        case 'ResponseStackVolumesData':
          return ResponseStackVolumesData.fromJson(value);
        case 'ResponseStartScanData':
          return ResponseStartScanData.fromJson(value);
        case 'ResponseStatsResponseData':
          return ResponseStatsResponseData.fromJson(value);
        case 'ResponseTOTPMessageData':
          return ResponseTOTPMessageData.fromJson(value);
        case 'ResponseTOTPSetupData':
          return ResponseTOTPSetupData.fromJson(value);
        case 'ResponseTOTPStatusData':
          return ResponseTOTPStatusData.fromJson(value);
        case 'ResponseUpdateComposeResponse':
          return ResponseUpdateComposeResponse.fromJson(value);
        case 'ResponseUserIdentity':
          return ResponseUserIdentity.fromJson(value);
        case 'ResponseUserInfo':
          return ResponseUserInfo.fromJson(value);
        case 'ResponseVersionData':
          return ResponseVersionData.fromJson(value);
        case 'RestartPolicy':
          return RestartPolicy.fromJson(value);
        case 'RestartPolicyConfig':
          return RestartPolicyConfig.fromJson(value);
        case 'RevokeRoleRequest':
          return RevokeRoleRequest.fromJson(value);
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
        case 'RunningOperationsData':
          return RunningOperationsData.fromJson(value);
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
        case 'SecurityAuditLogInfo':
          return SecurityAuditLogInfo.fromJson(value);
        case 'Server':
          return Server.fromJson(value);
        case 'ServerCreateRequest':
          return ServerCreateRequest.fromJson(value);
        case 'ServerInfo':
          return ServerInfo.fromJson(value);
        case 'ServerInfo2':
          return ServerInfo2.fromJson(value);
        case 'ServerStatisticsData':
          return ServerStatisticsData.fromJson(value);
        case 'ServerUpdateRequest':
          return ServerUpdateRequest.fromJson(value);
        case 'ServiceChanges':
          return ServiceChanges.fromJson(value);
        case 'ServiceEnvironment':
          return ServiceEnvironment.fromJson(value);
        case 'ServiceNetworkConfig':
          return ServiceNetworkConfig.fromJson(value);
        case 'SessionItem':
          return SessionItem.fromJson(value);
        case 'SessionMessageData':
          return SessionMessageData.fromJson(value);
        case 'Stack':
          return Stack.fromJson(value);
        case 'StackDetails':
          return StackDetails.fromJson(value);
        case 'StackEnvironmentData':
          return StackEnvironmentData.fromJson(value);
        case 'StackHealthDetails':
          return StackHealthDetails.fromJson(value);
        case 'StackImagesData':
          return StackImagesData.fromJson(value);
        case 'StackNetworksData':
          return StackNetworksData.fromJson(value);
        case 'StackPermissionRule':
          return StackPermissionRule.fromJson(value);
        case 'StackPermissionsData':
          return StackPermissionsData.fromJson(value);
        case 'StackStatistics':
          return StackStatistics.fromJson(value);
        case 'StackStats':
          return StackStats.fromJson(value);
        case 'StackStatusEvent':
          return StackStatusEvent.fromJson(value);
        case 'StackVolumesData':
          return StackVolumesData.fromJson(value);
        case 'StartScanData':
          return StartScanData.fromJson(value);
        case 'StartScanRequest':
          return StartScanRequest.fromJson(value);
        case 'StatsResponseData':
          return StatsResponseData.fromJson(value);
        case 'StreamMessage':
          return StreamMessage.fromJson(value);
        case 'SystemInfo':
          return SystemInfo.fromJson(value);
        case 'TOTPDisableRequest':
          return TOTPDisableRequest.fromJson(value);
        case 'TOTPEnableRequest':
          return TOTPEnableRequest.fromJson(value);
        case 'TOTPMessageData':
          return TOTPMessageData.fromJson(value);
        case 'TOTPSetupData':
          return TOTPSetupData.fromJson(value);
        case 'TOTPStatusData':
          return TOTPStatusData.fromJson(value);
        case 'TerminalCloseMessage':
          return TerminalCloseMessage.fromJson(value);
        case 'TerminalErrorMessage':
          return TerminalErrorMessage.fromJson(value);
        case 'TerminalInputMessage':
          return TerminalInputMessage.fromJson(value);
        case 'TerminalOutputMessage':
          return TerminalOutputMessage.fromJson(value);
        case 'TerminalResizeMessage':
          return TerminalResizeMessage.fromJson(value);
        case 'TerminalStartMessage':
          return TerminalStartMessage.fromJson(value);
        case 'TerminalSuccessMessage':
          return TerminalSuccessMessage.fromJson(value);
        case 'UpdateComposeRequest':
          return UpdateComposeRequest.fromJson(value);
        case 'UpdateComposeResponse':
          return UpdateComposeResponse.fromJson(value);
        case 'UpdateCredentialRequest':
          return UpdateCredentialRequest.fromJson(value);
        case 'UpdateRoleRequest':
          return UpdateRoleRequest.fromJson(value);
        case 'UpdateRollbackConfig':
          return UpdateRollbackConfig.fromJson(value);
        case 'User':
          return User.fromJson(value);
        case 'UserIdentity':
          return UserIdentity.fromJson(value);
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
        case 'WsApiServersServeridStacksStacknameEventsGet101Response':
          return WsApiServersServeridStacksStacknameEventsGet101Response.fromJson(value);
        case 'WsApiServersServeridStacksStacknameTerminalGet101Response':
          return WsApiServersServeridStacksStacknameTerminalGet101Response.fromJson(value);
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
