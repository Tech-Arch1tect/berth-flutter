# berth_api.api.AuthApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1AuthLoginPost**](AuthApi.md#apiv1authloginpost) | **POST** /api/v1/auth/login | Login with username and password
[**apiV1AuthLogoutPost**](AuthApi.md#apiv1authlogoutpost) | **POST** /api/v1/auth/logout | Logout and revoke tokens
[**apiV1AuthRefreshPost**](AuthApi.md#apiv1authrefreshpost) | **POST** /api/v1/auth/refresh | Refresh access token
[**apiV1AuthTotpVerifyPost**](AuthApi.md#apiv1authtotpverifypost) | **POST** /api/v1/auth/totp/verify | Verify TOTP code to complete login


# **apiV1AuthLoginPost**
> AuthTOTPRequiredResponse apiV1AuthLoginPost(authLoginRequest)

Login with username and password

Authenticates a user with username and password. If TOTP is enabled, returns a temporary token that must be used with /auth/totp/verify to complete authentication.

### Example
```dart
import 'package:berth_api/api.dart';

final api_instance = AuthApi();
final authLoginRequest = AuthLoginRequest(); // AuthLoginRequest | Login credentials

try {
    final result = api_instance.apiV1AuthLoginPost(authLoginRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->apiV1AuthLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authLoginRequest** | [**AuthLoginRequest**](AuthLoginRequest.md)| Login credentials | 

### Return type

[**AuthTOTPRequiredResponse**](AuthTOTPRequiredResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AuthLogoutPost**
> AuthLogoutResponse apiV1AuthLogoutPost(authLogoutRequest)

Logout and revoke tokens

Revokes the access token and refresh token, effectively logging the user out. The refresh token must be provided in the request body.

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

final api_instance = AuthApi();
final authLogoutRequest = AuthLogoutRequest(); // AuthLogoutRequest | Refresh token to revoke

try {
    final result = api_instance.apiV1AuthLogoutPost(authLogoutRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->apiV1AuthLogoutPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authLogoutRequest** | [**AuthLogoutRequest**](AuthLogoutRequest.md)| Refresh token to revoke | 

### Return type

[**AuthLogoutResponse**](AuthLogoutResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AuthRefreshPost**
> AuthRefreshResponse apiV1AuthRefreshPost(authRefreshRequest)

Refresh access token

Exchanges a valid refresh token for new access and refresh tokens. Implements token rotation - the old refresh token is invalidated.

### Example
```dart
import 'package:berth_api/api.dart';

final api_instance = AuthApi();
final authRefreshRequest = AuthRefreshRequest(); // AuthRefreshRequest | Refresh token

try {
    final result = api_instance.apiV1AuthRefreshPost(authRefreshRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->apiV1AuthRefreshPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authRefreshRequest** | [**AuthRefreshRequest**](AuthRefreshRequest.md)| Refresh token | 

### Return type

[**AuthRefreshResponse**](AuthRefreshResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AuthTotpVerifyPost**
> AuthLoginResponse apiV1AuthTotpVerifyPost(authTOTPVerifyRequest)

Verify TOTP code to complete login

Completes the login flow when TOTP is enabled. Requires the temporary token from /auth/login and a valid TOTP code from the authenticator app.

### Example
```dart
import 'package:berth_api/api.dart';
// TODO Configure HTTP Bearer authorization: bearerAuth
// Case 1. Use String Token
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken('YOUR_ACCESS_TOKEN');
// Case 2. Use Function which generate token.
// String yourTokenGeneratorFunction() { ... }
//defaultApiClient.getAuthentication<HttpBearerAuth>('bearerAuth').setAccessToken(yourTokenGeneratorFunction);

final api_instance = AuthApi();
final authTOTPVerifyRequest = AuthTOTPVerifyRequest(); // AuthTOTPVerifyRequest | TOTP verification code

try {
    final result = api_instance.apiV1AuthTotpVerifyPost(authTOTPVerifyRequest);
    print(result);
} catch (e) {
    print('Exception when calling AuthApi->apiV1AuthTotpVerifyPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **authTOTPVerifyRequest** | [**AuthTOTPVerifyRequest**](AuthTOTPVerifyRequest.md)| TOTP verification code | 

### Return type

[**AuthLoginResponse**](AuthLoginResponse.md)

### Authorization

[bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

