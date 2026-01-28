# berth_api.api.MaintenanceApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1ServersServeridMaintenanceInfoGet**](MaintenanceApi.md#apiv1serversserveridmaintenanceinfoget) | **GET** /api/v1/servers/{serverid}/maintenance/info | Get Docker system information
[**apiV1ServersServeridMaintenancePermissionsGet**](MaintenanceApi.md#apiv1serversserveridmaintenancepermissionsget) | **GET** /api/v1/servers/{serverid}/maintenance/permissions | Check maintenance permissions
[**apiV1ServersServeridMaintenancePrunePost**](MaintenanceApi.md#apiv1serversserveridmaintenanceprunepost) | **POST** /api/v1/servers/{serverid}/maintenance/prune | Prune Docker resources
[**apiV1ServersServeridMaintenanceResourceDelete**](MaintenanceApi.md#apiv1serversserveridmaintenanceresourcedelete) | **DELETE** /api/v1/servers/{serverid}/maintenance/resource | Delete Docker resource


# **apiV1ServersServeridMaintenanceInfoGet**
> MaintenanceInfo apiV1ServersServeridMaintenanceInfoGet(serverid)

Get Docker system information

Returns detailed Docker system information including disk usage, images, containers, volumes, networks, and build cache

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

final api_instance = MaintenanceApi();
final serverid = 56; // int | Server ID

try {
    final result = api_instance.apiV1ServersServeridMaintenanceInfoGet(serverid);
    print(result);
} catch (e) {
    print('Exception when calling MaintenanceApi->apiV1ServersServeridMaintenanceInfoGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 

### Return type

[**MaintenanceInfo**](MaintenanceInfo.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridMaintenancePermissionsGet**
> PermissionsResponse apiV1ServersServeridMaintenancePermissionsGet(serverid)

Check maintenance permissions

Returns the user's read and write permissions for Docker maintenance operations on the server

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

final api_instance = MaintenanceApi();
final serverid = 56; // int | Server ID

try {
    final result = api_instance.apiV1ServersServeridMaintenancePermissionsGet(serverid);
    print(result);
} catch (e) {
    print('Exception when calling MaintenanceApi->apiV1ServersServeridMaintenancePermissionsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 

### Return type

[**PermissionsResponse**](PermissionsResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridMaintenancePrunePost**
> PruneResult apiV1ServersServeridMaintenancePrunePost(serverid, pruneRequest)

Prune Docker resources

Removes unused Docker resources such as images, containers, volumes, networks, or build cache

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

final api_instance = MaintenanceApi();
final serverid = 56; // int | Server ID
final pruneRequest = PruneRequest(); // PruneRequest | Prune request specifying the resource type to prune

try {
    final result = api_instance.apiV1ServersServeridMaintenancePrunePost(serverid, pruneRequest);
    print(result);
} catch (e) {
    print('Exception when calling MaintenanceApi->apiV1ServersServeridMaintenancePrunePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **pruneRequest** | [**PruneRequest**](PruneRequest.md)| Prune request specifying the resource type to prune | 

### Return type

[**PruneResult**](PruneResult.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridMaintenanceResourceDelete**
> DeleteResult apiV1ServersServeridMaintenanceResourceDelete(serverid, deleteRequest)

Delete Docker resource

Deletes a specific Docker resource (image, container, volume, or network) by ID

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

final api_instance = MaintenanceApi();
final serverid = 56; // int | Server ID
final deleteRequest = DeleteRequest(); // DeleteRequest | Delete request specifying the resource type and ID

try {
    final result = api_instance.apiV1ServersServeridMaintenanceResourceDelete(serverid, deleteRequest);
    print(result);
} catch (e) {
    print('Exception when calling MaintenanceApi->apiV1ServersServeridMaintenanceResourceDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **deleteRequest** | [**DeleteRequest**](DeleteRequest.md)| Delete request specifying the resource type and ID | 

### Return type

[**DeleteResult**](DeleteResult.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

