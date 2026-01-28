# berth_api.api.LogsApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1ServersServeridStacksStacknameContainersContainerNameLogsGet**](LogsApi.md#apiv1serversserveridstacksstacknamecontainerscontainernamelogsget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/containers/{containerName}/logs | Get container logs
[**apiV1ServersServeridStacksStacknameLogsGet**](LogsApi.md#apiv1serversserveridstacksstacknamelogsget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/logs | Get stack logs


# **apiV1ServersServeridStacksStacknameContainersContainerNameLogsGet**
> LogsResponse apiV1ServersServeridStacksStacknameContainersContainerNameLogsGet(serverid, stackname, containerName, tail, since, timestamps)

Get container logs

Returns logs for a specific container in a stack

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

final api_instance = LogsApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final containerName = containerName_example; // String | Container name
final tail = 56; // int | Number of log lines to return
final since = since_example; // String | Only return logs since this timestamp (RFC3339 format)
final timestamps = true; // bool | Include timestamps in log output

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameContainersContainerNameLogsGet(serverid, stackname, containerName, tail, since, timestamps);
    print(result);
} catch (e) {
    print('Exception when calling LogsApi->apiV1ServersServeridStacksStacknameContainersContainerNameLogsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **containerName** | **String**| Container name | 
 **tail** | **int**| Number of log lines to return | [optional] [default to 100]
 **since** | **String**| Only return logs since this timestamp (RFC3339 format) | [optional] 
 **timestamps** | **bool**| Include timestamps in log output | [optional] [default to true]

### Return type

[**LogsResponse**](LogsResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameLogsGet**
> LogsResponse apiV1ServersServeridStacksStacknameLogsGet(serverid, stackname, tail, since, timestamps)

Get stack logs

Returns logs for all containers in a stack

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

final api_instance = LogsApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final tail = 56; // int | Number of log lines to return
final since = since_example; // String | Only return logs since this timestamp (RFC3339 format)
final timestamps = true; // bool | Include timestamps in log output

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameLogsGet(serverid, stackname, tail, since, timestamps);
    print(result);
} catch (e) {
    print('Exception when calling LogsApi->apiV1ServersServeridStacksStacknameLogsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **tail** | **int**| Number of log lines to return | [optional] [default to 100]
 **since** | **String**| Only return logs since this timestamp (RFC3339 format) | [optional] 
 **timestamps** | **bool**| Include timestamps in log output | [optional] [default to true]

### Return type

[**LogsResponse**](LogsResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

