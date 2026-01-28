# berth_api.api.OperationLogsApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1AdminOperationLogsGet**](OperationLogsApi.md#apiv1adminoperationlogsget) | **GET** /api/v1/admin/operation-logs | List all operation logs
[**apiV1AdminOperationLogsIdGet**](OperationLogsApi.md#apiv1adminoperationlogsidget) | **GET** /api/v1/admin/operation-logs/{id} | Get operation log details
[**apiV1AdminOperationLogsStatsGet**](OperationLogsApi.md#apiv1adminoperationlogsstatsget) | **GET** /api/v1/admin/operation-logs/stats | Get operation logs statistics
[**apiV1OperationLogsByOperationIdOperationIdGet**](OperationLogsApi.md#apiv1operationlogsbyoperationidoperationidget) | **GET** /api/v1/operation-logs/by-operation-id/{operationId} | Get operation log details by operation ID
[**apiV1OperationLogsGet**](OperationLogsApi.md#apiv1operationlogsget) | **GET** /api/v1/operation-logs | List user's operation logs
[**apiV1OperationLogsIdGet**](OperationLogsApi.md#apiv1operationlogsidget) | **GET** /api/v1/operation-logs/{id} | Get operation log details
[**apiV1OperationLogsStatsGet**](OperationLogsApi.md#apiv1operationlogsstatsget) | **GET** /api/v1/operation-logs/stats | Get user's operation logs statistics
[**apiV1RunningOperationsGet**](OperationLogsApi.md#apiv1runningoperationsget) | **GET** /api/v1/running-operations | Get running operations


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

final api_instance = OperationLogsApi();
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
    print('Exception when calling OperationLogsApi->apiV1AdminOperationLogsGet: $e\n');
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

final api_instance = OperationLogsApi();
final id = 56; // int | Operation log ID

try {
    final result = api_instance.apiV1AdminOperationLogsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling OperationLogsApi->apiV1AdminOperationLogsIdGet: $e\n');
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

final api_instance = OperationLogsApi();

try {
    final result = api_instance.apiV1AdminOperationLogsStatsGet();
    print(result);
} catch (e) {
    print('Exception when calling OperationLogsApi->apiV1AdminOperationLogsStatsGet: $e\n');
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

# **apiV1OperationLogsByOperationIdOperationIdGet**
> OperationLogDetail apiV1OperationLogsByOperationIdOperationIdGet(operationId)

Get operation log details by operation ID

Returns detailed information about a specific operation log by its operation ID. Only returns logs belonging to the authenticated user.

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

final api_instance = OperationLogsApi();
final operationId = operationId_example; // String | Operation ID (UUID)

try {
    final result = api_instance.apiV1OperationLogsByOperationIdOperationIdGet(operationId);
    print(result);
} catch (e) {
    print('Exception when calling OperationLogsApi->apiV1OperationLogsByOperationIdOperationIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **operationId** | **String**| Operation ID (UUID) | 

### Return type

[**OperationLogDetail**](OperationLogDetail.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1OperationLogsGet**
> PaginatedOperationLogs apiV1OperationLogsGet(page, pageSize, search, serverId, stackName, command, status, daysBack)

List user's operation logs

Returns paginated list of operation logs for the authenticated user.

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

final api_instance = OperationLogsApi();
final page = 56; // int | Page number
final pageSize = 56; // int | Number of items per page
final search = search_example; // String | Search term for stack name, command, or operation ID
final serverId = serverId_example; // String | Filter by server ID
final stackName = stackName_example; // String | Filter by stack name (partial match)
final command = command_example; // String | Filter by command
final status = status_example; // String | Filter by status
final daysBack = 56; // int | Only return logs from the last N days

try {
    final result = api_instance.apiV1OperationLogsGet(page, pageSize, search, serverId, stackName, command, status, daysBack);
    print(result);
} catch (e) {
    print('Exception when calling OperationLogsApi->apiV1OperationLogsGet: $e\n');
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

# **apiV1OperationLogsIdGet**
> OperationLogDetail apiV1OperationLogsIdGet(id)

Get operation log details

Returns detailed information about a specific operation log including all messages. Only returns logs belonging to the authenticated user.

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

final api_instance = OperationLogsApi();
final id = 56; // int | Operation log ID

try {
    final result = api_instance.apiV1OperationLogsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling OperationLogsApi->apiV1OperationLogsIdGet: $e\n');
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

# **apiV1OperationLogsStatsGet**
> OperationLogStats apiV1OperationLogsStatsGet()

Get user's operation logs statistics

Returns aggregated statistics for the authenticated user's operation logs.

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

final api_instance = OperationLogsApi();

try {
    final result = api_instance.apiV1OperationLogsStatsGet();
    print(result);
} catch (e) {
    print('Exception when calling OperationLogsApi->apiV1OperationLogsStatsGet: $e\n');
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

# **apiV1RunningOperationsGet**
> RunningOperationsResponse apiV1RunningOperationsGet()

Get running operations

Returns list of currently running operations for the authenticated user.

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

final api_instance = OperationLogsApi();

try {
    final result = api_instance.apiV1RunningOperationsGet();
    print(result);
} catch (e) {
    print('Exception when calling OperationLogsApi->apiV1RunningOperationsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**RunningOperationsResponse**](RunningOperationsResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

