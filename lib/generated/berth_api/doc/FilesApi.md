# berth_api.api.FilesApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1ServersServeridStacksStacknameFilesChmodPost**](FilesApi.md#apiv1serversserveridstacksstacknamefileschmodpost) | **POST** /api/v1/servers/{serverid}/stacks/{stackname}/files/chmod | Change file permissions
[**apiV1ServersServeridStacksStacknameFilesChownPost**](FilesApi.md#apiv1serversserveridstacksstacknamefileschownpost) | **POST** /api/v1/servers/{serverid}/stacks/{stackname}/files/chown | Change file ownership
[**apiV1ServersServeridStacksStacknameFilesCopyPost**](FilesApi.md#apiv1serversserveridstacksstacknamefilescopypost) | **POST** /api/v1/servers/{serverid}/stacks/{stackname}/files/copy | Copy file or directory
[**apiV1ServersServeridStacksStacknameFilesDeleteDelete**](FilesApi.md#apiv1serversserveridstacksstacknamefilesdeletedelete) | **DELETE** /api/v1/servers/{serverid}/stacks/{stackname}/files/delete | Delete file or directory
[**apiV1ServersServeridStacksStacknameFilesDownloadGet**](FilesApi.md#apiv1serversserveridstacksstacknamefilesdownloadget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/files/download | Download a file
[**apiV1ServersServeridStacksStacknameFilesGet**](FilesApi.md#apiv1serversserveridstacksstacknamefilesget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/files | List directory contents
[**apiV1ServersServeridStacksStacknameFilesMkdirPost**](FilesApi.md#apiv1serversserveridstacksstacknamefilesmkdirpost) | **POST** /api/v1/servers/{serverid}/stacks/{stackname}/files/mkdir | Create directory
[**apiV1ServersServeridStacksStacknameFilesReadGet**](FilesApi.md#apiv1serversserveridstacksstacknamefilesreadget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/files/read | Read file contents
[**apiV1ServersServeridStacksStacknameFilesRenamePost**](FilesApi.md#apiv1serversserveridstacksstacknamefilesrenamepost) | **POST** /api/v1/servers/{serverid}/stacks/{stackname}/files/rename | Rename file or directory
[**apiV1ServersServeridStacksStacknameFilesStatsGet**](FilesApi.md#apiv1serversserveridstacksstacknamefilesstatsget) | **GET** /api/v1/servers/{serverid}/stacks/{stackname}/files/stats | Get directory statistics
[**apiV1ServersServeridStacksStacknameFilesUploadPost**](FilesApi.md#apiv1serversserveridstacksstacknamefilesuploadpost) | **POST** /api/v1/servers/{serverid}/stacks/{stackname}/files/upload | Upload a file
[**apiV1ServersServeridStacksStacknameFilesWritePost**](FilesApi.md#apiv1serversserveridstacksstacknamefileswritepost) | **POST** /api/v1/servers/{serverid}/stacks/{stackname}/files/write | Write file contents


# **apiV1ServersServeridStacksStacknameFilesChmodPost**
> MessageResponse apiV1ServersServeridStacksStacknameFilesChmodPost(serverid, stackname, chmodRequest)

Change file permissions

Changes the permissions (mode) of a file or directory

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final chmodRequest = ChmodRequest(); // ChmodRequest | Chmod request

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesChmodPost(serverid, stackname, chmodRequest);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesChmodPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **chmodRequest** | [**ChmodRequest**](ChmodRequest.md)| Chmod request | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesChownPost**
> MessageResponse apiV1ServersServeridStacksStacknameFilesChownPost(serverid, stackname, chownRequest)

Change file ownership

Changes the owner and/or group of a file or directory

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final chownRequest = ChownRequest(); // ChownRequest | Chown request

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesChownPost(serverid, stackname, chownRequest);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesChownPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **chownRequest** | [**ChownRequest**](ChownRequest.md)| Chown request | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesCopyPost**
> MessageResponse apiV1ServersServeridStacksStacknameFilesCopyPost(serverid, stackname, copyRequest)

Copy file or directory

Copies a file or directory within a stack's file system

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final copyRequest = CopyRequest(); // CopyRequest | Copy request

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesCopyPost(serverid, stackname, copyRequest);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesCopyPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **copyRequest** | [**CopyRequest**](CopyRequest.md)| Copy request | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesDeleteDelete**
> MessageResponse apiV1ServersServeridStacksStacknameFilesDeleteDelete(serverid, stackname, deleteRequest2)

Delete file or directory

Deletes a file or directory from a stack's file system

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final deleteRequest2 = DeleteRequest2(); // DeleteRequest2 | Delete request

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesDeleteDelete(serverid, stackname, deleteRequest2);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesDeleteDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **deleteRequest2** | [**DeleteRequest2**](DeleteRequest2.md)| Delete request | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesDownloadGet**
> MultipartFile apiV1ServersServeridStacksStacknameFilesDownloadGet(serverid, stackname, path, filename)

Download a file

Downloads a file from a stack's file system

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final path = path_example; // String | File path to download
final filename = filename_example; // String | Optional filename for the downloaded file

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesDownloadGet(serverid, stackname, path, filename);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesDownloadGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **path** | **String**| File path to download | 
 **filename** | **String**| Optional filename for the downloaded file | [optional] 

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesGet**
> DirectoryListing apiV1ServersServeridStacksStacknameFilesGet(serverid, stackname, path)

List directory contents

Returns the contents of a directory within a stack's file system

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final path = path_example; // String | Directory path to list

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesGet(serverid, stackname, path);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **path** | **String**| Directory path to list | [optional] 

### Return type

[**DirectoryListing**](DirectoryListing.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesMkdirPost**
> MessageResponse apiV1ServersServeridStacksStacknameFilesMkdirPost(serverid, stackname, createDirectoryRequest)

Create directory

Creates a new directory within a stack's file system

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final createDirectoryRequest = CreateDirectoryRequest(); // CreateDirectoryRequest | Directory creation request

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesMkdirPost(serverid, stackname, createDirectoryRequest);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesMkdirPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **createDirectoryRequest** | [**CreateDirectoryRequest**](CreateDirectoryRequest.md)| Directory creation request | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesReadGet**
> FileContent apiV1ServersServeridStacksStacknameFilesReadGet(serverid, stackname, path)

Read file contents

Returns the contents of a file within a stack's file system

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final path = path_example; // String | File path to read

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesReadGet(serverid, stackname, path);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesReadGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **path** | **String**| File path to read | 

### Return type

[**FileContent**](FileContent.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesRenamePost**
> MessageResponse apiV1ServersServeridStacksStacknameFilesRenamePost(serverid, stackname, renameRequest)

Rename file or directory

Renames or moves a file or directory within a stack's file system

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final renameRequest = RenameRequest(); // RenameRequest | Rename request

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesRenamePost(serverid, stackname, renameRequest);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesRenamePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **renameRequest** | [**RenameRequest**](RenameRequest.md)| Rename request | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesStatsGet**
> DirectoryStats apiV1ServersServeridStacksStacknameFilesStatsGet(serverid, stackname, path)

Get directory statistics

Returns statistics about a directory including most common owner, group, and mode

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final path = path_example; // String | Directory path

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesStatsGet(serverid, stackname, path);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesStatsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **path** | **String**| Directory path | [optional] 

### Return type

[**DirectoryStats**](DirectoryStats.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesUploadPost**
> MessageResponse apiV1ServersServeridStacksStacknameFilesUploadPost(serverid, stackname, file, path)

Upload a file

Uploads a file to a stack's file system using multipart form data

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final file = BINARY_DATA_HERE; // MultipartFile | 
final path = path_example; // String | 

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesUploadPost(serverid, stackname, file, path);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesUploadPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **file** | **MultipartFile**|  | 
 **path** | **String**|  | [optional] 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1ServersServeridStacksStacknameFilesWritePost**
> MessageResponse apiV1ServersServeridStacksStacknameFilesWritePost(serverid, stackname, writeFileRequest)

Write file contents

Writes content to a file within a stack's file system

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

final api_instance = FilesApi();
final serverid = 56; // int | Server ID
final stackname = stackname_example; // String | Stack name
final writeFileRequest = WriteFileRequest(); // WriteFileRequest | File write request

try {
    final result = api_instance.apiV1ServersServeridStacksStacknameFilesWritePost(serverid, stackname, writeFileRequest);
    print(result);
} catch (e) {
    print('Exception when calling FilesApi->apiV1ServersServeridStacksStacknameFilesWritePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **serverid** | **int**| Server ID | 
 **stackname** | **String**| Stack name | 
 **writeFileRequest** | [**WriteFileRequest**](WriteFileRequest.md)| File write request | 

### Return type

[**MessageResponse**](MessageResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

