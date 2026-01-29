# berth_api.api.SessionsApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1SessionsPost**](SessionsApi.md#apiv1sessionspost) | **POST** /api/v1/sessions | List user sessions
[**apiV1SessionsRevokeAllOthersPost**](SessionsApi.md#apiv1sessionsrevokeallotherspost) | **POST** /api/v1/sessions/revoke-all-others | Revoke all other sessions
[**apiV1SessionsRevokePost**](SessionsApi.md#apiv1sessionsrevokepost) | **POST** /api/v1/sessions/revoke | Revoke a session


# **apiV1SessionsPost**
> GetSessionsResponse apiV1SessionsPost(getSessionsRequest)

List user sessions

Returns all active sessions for the authenticated user. The refresh token must be provided to identify the current session.

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

final api_instance = SessionsApi();
final getSessionsRequest = GetSessionsRequest(); // GetSessionsRequest | Refresh token to identify current session

try {
    final result = api_instance.apiV1SessionsPost(getSessionsRequest);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->apiV1SessionsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **getSessionsRequest** | [**GetSessionsRequest**](GetSessionsRequest.md)| Refresh token to identify current session | 

### Return type

[**GetSessionsResponse**](GetSessionsResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1SessionsRevokeAllOthersPost**
> SessionMessageResponse apiV1SessionsRevokeAllOthersPost(revokeAllOtherSessionsRequest)

Revoke all other sessions

Revokes all sessions except the current one. For JWT authentication, the refresh token must be provided in the request body.

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

final api_instance = SessionsApi();
final revokeAllOtherSessionsRequest = RevokeAllOtherSessionsRequest(); // RevokeAllOtherSessionsRequest | Refresh token (required for JWT auth, not needed for session auth)

try {
    final result = api_instance.apiV1SessionsRevokeAllOthersPost(revokeAllOtherSessionsRequest);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->apiV1SessionsRevokeAllOthersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **revokeAllOtherSessionsRequest** | [**RevokeAllOtherSessionsRequest**](RevokeAllOtherSessionsRequest.md)| Refresh token (required for JWT auth, not needed for session auth) | 

### Return type

[**SessionMessageResponse**](SessionMessageResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1SessionsRevokePost**
> SessionMessageResponse apiV1SessionsRevokePost(revokeSessionRequest)

Revoke a session

Revokes a specific session by ID. The user will be logged out from that device.

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

final api_instance = SessionsApi();
final revokeSessionRequest = RevokeSessionRequest(); // RevokeSessionRequest | Session to revoke

try {
    final result = api_instance.apiV1SessionsRevokePost(revokeSessionRequest);
    print(result);
} catch (e) {
    print('Exception when calling SessionsApi->apiV1SessionsRevokePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **revokeSessionRequest** | [**RevokeSessionRequest**](RevokeSessionRequest.md)| Session to revoke | 

### Return type

[**SessionMessageResponse**](SessionMessageResponse.md)

### Authorization

[session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

