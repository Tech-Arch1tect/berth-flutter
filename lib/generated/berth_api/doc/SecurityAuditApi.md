# berth_api.api.SecurityAuditApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1AdminSecurityAuditLogsGet**](SecurityAuditApi.md#apiv1adminsecurityauditlogsget) | **GET** /api/v1/admin/security-audit-logs | List security audit logs
[**apiV1AdminSecurityAuditLogsIdGet**](SecurityAuditApi.md#apiv1adminsecurityauditlogsidget) | **GET** /api/v1/admin/security-audit-logs/{id} | Get security audit log details
[**apiV1AdminSecurityAuditLogsStatsGet**](SecurityAuditApi.md#apiv1adminsecurityauditlogsstatsget) | **GET** /api/v1/admin/security-audit-logs/stats | Get security audit statistics


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

final api_instance = SecurityAuditApi();
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
    print('Exception when calling SecurityAuditApi->apiV1AdminSecurityAuditLogsGet: $e\n');
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

final api_instance = SecurityAuditApi();
final id = 56; // int | Security audit log ID

try {
    final result = api_instance.apiV1AdminSecurityAuditLogsIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling SecurityAuditApi->apiV1AdminSecurityAuditLogsIdGet: $e\n');
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

final api_instance = SecurityAuditApi();

try {
    final result = api_instance.apiV1AdminSecurityAuditLogsStatsGet();
    print(result);
} catch (e) {
    print('Exception when calling SecurityAuditApi->apiV1AdminSecurityAuditLogsStatsGet: $e\n');
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

