# berth_api.api.RolesApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1AdminRolesIdDelete**](RolesApi.md#apiv1adminrolesiddelete) | **DELETE** /api/v1/admin/roles/{id} | Delete a role
[**apiV1AdminRolesIdPut**](RolesApi.md#apiv1adminrolesidput) | **PUT** /api/v1/admin/roles/{id} | Update a role
[**apiV1AdminRolesPost**](RolesApi.md#apiv1adminrolespost) | **POST** /api/v1/admin/roles | Create a new role
[**apiV1AdminRolesRoleIdStackPermissionsGet**](RolesApi.md#apiv1adminrolesroleidstackpermissionsget) | **GET** /api/v1/admin/roles/{roleId}/stack-permissions | List role stack permissions
[**apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete**](RolesApi.md#apiv1adminrolesroleidstackpermissionspermissioniddelete) | **DELETE** /api/v1/admin/roles/{roleId}/stack-permissions/{permissionId} | Delete a role stack permission
[**apiV1AdminRolesRoleIdStackPermissionsPost**](RolesApi.md#apiv1adminrolesroleidstackpermissionspost) | **POST** /api/v1/admin/roles/{roleId}/stack-permissions | Create a role stack permission


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

final api_instance = RolesApi();
final id = 56; // int | Role ID

try {
    final result = api_instance.apiV1AdminRolesIdDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling RolesApi->apiV1AdminRolesIdDelete: $e\n');
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

final api_instance = RolesApi();
final id = 56; // int | Role ID
final updateRoleRequest = UpdateRoleRequest(); // UpdateRoleRequest | Role details

try {
    final result = api_instance.apiV1AdminRolesIdPut(id, updateRoleRequest);
    print(result);
} catch (e) {
    print('Exception when calling RolesApi->apiV1AdminRolesIdPut: $e\n');
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

final api_instance = RolesApi();
final createRoleRequest = CreateRoleRequest(); // CreateRoleRequest | Role details

try {
    final result = api_instance.apiV1AdminRolesPost(createRoleRequest);
    print(result);
} catch (e) {
    print('Exception when calling RolesApi->apiV1AdminRolesPost: $e\n');
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

final api_instance = RolesApi();
final roleId = 56; // int | Role ID

try {
    final result = api_instance.apiV1AdminRolesRoleIdStackPermissionsGet(roleId);
    print(result);
} catch (e) {
    print('Exception when calling RolesApi->apiV1AdminRolesRoleIdStackPermissionsGet: $e\n');
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

final api_instance = RolesApi();
final roleId = 56; // int | Role ID
final permissionId = 56; // int | Permission rule ID

try {
    final result = api_instance.apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete(roleId, permissionId);
    print(result);
} catch (e) {
    print('Exception when calling RolesApi->apiV1AdminRolesRoleIdStackPermissionsPermissionIdDelete: $e\n');
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

final api_instance = RolesApi();
final roleId = 56; // int | Role ID
final createStackPermissionRequest = CreateStackPermissionRequest(); // CreateStackPermissionRequest | Permission rule details

try {
    final result = api_instance.apiV1AdminRolesRoleIdStackPermissionsPost(roleId, createStackPermissionRequest);
    print(result);
} catch (e) {
    print('Exception when calling RolesApi->apiV1AdminRolesRoleIdStackPermissionsPost: $e\n');
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

