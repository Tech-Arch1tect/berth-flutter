# berth_api.model.Container

## Load the model package
```dart
import 'package:berth_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**command** | **List<String>** |  | [optional] [default to const []]
**created** | **String** |  | [optional] 
**exitCode** | **int** |  | [optional] 
**finished** | **String** |  | [optional] 
**health** | [**HealthStatus**](HealthStatus.md) |  | [optional] 
**image** | **String** |  | 
**labels** | **Map<String, String>** |  | [optional] [default to const {}]
**mounts** | [**List<ContainerMount>**](ContainerMount.md) |  | [optional] [default to const []]
**name** | **String** |  | 
**networks** | [**List<ContainerNetwork>**](ContainerNetwork.md) |  | [optional] [default to const []]
**ports** | [**List<Port>**](Port.md) |  | [optional] [default to const []]
**resourceLimits** | [**ResourceLimits**](ResourceLimits.md) |  | [optional] 
**restartPolicy** | [**RestartPolicy**](RestartPolicy.md) |  | [optional] 
**started** | **String** |  | [optional] 
**state** | **String** |  | 
**user** | **String** |  | [optional] 
**workingDir** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


