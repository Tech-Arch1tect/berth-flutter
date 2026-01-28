# berth_api.model.ServiceChanges

## Load the model package
```dart
import 'package:berth_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**build** | [**BuildConfig**](BuildConfig.md) |  | [optional] 
**command** | [**CommandConfig**](CommandConfig.md) |  | [optional] 
**dependsOn** | [**Map<String, DependsOnConfig>**](DependsOnConfig.md) |  | [optional] [default to const {}]
**deploy** | [**DeployConfig**](DeployConfig.md) |  | [optional] 
**entrypoint** | [**CommandConfig**](CommandConfig.md) |  | [optional] 
**environment** | **Map<String, String>** |  | [optional] [default to const {}]
**healthcheck** | [**HealthcheckConfig**](HealthcheckConfig.md) |  | [optional] 
**image** | **String** |  | [optional] 
**labels** | **Map<String, String>** |  | [optional] [default to const {}]
**networks** | [**Map<String, ServiceNetworkConfig>**](ServiceNetworkConfig.md) |  | [optional] [default to const {}]
**ports** | [**List<PortMapping>**](PortMapping.md) |  | [optional] [default to const []]
**restart** | **String** |  | [optional] 
**volumes** | [**List<VolumeMount2>**](VolumeMount2.md) |  | [optional] [default to const []]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


