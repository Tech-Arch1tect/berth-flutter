# berth_api.api.ComposeApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1ServersServeridStacksStacknameComposeGet**](ComposeApi.md#apiv1serversserveridstacksstacknamecomposeget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/compose | Get compose configuration
[**apiV1ServersServeridStacksStacknameComposePatch**](ComposeApi.md#apiv1serversserveridstacksstacknamecomposepatch) | **PATCH** /api/v1/servers/{serverid}/stacks/{stackname}/compose | Update compose configuration


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

final api_instance = ComposeApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameComposeGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling ComposeApi->apiV1ServersServeridStacksStacknameComposeGet: $e\n');
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

final api_instance = ComposeApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final updateComposeRequest = UpdateComposeRequest(); // UpdateComposeRequest | Changes to apply to the compose file

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameComposePatch(serverid, stackname, updateComposeRequest);
    print(result);
} catch (e) {
    print('Exception when calling ComposeApi->apiV1ServersServeridStacksStacknameComposePatch: $e\n');
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

