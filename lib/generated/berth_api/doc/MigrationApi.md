# berth_api.api.MigrationApi

## Load the API package
```dart
import 'package:berth_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1AdminMigrationExportPost**](MigrationApi.md#apiv1adminmigrationexportpost) | **POST** /api/v1/admin/migration/export | Export data
[**apiV1AdminMigrationImportPost**](MigrationApi.md#apiv1adminmigrationimportpost) | **POST** /api/v1/admin/migration/import | Import data


# **apiV1AdminMigrationExportPost**
> MultipartFile apiV1AdminMigrationExportPost(exportRequest)

Export data

Export all configuration data (users, roles, servers, etc.) as an encrypted backup file. Requires admin.system.export permission.

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

final api_instance = MigrationApi();
final exportRequest = ExportRequest(); // ExportRequest | Export password (min 12 characters)

try {
    final result = api_instance.apiV1AdminMigrationExportPost(exportRequest);
    print(result);
} catch (e) {
    print('Exception when calling MigrationApi->apiV1AdminMigrationExportPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **exportRequest** | [**ExportRequest**](ExportRequest.md)| Export password (min 12 characters) | 

### Return type

[**MultipartFile**](MultipartFile.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/octet-stream, application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1AdminMigrationImportPost**
> ImportResponse apiV1AdminMigrationImportPost(backupFile, password)

Import data

Import configuration data from an encrypted backup file. WARNING: This will completely replace all existing data. Requires admin.system.import permission.

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

final api_instance = MigrationApi();
final backupFile = BINARY_DATA_HERE; // MultipartFile | 
final password = password_example; // String | 

try {
    final result = api_instance.apiV1AdminMigrationImportPost(backupFile, password);
    print(result);
} catch (e) {
    print('Exception when calling MigrationApi->apiV1AdminMigrationImportPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **backupFile** | **MultipartFile**|  | 
 **password** | **String**|  | 

### Return type

[**ImportResponse**](ImportResponse.md)

### Authorization

[apiKey](../README.md#apiKey), [session](../README.md#session), [bearerAuth](../README.md#bearerAuth)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

