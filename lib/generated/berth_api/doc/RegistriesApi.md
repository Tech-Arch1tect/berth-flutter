# berth_api.api.RegistriesApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1ServersServeridRegistriesGet**](RegistriesApi.md#apiv1serversserveridregistriesget) | **GET** /api/v1/servers/{serverid}/registries | List registry credentials
[**apiV1ServersServeridRegistriesIdDelete**](RegistriesApi.md#apiv1serversserveridregistriesiddelete) | **DELETE** /api/v1/servers/{serverid}/registries/{id} | Delete registry credential
[**apiV1ServersServeridRegistriesIdGet**](RegistriesApi.md#apiv1serversserveridregistriesidget) | **GET** /api/v1/servers/{serverid}/registries/{id} | Get registry credential
[**apiV1ServersServeridRegistriesIdPut**](RegistriesApi.md#apiv1serversserveridregistriesidput) | **PUT** /api/v1/servers/{serverid}/registries/{id} | Update registry credential
[**apiV1ServersServeridRegistriesPost**](RegistriesApi.md#apiv1serversserveridregistriespost) | **POST** /api/v1/servers/{serverid}/registries | Create registry credential


# **apiV1ServersServeridRegistriesGet**
> ListCredentialsResponse apiV1ServersServeridRegistriesGet(serverid)

List registry credentials

Returns all registry credentials for a server. Requires registries.manage permission.

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

final api_instance = RegistriesApi();
final serverid = 56; // int | Server ID

try {
    final result = api_instance.apiV1ServersServeridRegistriesGet(serverid);
    print(result);
} catch (e) {
    print('Exception when calling RegistriesApi->apiV1ServersServeridRegistriesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 

### Return type

[**ListCredentialsResponse**](ListCredentialsResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridRegistriesIdDelete**
> DeleteCredentialResponse apiV1ServersServeridRegistriesIdDelete(serverid, id)

Delete registry credential

Deletes a registry credential. Requires registries.manage permission.

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

final api_instance = RegistriesApi();
final serverid = 56; // int | Server ID
final id = 56; // int | Credential ID

try {
    final result = api_instance.apiV1ServersServeridRegistriesIdDelete(serverid, id);
    print(result);
} catch (e) {
    print('Exception when calling RegistriesApi->apiV1ServersServeridRegistriesIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **id** | **int**| Credential ID | 

### Return type

[**DeleteCredentialResponse**](DeleteCredentialResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridRegistriesIdGet**
> GetCredentialResponse apiV1ServersServeridRegistriesIdGet(serverid, id)

Get registry credential

Returns a specific registry credential by ID. Requires registries.manage permission.

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

final api_instance = RegistriesApi();
final serverid = 56; // int | Server ID
final id = 56; // int | Credential ID

try {
    final result = api_instance.apiV1ServersServeridRegistriesIdGet(serverid, id);
    print(result);
} catch (e) {
    print('Exception when calling RegistriesApi->apiV1ServersServeridRegistriesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **id** | **int**| Credential ID | 

### Return type

[**GetCredentialResponse**](GetCredentialResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridRegistriesIdPut**
> UpdateCredentialResponse apiV1ServersServeridRegistriesIdPut(serverid, id, updateCredentialRequest)

Update registry credential

Updates an existing registry credential. Requires registries.manage permission.

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

final api_instance = RegistriesApi();
final serverid = 56; // int | Server ID
final id = 56; // int | Credential ID
final updateCredentialRequest = UpdateCredentialRequest(); // UpdateCredentialRequest | Updated registry credential details

try {
    final result = api_instance.apiV1ServersServeridRegistriesIdPut(serverid, id, updateCredentialRequest);
    print(result);
} catch (e) {
    print('Exception when calling RegistriesApi->apiV1ServersServeridRegistriesIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **id** | **int**| Credential ID | 
 **updateCredentialRequest** | [**UpdateCredentialRequest**](UpdateCredentialRequest.md)| Updated registry credential details | 

### Return type

[**UpdateCredentialResponse**](UpdateCredentialResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridRegistriesPost**
> CreateCredentialResponse apiV1ServersServeridRegistriesPost(serverid, createCredentialRequest)

Create registry credential

Creates a new registry credential for a server. Requires registries.manage permission.

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

final api_instance = RegistriesApi();
final serverid = 56; // int | Server ID
final createCredentialRequest = CreateCredentialRequest(); // CreateCredentialRequest | Registry credential details

try {
    final result = api_instance.apiV1ServersServeridRegistriesPost(serverid, createCredentialRequest);
    print(result);
} catch (e) {
    print('Exception when calling RegistriesApi->apiV1ServersServeridRegistriesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **createCredentialRequest** | [**CreateCredentialRequest**](CreateCredentialRequest.md)| Registry credential details | 

### Return type

[**CreateCredentialResponse**](CreateCredentialResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

