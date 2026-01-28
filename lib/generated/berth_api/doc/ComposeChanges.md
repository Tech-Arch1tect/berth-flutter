# berth_api.model.ComposeChanges

## Load the model package
```dart
import 'package:berth_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**addServices** | [**Map<String, NewServiceConfig>**](NewServiceConfig.md) |  | [optional] [default to const {}]
**configChanges** | [**Map<String, ConfigConfig>**](ConfigConfig.md) |  | [optional] [default to const {}]
**deleteServices** | **List<String>** |  | [optional] [default to const []]
**networkChanges** | [**Map<String, NetworkConfig>**](NetworkConfig.md) |  | [optional] [default to const {}]
**renameServices** | **Map<String, String>** |  | [optional] [default to const {}]
**secretChanges** | [**Map<String, SecretConfig>**](SecretConfig.md) |  | [optional] [default to const {}]
**serviceChanges** | [**Map<String, ServiceChanges>**](ServiceChanges.md) |  | [optional] [default to const {}]
**volumeChanges** | [**Map<String, VolumeConfig>**](VolumeConfig.md) |  | [optional] [default to const {}]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


