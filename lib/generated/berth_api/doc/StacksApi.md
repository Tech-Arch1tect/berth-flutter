# berth_api.api.StacksApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1ServersServeridStacksCanCreateGet**](StacksApi.md#apiv1serversserveridstackscancreateget) | **GET** /api/v1/servers/{serverid}/stacks/can-create | Check if user can create stacks
[**apiV1ServersServeridStacksGet**](StacksApi.md#apiv1serversserveridstacksget) | **GET** /api/v1/servers/{serverid}/stacks | List server stacks
[**apiV1ServersServeridStacksPost**](StacksApi.md#apiv1serversserveridstackspost) | **POST** /api/v1/servers/{serverid}/stacks | Create a new stack
[**apiV1ServersServeridStacksStacknameComposeGet**](StacksApi.md#apiv1serversserveridstacksstacknamecomposeget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/compose | Get compose configuration
[**apiV1ServersServeridStacksStacknameComposePatch**](StacksApi.md#apiv1serversserveridstacksstacknamecomposepatch) | **PATCH** /api/v1/servers/{serverid}/stacks/{stackname}/compose | Update compose configuration
[**apiV1ServersServeridStacksStacknameEnvironmentGet**](StacksApi.md#apiv1serversserveridstacksstacknameenvironmentget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/environment | Get stack environment variables
[**apiV1ServersServeridStacksStacknameGet**](StacksApi.md#apiv1serversserveridstacksstacknameget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname} | Get stack details
[**apiV1ServersServeridStacksStacknameImagesGet**](StacksApi.md#apiv1serversserveridstacksstacknameimagesget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/images | Get container image details
[**apiV1ServersServeridStacksStacknameNetworksGet**](StacksApi.md#apiv1serversserveridstacksstacknamenetworksget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/networks | Get stack networks
[**apiV1ServersServeridStacksStacknamePermissionsGet**](StacksApi.md#apiv1serversserveridstacksstacknamepermissionsget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/permissions | Check stack permissions
[**apiV1ServersServeridStacksStacknameStatsGet**](StacksApi.md#apiv1serversserveridstacksstacknamestatsget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/stats | Get stack statistics
[**apiV1ServersServeridStacksStacknameVolumesGet**](StacksApi.md#apiv1serversserveridstacksstacknamevolumesget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/volumes | Get stack volumes


# **apiV1ServersServeridStacksCanCreateGet**
> CanCreateStackResponse apiV1ServersServeridStacksCanCreateGet(serverid)

Check if user can create stacks

Returns whether the authenticated user has permission to create stacks on the server

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID

try {
    final result = api_instance.apiV1ServersServeridStacksCanCreateGet(serverid);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksCanCreateGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 

### Return type

[**CanCreateStackResponse**](CanCreateStackResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksGet**
> ListStacksResponse apiV1ServersServeridStacksGet(serverid)

List server stacks

Returns all stacks on a server that the authenticated user has permission to access

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID

try {
    final result = api_instance.apiV1ServersServeridStacksGet(serverid);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 

### Return type

[**ListStacksResponse**](ListStacksResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksPost**
> CreateStackResponse apiV1ServersServeridStacksPost(serverid, createStackRequest)

Create a new stack

Creates a new stack on the server

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final createStackRequest = CreateStackRequest(); // CreateStackRequest | Stack creation request

try {
    final result = api_instance.apiV1ServersServeridStacksPost(serverid, createStackRequest);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **createStackRequest** | [**CreateStackRequest**](CreateStackRequest.md)| Stack creation request | 

### Return type

[**CreateStackResponse**](CreateStackResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameComposeGet**
> RawComposeConfig apiV1ServersServeridStacksStacknameComposeGet(serverid, stackname)

Get compose configuration

Returns the parsed Docker Compose configuration for a stack. Requires files.read permission.

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameComposeGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksStacknameComposeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 

### Return type

[**RawComposeConfig**](RawComposeConfig.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameComposePatch**
> UpdateComposeResponse apiV1ServersServeridStacksStacknameComposePatch(serverid, stackname, updateComposeRequest)

Update compose configuration

Updates the Docker Compose configuration with the specified changes. Supports preview mode to see changes without applying. Requires files.write permission.

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final updateComposeRequest = UpdateComposeRequest(); // UpdateComposeRequest | Changes to apply to the compose file

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameComposePatch(serverid, stackname, updateComposeRequest);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksStacknameComposePatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **updateComposeRequest** | [**UpdateComposeRequest**](UpdateComposeRequest.md)| Changes to apply to the compose file | 

### Return type

[**UpdateComposeResponse**](UpdateComposeResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameEnvironmentGet**
> StackEnvironmentResponse apiV1ServersServeridStacksStacknameEnvironmentGet(serverid, stackname, unmask)

Get stack environment variables

Returns environment variables for all services in a stack. Use unmask=true to see sensitive values.

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final unmask = unmask_example; // String | Set to true to unmask sensitive values

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameEnvironmentGet(serverid, stackname, unmask);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksStacknameEnvironmentGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **unmask** | **String**| Set to true to unmask sensitive values | [optional] 

### Return type

[**StackEnvironmentResponse**](StackEnvironmentResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameGet**
> StackDetails apiV1ServersServeridStacksStacknameGet(serverid, stackname)

Get stack details

Returns detailed information about a specific stack including services and containers

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksStacknameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 

### Return type

[**StackDetails**](StackDetails.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameImagesGet**
> StackImagesResponse apiV1ServersServeridStacksStacknameImagesGet(serverid, stackname)

Get container image details

Returns detailed image information for all containers in a stack

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameImagesGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksStacknameImagesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 

### Return type

[**StackImagesResponse**](StackImagesResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameNetworksGet**
> StackNetworksResponse apiV1ServersServeridStacksStacknameNetworksGet(serverid, stackname)

Get stack networks

Returns network information for a specific stack

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameNetworksGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksStacknameNetworksGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 

### Return type

[**StackNetworksResponse**](StackNetworksResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknamePermissionsGet**
> StackPermissionsResponse apiV1ServersServeridStacksStacknamePermissionsGet(serverid, stackname)

Check stack permissions

Returns the list of permissions the authenticated user has for a specific stack

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknamePermissionsGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksStacknamePermissionsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 

### Return type

[**StackPermissionsResponse**](StackPermissionsResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameStatsGet**
> StackStatsResponse apiV1ServersServeridStacksStacknameStatsGet(serverid, stackname)

Get stack statistics

Returns resource usage statistics for all containers in a stack

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameStatsGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksStacknameStatsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 

### Return type

[**StackStatsResponse**](StackStatsResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameVolumesGet**
> StackVolumesResponse apiV1ServersServeridStacksStacknameVolumesGet(serverid, stackname)

Get stack volumes

Returns volume information for a specific stack

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

final api_instance = StacksApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameVolumesGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling StacksApi->apiV1ServersServeridStacksStacknameVolumesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 

### Return type

[**StackVolumesResponse**](StackVolumesResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

