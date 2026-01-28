# berth_api.api.TotpApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1TotpDisablePost**](TotpApi.md#apiv1totpdisablepost) | **POST** /api/v1/totp/disable | Disable TOTP
[**apiV1TotpEnablePost**](TotpApi.md#apiv1totpenablepost) | **POST** /api/v1/totp/enable | Enable TOTP
[**apiV1TotpSetupGet**](TotpApi.md#apiv1totpsetupget) | **GET** /api/v1/totp/setup | Get TOTP setup information
[**apiV1TotpStatusGet**](TotpApi.md#apiv1totpstatusget) | **GET** /api/v1/totp/status | Get TOTP status


# **apiV1TotpDisablePost**
> TOTPMessageResponse apiV1TotpDisablePost(tOTPDisableRequest)

Disable TOTP

Disables two-factor authentication. Requires both the current TOTP code and password for security.

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

final api_instance = TotpApi();
final tOTPDisableRequest = TOTPDisableRequest(); // TOTPDisableRequest | TOTP code and password

try {
    final result = api_instance.apiV1TotpDisablePost(tOTPDisableRequest);
    print(result);
} catch (e) {
    print('Exception when calling TotpApi->apiV1TotpDisablePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tOTPDisableRequest** | [**TOTPDisableRequest**](TOTPDisableRequest.md)| TOTP code and password | 

### Return type

[**TOTPMessageResponse**](TOTPMessageResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1TotpEnablePost**
> TOTPMessageResponse apiV1TotpEnablePost(tOTPEnableRequest)

Enable TOTP

Enables two-factor authentication after verifying the TOTP code from the authenticator app.

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

final api_instance = TotpApi();
final tOTPEnableRequest = TOTPEnableRequest(); // TOTPEnableRequest | TOTP verification code

try {
    final result = api_instance.apiV1TotpEnablePost(tOTPEnableRequest);
    print(result);
} catch (e) {
    print('Exception when calling TotpApi->apiV1TotpEnablePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tOTPEnableRequest** | [**TOTPEnableRequest**](TOTPEnableRequest.md)| TOTP verification code | 

### Return type

[**TOTPMessageResponse**](TOTPMessageResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1TotpSetupGet**
> TOTPSetupResponse apiV1TotpSetupGet()

Get TOTP setup information

Returns the QR code URI and secret for setting up two-factor authentication. Only available if TOTP is not already enabled.

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

final api_instance = TotpApi();

try {
    final result = api_instance.apiV1TotpSetupGet();
    print(result);
} catch (e) {
    print('Exception when calling TotpApi->apiV1TotpSetupGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TOTPSetupResponse**](TOTPSetupResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1TotpStatusGet**
> TOTPStatusResponse apiV1TotpStatusGet()

Get TOTP status

Returns whether two-factor authentication is enabled for the authenticated user.

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

final api_instance = TotpApi();

try {
    final result = api_instance.apiV1TotpStatusGet();
    print(result);
} catch (e) {
    print('Exception when calling TotpApi->apiV1TotpStatusGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TOTPStatusResponse**](TOTPStatusResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

