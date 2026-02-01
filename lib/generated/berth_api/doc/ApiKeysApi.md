# berth_api.api.ApiKeysApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1ApiKeysGet**](ApiKeysApi.md#apiv1apikeysget) | **GET** /api/v1/api-keys | List API keys
[**apiV1ApiKeysIdDelete**](ApiKeysApi.md#apiv1apikeysiddelete) | **DELETE** /api/v1/api-keys/{id} | Revoke API key
[**apiV1ApiKeysIdGet**](ApiKeysApi.md#apiv1apikeysidget) | **GET** /api/v1/api-keys/{id} | Get API key
[**apiV1ApiKeysIdScopesGet**](ApiKeysApi.md#apiv1apikeysidscopesget) | **GET** /api/v1/api-keys/{id}/scopes | List API key scopes
[**apiV1ApiKeysIdScopesPost**](ApiKeysApi.md#apiv1apikeysidscopespost) | **POST** /api/v1/api-keys/{id}/scopes | Add scope to API key
[**apiV1ApiKeysIdScopesScopeIdDelete**](ApiKeysApi.md#apiv1apikeysidscopesscopeiddelete) | **DELETE** /api/v1/api-keys/{id}/scopes/{scopeId} | Remove scope from API key
[**apiV1ApiKeysPost**](ApiKeysApi.md#apiv1apikeyspost) | **POST** /api/v1/api-keys | Create API key


# **apiV1ApiKeysGet**
> ListAPIKeysResponse apiV1ApiKeysGet()

List API keys

Returns all API keys belonging to the authenticated user.

### Example
```dart
import 'package:berth_api/api.dart';
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

final api_instance = ApiKeysApi();

try {
    final result = api_instance.apiV1ApiKeysGet();
    print(result);
} catch (e) {
    print('Exception when calling ApiKeysApi->apiV1ApiKeysGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListAPIKeysResponse**](ListAPIKeysResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ApiKeysIdDelete**
> MessageResponse apiV1ApiKeysIdDelete(id)

Revoke API key

Revokes (deletes) an API key. This action cannot be undone.

### Example
```dart
import 'package:berth_api/api.dart';
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

final api_instance = ApiKeysApi();
final id = 56; // int | API key ID

try {
    final result = api_instance.apiV1ApiKeysIdDelete(id);
    print(result);
} catch (e) {
    print('Exception when calling ApiKeysApi->apiV1ApiKeysIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| API key ID | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ApiKeysIdGet**
> GetAPIKeyResponse apiV1ApiKeysIdGet(id)

Get API key

Returns details of a specific API key.

### Example
```dart
import 'package:berth_api/api.dart';
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

final api_instance = ApiKeysApi();
final id = 56; // int | API key ID

try {
    final result = api_instance.apiV1ApiKeysIdGet(id);
    print(result);
} catch (e) {
    print('Exception when calling ApiKeysApi->apiV1ApiKeysIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| API key ID | 

### Return type

[**GetAPIKeyResponse**](GetAPIKeyResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ApiKeysIdScopesGet**
> ListScopesResponse apiV1ApiKeysIdScopesGet(id)

List API key scopes

Returns all scopes configured for a specific API key.

### Example
```dart
import 'package:berth_api/api.dart';
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

final api_instance = ApiKeysApi();
final id = 56; // int | API key ID

try {
    final result = api_instance.apiV1ApiKeysIdScopesGet(id);
    print(result);
} catch (e) {
    print('Exception when calling ApiKeysApi->apiV1ApiKeysIdScopesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| API key ID | 

### Return type

[**ListScopesResponse**](ListScopesResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ApiKeysIdScopesPost**
> MessageResponse apiV1ApiKeysIdScopesPost(id, addScopeRequest)

Add scope to API key

Adds a new permission scope to an API key. The scope limits what the API key can access.

### Example
```dart
import 'package:berth_api/api.dart';
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

final api_instance = ApiKeysApi();
final id = 56; // int | API key ID
final addScopeRequest = AddScopeRequest(); // AddScopeRequest | Scope details

try {
    final result = api_instance.apiV1ApiKeysIdScopesPost(id, addScopeRequest);
    print(result);
} catch (e) {
    print('Exception when calling ApiKeysApi->apiV1ApiKeysIdScopesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| API key ID | 
 **addScopeRequest** | [**AddScopeRequest**](AddScopeRequest.md)| Scope details | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ApiKeysIdScopesScopeIdDelete**
> MessageResponse apiV1ApiKeysIdScopesScopeIdDelete(id, scopeId)

Remove scope from API key

Removes a permission scope from an API key.

### Example
```dart
import 'package:berth_api/api.dart';
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

final api_instance = ApiKeysApi();
final id = 56; // int | API key ID
final scopeId = 56; // int | Scope ID

try {
    final result = api_instance.apiV1ApiKeysIdScopesScopeIdDelete(id, scopeId);
    print(result);
} catch (e) {
    print('Exception when calling ApiKeysApi->apiV1ApiKeysIdScopesScopeIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**| API key ID | 
 **scopeId** | **int**| Scope ID | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ApiKeysPost**
> CreateAPIKeyResponse apiV1ApiKeysPost(createAPIKeyRequest)

Create API key

Creates a new API key for the authenticated user. The plain key is only returned once at creation time.

### Example
```dart
import 'package:berth_api/api.dart';
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

final api_instance = ApiKeysApi();
final createAPIKeyRequest = CreateAPIKeyRequest(); // CreateAPIKeyRequest | API key creation request

try {
    final result = api_instance.apiV1ApiKeysPost(createAPIKeyRequest);
    print(result);
} catch (e) {
    print('Exception when calling ApiKeysApi->apiV1ApiKeysPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createAPIKeyRequest** | [**CreateAPIKeyRequest**](CreateAPIKeyRequest.md)| API key creation request | 

### Return type

[**CreateAPIKeyResponse**](CreateAPIKeyResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

