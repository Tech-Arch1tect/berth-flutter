# berth_api.model.ImageScan

## Load the model package
```dart
import 'package:berth_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**agentScanId** | **String** |  | 
**completedAt** | [**DateTime**](DateTime.md) |  | [optional] 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**deletedAt** | [**DeletedAt**](DeletedAt.md) |  | 
**errorMessage** | **String** |  | [optional] 
**id** | **int** |  | 
**lastPollError** | **String** |  | [optional] 
**lastPolledAt** | [**DateTime**](DateTime.md) |  | [optional] 
**pollFailures** | **int** |  | 
**scannedImages** | **int** |  | 
**scopes** | [**List<ScanScope>**](ScanScope.md) |  | [optional] [default to const []]
**serverId** | **int** |  | 
**serviceFilter** | **String** |  | [optional] 
**stackName** | **String** |  | 
**startedAt** | [**DateTime**](DateTime.md) |  | 
**status** | **String** |  | 
**totalImages** | **int** |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 
**vulnerabilities** | [**List<ImageVulnerability>**](ImageVulnerability.md) |  | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


