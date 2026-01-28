# berth_api.api.AdminApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1AdminMigrationExportPost**](AdminApi.md#apiv1adminmigrationexportpost) | **POST** /api/v1/admin/migration/export | Export data
[**apiV1AdminMigrationImportPost**](AdminApi.md#apiv1adminmigrationimportpost) | **POST** /api/v1/admin/migration/import | Import data
[**apiV1AdminOperationLogsGet**](AdminApi.md#apiv1adminoperationlogsget) | **GET** /api/v1/admin/operation-logs | List all operation logs
[**apiV1AdminOperationLogsIdGet**](AdminApi.md#apiv1adminoperationlogsidget) | **GET** /api/v1/admin/operation-logs/{id} | Get operation log details
[**apiV1AdminOperationLogsStatsGet**](AdminApi.md#apiv1adminoperationlogsstatsget) | **GET** /api/v1/admin/operation-logs/stats | Get operation logs statistics
[**apiV1AdminRolesIdDelete**](AdminApi.md#apiv1adminrolesiddelete) | **DELETE** /api/v1/admin/roles/{id} | Delete a role
[**apiV1AdminRolesIdPut**](AdminApi.md#apiv1adminrolesidput) | **PUT** /api/v1/admin/roles/{id} | Update a role
[**apiV1AdminRolesPost**](AdminApi.md#apiv1adminrolespost) | **POST** /api/v1/admin/roles | Create a new role
[**apiV1AdminRolesRoleIdStackPermissionsGet**](AdminApi.md#apiv1adminrolesroleidstackpermissionsget) | **GET** /api/v1/admin/roles/{roleId}/stack-permissions | List role stack permissions
[**apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete**](AdminApi.md#apiv1adminrolesroleidstackpermissionspermissioniddelete) | **DELETE** /api/v1/admin/roles/{roleId}/stack-permissions/{permissionId} | Delete a role stack permission
[**apiV1AdminRolesRoleIdStackPermissionsPost**](AdminApi.md#apiv1adminrolesroleidstackpermissionspost) | **POST** /api/v1/admin/roles/{roleId}/stack-permissions | Create a role stack permission
[**apiV1AdminSecurityAuditLogsGet**](AdminApi.md#apiv1adminsecurityauditlogsget) | **GET** /api/v1/admin/security-audit-logs | List security audit logs
[**apiV1AdminSecurityAuditLogsIdGet**](AdminApi.md#apiv1adminsecurityauditlogsidget) | **GET** /api/v1/admin/security-audit-logs/{id} | Get security audit log details
[**apiV1AdminSecurityAuditLogsStatsGet**](AdminApi.md#apiv1adminsecurityauditlogsstatsget) | **GET** /api/v1/admin/security-audit-logs/stats | Get security audit statistics
[**apiV1AdminServersGet**](AdminApi.md#apiv1adminserversget) | **GET** /api/v1/admin/servers | List all servers
[**apiV1AdminServersIdDelete**](AdminApi.md#apiv1adminserversiddelete) | **DELETE** /api/v1/admin/servers/{id} | Delete a server
[**apiV1AdminServersIdPut**](AdminApi.md#apiv1adminserversidput) | **PUT** /api/v1/admin/servers/{id} | Update a server
[**apiV1AdminServersIdTestPost**](AdminApi.md#apiv1adminserversidtestpost) | **POST** /api/v1/admin/servers/{id}/test | Test server connection
[**apiV1AdminServersPost**](AdminApi.md#apiv1adminserverspost) | **POST** /api/v1/admin/servers | Create a new server
[**apiV1AdminUsersAssignRolePost**](AdminApi.md#apiv1adminusersassignrolepost) | **POST** /api/v1/admin/users/assign-role | Assign a role to a user
[**apiV1AdminUsersPost**](AdminApi.md#apiv1adminuserspost) | **POST** /api/v1/admin/users | Create a new user
[**apiV1AdminUsersRevokeRolePost**](AdminApi.md#apiv1adminusersrevokerolepost) | **POST** /api/v1/admin/users/revoke-role | Revoke a role from a user


# **apiV1AdminMigrationExportPost**
> MultipartFile apiV1AdminMigrationExportPost(exportRequest)

Export data

Export all configuration data (users, roles, servers, etc.) as an encrypted backup file. Requires admin.system.export permission.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final exportRequest = ExportRequest(); // ExportRequest | Export password (min 12 characters)

try {
    final result = api_instance.apiV1AdminMigrationExportPost(exportRequest);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminMigrationExportPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exportRequest** | [**ExportRequest**](ExportRequest.md)| Export password (min 12 characters) | 

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/octet-stream, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminMigrationImportPost**
> ImportResponse apiV1AdminMigrationImportPost(backupFile, password)

Import data

Import configuration data from an encrypted backup file. WARNING: This will completely replace all existing data. Requires admin.system.import permission.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final backupFile = BINARY_DATA_HERE; // MultipartFile | 
final password = password_example; // String | 

try {
    final result = api_instance.apiV1AdminMigrationImportPost(backupFile, password);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminMigrationImportPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **backupFile** | **MultipartFile**|  | 
 **password** | **String**|  | 

### Return type

[**ImportResponse**](ImportResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminOperationLogsGet**
> PaginatedOperationLogs apiV1AdminOperationLogsGet(page, pageSize, search, serverId, stackName, command, status, daysBack)

List all operation logs

Returns paginated list of all operation logs. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final page = 56; // int | Page number
final pageSize = 56; // int | Number of items per page
final search = search_example; // String | Search term for stack name, command, or operation ID
final serverId = serverId_example; // String | Filter by server ID
final stackName = stackName_example; // String | Filter by stack name (partial match)
final command = command_example; // String | Filter by command
final status = status_example; // String | Filter by status
final daysBack = 56; // int | Only return logs from the last N days

try {
    final result = api_instance.apiV1AdminOperationLogsGet(page, pageSize, search, serverId, stackName, command, status, daysBack);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminOperationLogsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number | [optional] [default to 1]
 **pageSize** | **int**| Number of items per page | [optional] [default to 20]
 **search** | **String**| Search term for stack name, command, or operation ID | [optional] 
 **serverId** | **String**| Filter by server ID | [optional] 
 **stackName** | **String**| Filter by stack name (partial match) | [optional] 
 **command** | **String**| Filter by command | [optional] 
 **status** | **String**| Filter by status | [optional] 
 **daysBack** | **int**| Only return logs from the last N days | [optional] 

### Return type

[**PaginatedOperationLogs**](PaginatedOperationLogs.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminOperationLogsIdGet**
> OperationLogDetail apiV1AdminOperationLogsIdGet(id)

Get operation log details

Returns detailed information about a specific operation log including all messages. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final id = 56; // int | Operation log ID

try {
    final result = api_instance.apiV1AdminOperationLogsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminOperationLogsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Operation log ID | 

### Return type

[**OperationLogDetail**](OperationLogDetail.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminOperationLogsStatsGet**
> OperationLogStats apiV1AdminOperationLogsStatsGet()

Get operation logs statistics

Returns aggregated statistics for all operation logs. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();

try {
    final result = api_instance.apiV1AdminOperationLogsStatsGet();
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminOperationLogsStatsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**OperationLogStats**](OperationLogStats.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminRolesIdDelete**
> DeleteRoleResponse apiV1AdminRolesIdDelete(id)

Delete a role

Deletes a role. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final id = 56; // int | Role ID

try {
    final result = api_instance.apiV1AdminRolesIdDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminRolesIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Role ID | 

### Return type

[**DeleteRoleResponse**](DeleteRoleResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminRolesIdPut**
> UpdateRoleResponse apiV1AdminRolesIdPut(id, updateRoleRequest)

Update a role

Updates an existing role. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final id = 56; // int | Role ID
final updateRoleRequest = UpdateRoleRequest(); // UpdateRoleRequest | Role details

try {
    final result = api_instance.apiV1AdminRolesIdPut(id, updateRoleRequest);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminRolesIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Role ID | 
 **updateRoleRequest** | [**UpdateRoleRequest**](UpdateRoleRequest.md)| Role details | 

### Return type

[**UpdateRoleResponse**](UpdateRoleResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminRolesPost**
> CreateRoleResponse apiV1AdminRolesPost(createRoleRequest)

Create a new role

Creates a new role. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final createRoleRequest = CreateRoleRequest(); // CreateRoleRequest | Role details

try {
    final result = api_instance.apiV1AdminRolesPost(createRoleRequest);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminRolesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createRoleRequest** | [**CreateRoleRequest**](CreateRoleRequest.md)| Role details | 

### Return type

[**CreateRoleResponse**](CreateRoleResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminRolesRoleIdStackPermissionsGet**
> ListRoleStackPermissionsResponse apiV1AdminRolesRoleIdStackPermissionsGet(roleId)

List role stack permissions

Returns the role details, available servers, permissions, and current permission rules. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final roleId = 56; // int | Role ID

try {
    final result = api_instance.apiV1AdminRolesRoleIdStackPermissionsGet(roleId);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminRolesRoleIdStackPermissionsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **int**| Role ID | 

### Return type

[**ListRoleStackPermissionsResponse**](ListRoleStackPermissionsResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete**
> DeleteStackPermissionResponse apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete(roleId, permissionId)

Delete a role stack permission

Deletes a permission rule from a role. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final roleId = 56; // int | Role ID
final permissionId = 56; // int | Permission rule ID

try {
    final result = api_instance.apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete(roleId, permissionId);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **int**| Role ID | 
 **permissionId** | **int**| Permission rule ID | 

### Return type

[**DeleteStackPermissionResponse**](DeleteStackPermissionResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminRolesRoleIdStackPermissionsPost**
> CreateStackPermissionResponse apiV1AdminRolesRoleIdStackPermissionsPost(roleId, createStackPermissionRequest)

Create a role stack permission

Creates a new permission rule for a role on a server with a stack pattern. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final roleId = 56; // int | Role ID
final createStackPermissionRequest = CreateStackPermissionRequest(); // CreateStackPermissionRequest | Permission rule details

try {
    final result = api_instance.apiV1AdminRolesRoleIdStackPermissionsPost(roleId, createStackPermissionRequest);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminRolesRoleIdStackPermissionsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **int**| Role ID | 
 **createStackPermissionRequest** | [**CreateStackPermissionRequest**](CreateStackPermissionRequest.md)| Permission rule details | 

### Return type

[**CreateStackPermissionResponse**](CreateStackPermissionResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminSecurityAuditLogsGet**
> ListLogsAPIResponse apiV1AdminSecurityAuditLogsGet(page, perPage, eventType, eventCategory, severity, actorUserId, success, startDate, endDate, search)

List security audit logs

Returns paginated list of security audit logs. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final page = 56; // int | Page number
final perPage = 56; // int | Number of items per page
final eventType = eventType_example; // String | Filter by event type
final eventCategory = eventCategory_example; // String | Filter by event category
final severity = severity_example; // String | Filter by severity
final actorUserId = actorUserId_example; // String | Filter by actor user ID
final success = success_example; // String | Filter by success status (true/false)
final startDate = startDate_example; // String | Filter by start date (RFC3339 format)
final endDate = endDate_example; // String | Filter by end date (RFC3339 format)
final search = search_example; // String | Search in actor username, target name, or event type

try {
    final result = api_instance.apiV1AdminSecurityAuditLogsGet(page, perPage, eventType, eventCategory, severity, actorUserId, success, startDate, endDate, search);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminSecurityAuditLogsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number | [optional] [default to 1]
 **perPage** | **int**| Number of items per page | [optional] [default to 50]
 **eventType** | **String**| Filter by event type | [optional] 
 **eventCategory** | **String**| Filter by event category | [optional] 
 **severity** | **String**| Filter by severity | [optional] 
 **actorUserId** | **String**| Filter by actor user ID | [optional] 
 **success** | **String**| Filter by success status (true/false) | [optional] 
 **startDate** | **String**| Filter by start date (RFC3339 format) | [optional] 
 **endDate** | **String**| Filter by end date (RFC3339 format) | [optional] 
 **search** | **String**| Search in actor username, target name, or event type | [optional] 

### Return type

[**ListLogsAPIResponse**](ListLogsAPIResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminSecurityAuditLogsIdGet**
> GetLogAPIResponse apiV1AdminSecurityAuditLogsIdGet(id)

Get security audit log details

Returns detailed information about a specific security audit log. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final id = 56; // int | Security audit log ID

try {
    final result = api_instance.apiV1AdminSecurityAuditLogsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminSecurityAuditLogsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Security audit log ID | 

### Return type

[**GetLogAPIResponse**](GetLogAPIResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminSecurityAuditLogsStatsGet**
> GetStatsAPIResponse apiV1AdminSecurityAuditLogsStatsGet()

Get security audit statistics

Returns aggregated statistics for security audit logs. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();

try {
    final result = api_instance.apiV1AdminSecurityAuditLogsStatsGet();
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminSecurityAuditLogsStatsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetStatsAPIResponse**](GetStatsAPIResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminServersGet**
> AdminListServersResponse apiV1AdminServersGet()

List all servers

Returns list of all servers. Requires admin access.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();

try {
    final result = api_instance.apiV1AdminServersGet();
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminServersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AdminListServersResponse**](AdminListServersResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminServersIdDelete**
> AdminDeleteServerResponse apiV1AdminServersIdDelete(id)

Delete a server

Delete a server connection. Requires admin access.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final id = 56; // int | Server ID

try {
    final result = api_instance.apiV1AdminServersIdDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminServersIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Server ID | 

### Return type

[**AdminDeleteServerResponse**](AdminDeleteServerResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminServersIdPut**
> AdminUpdateServerResponse apiV1AdminServersIdPut(id, serverUpdateRequest)

Update a server

Update an existing server connection. Requires admin access.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final id = 56; // int | Server ID
final serverUpdateRequest = ServerUpdateRequest(); // ServerUpdateRequest | Server details

try {
    final result = api_instance.apiV1AdminServersIdPut(id, serverUpdateRequest);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminServersIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Server ID | 
 **serverUpdateRequest** | [**ServerUpdateRequest**](ServerUpdateRequest.md)| Server details | 

### Return type

[**AdminUpdateServerResponse**](AdminUpdateServerResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminServersIdTestPost**
> AdminTestConnectionResponse apiV1AdminServersIdTestPost(id)

Test server connection

Test the connection to a server. Requires admin access.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final id = 56; // int | Server ID

try {
    final result = api_instance.apiV1AdminServersIdTestPost(id);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminServersIdTestPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| Server ID | 

### Return type

[**AdminTestConnectionResponse**](AdminTestConnectionResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminServersPost**
> AdminCreateServerResponse apiV1AdminServersPost(serverCreateRequest)

Create a new server

Create a new server connection. Requires admin access.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final serverCreateRequest = ServerCreateRequest(); // ServerCreateRequest | Server details

try {
    final result = api_instance.apiV1AdminServersPost(serverCreateRequest);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminServersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverCreateRequest** | [**ServerCreateRequest**](ServerCreateRequest.md)| Server details | 

### Return type

[**AdminCreateServerResponse**](AdminCreateServerResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminUsersAssignRolePost**
> AssignRoleResponse apiV1AdminUsersAssignRolePost(assignRoleRequest)

Assign a role to a user

Assigns a role to a user. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final assignRoleRequest = AssignRoleRequest(); // AssignRoleRequest | User and role IDs

try {
    final result = api_instance.apiV1AdminUsersAssignRolePost(assignRoleRequest);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminUsersAssignRolePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **assignRoleRequest** | [**AssignRoleRequest**](AssignRoleRequest.md)| User and role IDs | 

### Return type

[**AssignRoleResponse**](AssignRoleResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminUsersPost**
> CreateUserResponse apiV1AdminUsersPost(createUserRequest)

Create a new user

Creates a new user account. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final createUserRequest = CreateUserRequest(); // CreateUserRequest | User details

try {
    final result = api_instance.apiV1AdminUsersPost(createUserRequest);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminUsersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserRequest** | [**CreateUserRequest**](CreateUserRequest.md)| User details | 

### Return type

[**CreateUserResponse**](CreateUserResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminUsersRevokeRolePost**
> RevokeRoleResponse apiV1AdminUsersRevokeRolePost(revokeRoleRequest)

Revoke a role from a user

Revokes a role from a user. Requires admin permissions.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure API key authorization: apiKey
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('apiKey').apiKeyPrefix = 'Bearer';
// TODO Configure API key authorization: session
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKey = 'YOUR_API_KEY';
// uncomment below to setup prefix (e.g. Bearer) for API key, if needed
//defaultApiClient.getAuthentication<ApiKeyAuth>('session').apiKeyPrefix = 'Bearer';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AdminApi();
final revokeRoleRequest = RevokeRoleRequest(); // RevokeRoleRequest | User and role IDs

try {
    final result = api_instance.apiV1AdminUsersRevokeRolePost(revokeRoleRequest);
    print(result);
} catch (e) {
    print('Exception when calling AdminApi->apiV1AdminUsersRevokeRolePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **revokeRoleRequest** | [**RevokeRoleRequest**](RevokeRoleRequest.md)| User and role IDs | 

### Return type

[**RevokeRoleResponse**](RevokeRoleResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

