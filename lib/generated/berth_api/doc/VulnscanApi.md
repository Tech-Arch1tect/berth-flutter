# berth_api.api.VulnscanApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1ServersServeridStacksStacknameVulnscanGet**](VulnscanApi.md#apiv1serversserveridstacksstacknamevulnscanget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/vulnscan | Get latest scan for stack
[**apiV1ServersServeridStacksStacknameVulnscanHistoryGet**](VulnscanApi.md#apiv1serversserveridstacksstacknamevulnscanhistoryget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/vulnscan/history | Get scan history for stack
[**apiV1ServersServeridStacksStacknameVulnscanPost**](VulnscanApi.md#apiv1serversserveridstacksstacknamevulnscanpost) | **POST** /api/v1/servers/{serverid}/stacks/{stackname}/vulnscan | Start vulnerability scan
[**apiV1ServersServeridStacksStacknameVulnscanTrendGet**](VulnscanApi.md#apiv1serversserveridstacksstacknamevulnscantrendget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/vulnscan/trend | Get scan trend for stack
[**apiV1VulnscanCompareBaseScanIdCompareScanIdGet**](VulnscanApi.md#apiv1vulnscancomparebasescanidcomparescanidget) | **GET** /api/v1/vulnscan/compare/{baseScanId}/{compareScanId} | Compare two scans
[**apiV1VulnscanScanidGet**](VulnscanApi.md#apiv1vulnscanscanidget) | **GET** /api/v1/vulnscan/{scanid} | Get scan by ID
[**apiV1VulnscanScanidSummaryGet**](VulnscanApi.md#apiv1vulnscanscanidsummaryget) | **GET** /api/v1/vulnscan/{scanid}/summary | Get scan summary


# **apiV1ServersServeridStacksStacknameVulnscanGet**
> GetLatestScanResponse apiV1ServersServeridStacksStacknameVulnscanGet(serverid, stackname)

Get latest scan for stack

Returns the most recent vulnerability scan and summary for a stack. Requires stacks.read permission.

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

final api_instance = VulnscanApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameVulnscanGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling VulnscanApi->apiV1ServersServeridStacksStacknameVulnscanGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 

### Return type

[**GetLatestScanResponse**](GetLatestScanResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameVulnscanHistoryGet**
> GetScansHistoryResponse apiV1ServersServeridStacksStacknameVulnscanHistoryGet(serverid, stackname)

Get scan history for stack

Returns all vulnerability scans for a stack with summaries. Requires stacks.read permission.

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

final api_instance = VulnscanApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameVulnscanHistoryGet(serverid, stackname);
    print(result);
} catch (e) {
    print('Exception when calling VulnscanApi->apiV1ServersServeridStacksStacknameVulnscanHistoryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 

### Return type

[**GetScansHistoryResponse**](GetScansHistoryResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameVulnscanPost**
> StartScanResponse apiV1ServersServeridStacksStacknameVulnscanPost(serverid, stackname, startScanRequest)

Start vulnerability scan

Starts a vulnerability scan for a stack. Requires stacks.read permission.

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

final api_instance = VulnscanApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final startScanRequest = StartScanRequest(); // StartScanRequest | Optional list of services to scan

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameVulnscanPost(serverid, stackname, startScanRequest);
    print(result);
} catch (e) {
    print('Exception when calling VulnscanApi->apiV1ServersServeridStacksStacknameVulnscanPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **startScanRequest** | [**StartScanRequest**](StartScanRequest.md)| Optional list of services to scan | 

### Return type

[**StartScanResponse**](StartScanResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameVulnscanTrendGet**
> GetScanTrendResponse apiV1ServersServeridStacksStacknameVulnscanTrendGet(serverid, stackname, limit)

Get scan trend for stack

Returns vulnerability trend data for a stack. Requires stacks.read permission.

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

final api_instance = VulnscanApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final limit = 56; // int | Maximum number of scans to include (default 10, max 50)

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameVulnscanTrendGet(serverid, stackname, limit);
    print(result);
} catch (e) {
    print('Exception when calling VulnscanApi->apiV1ServersServeridStacksStacknameVulnscanTrendGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **limit** | **int**| Maximum number of scans to include (default 10, max 50) | [optional] 

### Return type

[**GetScanTrendResponse**](GetScanTrendResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1VulnscanCompareBaseScanIdCompareScanIdGet**
> CompareScanResponse apiV1VulnscanCompareBaseScanIdCompareScanIdGet(baseScanId, compareScanId)

Compare two scans

Compares two vulnerability scans and returns new, fixed, and unchanged vulnerabilities. Both scans must be from the same stack. Requires stacks.read permission.

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

final api_instance = VulnscanApi();
final baseScanId = 56; // int | Base scan ID
final compareScanId = 56; // int | Comparison scan ID

try {
    final result = api_instance.apiV1VulnscanCompareBaseScanIdCompareScanIdGet(baseScanId, compareScanId);
    print(result);
} catch (e) {
    print('Exception when calling VulnscanApi->apiV1VulnscanCompareBaseScanIdCompareScanIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **baseScanId** | **int**| Base scan ID | 
 **compareScanId** | **int**| Comparison scan ID | 

### Return type

[**CompareScanResponse**](CompareScanResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1VulnscanScanidGet**
> GetScanResponse apiV1VulnscanScanidGet(scanid)

Get scan by ID

Returns a specific vulnerability scan with all vulnerabilities. Requires stacks.read permission for the scanned stack.

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

final api_instance = VulnscanApi();
final scanid = 56; // int | Scan ID

try {
    final result = api_instance.apiV1VulnscanScanidGet(scanid);
    print(result);
} catch (e) {
    print('Exception when calling VulnscanApi->apiV1VulnscanScanidGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scanid** | **int**| Scan ID | 

### Return type

[**GetScanResponse**](GetScanResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1VulnscanScanidSummaryGet**
> GetScanSummaryResponse apiV1VulnscanScanidSummaryGet(scanid)

Get scan summary

Returns vulnerability counts by severity for a scan. Requires stacks.read permission for the scanned stack.

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

final api_instance = VulnscanApi();
final scanid = 56; // int | Scan ID

try {
    final result = api_instance.apiV1VulnscanScanidSummaryGet(scanid);
    print(result);
} catch (e) {
    print('Exception when calling VulnscanApi->apiV1VulnscanScanidSummaryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scanid** | **int**| Scan ID | 

### Return type

[**GetScanSummaryResponse**](GetScanSummaryResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

