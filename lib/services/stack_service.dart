import 'dart:convert';
import '../models/stack.dart';
import 'api_client.dart';

class StackService {
  final ApiClient _apiClient;

  StackService(this._apiClient);

  Future<List<Stack>> getServerStacks(int serverId) async {
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> stacksData = data['stacks'] ?? [];
      
      final stacks = stacksData
          .map((stackData) => Stack.fromJson(stackData))
          .toList();
      
      stacks.sort((a, b) => a.name.compareTo(b.name));
      return stacks;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else {
      throw Exception('Failed to fetch server stacks: ${response.statusCode}');
    }
  }

  Future<StackDetails> getStackDetails(int serverId, String stackName) async {
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks/$stackName');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final stackDetails = StackDetails.fromJson(data);
      
      stackDetails.services.sort((a, b) => a.name.compareTo(b.name));
      for (final service in stackDetails.services) {
        service.containers.sort((a, b) => a.name.compareTo(b.name));
      }
      
      return stackDetails;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 404) {
      throw Exception('Stack not found');
    } else {
      throw Exception('Failed to fetch stack details: ${response.statusCode}');
    }
  }

  Future<List<Network>> getStackNetworks(int serverId, String stackName) async {
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks/$stackName/networks');

    if (response.statusCode == 200) {
      final List<dynamic> networksData = json.decode(response.body);
      
      final networks = networksData
          .map((networkData) => Network.fromJson(networkData))
          .toList();
      
      networks.sort((a, b) => a.name.compareTo(b.name));
      return networks;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 404) {
      throw Exception('Stack or networks not found');
    } else {
      throw Exception('Failed to fetch stack networks: ${response.statusCode}');
    }
  }

  Future<List<Volume>> getStackVolumes(int serverId, String stackName) async {
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks/$stackName/volumes');

    if (response.statusCode == 200) {
      final List<dynamic> volumesData = json.decode(response.body);
      
      final volumes = volumesData
          .map((volumeData) => Volume.fromJson(volumeData))
          .toList();
      
      volumes.sort((a, b) => a.name.compareTo(b.name));
      return volumes;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 404) {
      throw Exception('Stack or volumes not found');
    } else {
      throw Exception('Failed to fetch stack volumes: ${response.statusCode}');
    }
  }

  Future<Map<String, List<ServiceEnvironment>>> getStackEnvironmentVariables(int serverId, String stackName) async {
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks/$stackName/environment');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final Map<String, List<ServiceEnvironment>> environmentData = {};
      
      data.forEach((serviceName, serviceEnvList) {
        if (serviceEnvList is List) {
          final serviceEnvironments = serviceEnvList
              .map((envData) => ServiceEnvironment.fromJson(envData))
              .toList();
          
          for (final env in serviceEnvironments) {
            env.variables.sort((a, b) => a.key.compareTo(b.key));
          }
          
          environmentData[serviceName] = serviceEnvironments;
        }
      });
      
      return environmentData;
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 404) {
      throw Exception('Stack or environment variables not found');
    } else {
      throw Exception('Failed to fetch stack environment variables: ${response.statusCode}');
    }
  }

  Future<StackStats> getStackStats(int serverId, String stackName) async {
    final response = await _apiClient.get('/api/v1/servers/$serverId/stacks/$stackName/stats');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return StackStats.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 404) {
      throw Exception('Stack or stats not found');
    } else {
      throw Exception('Failed to fetch stack stats: ${response.statusCode}');
    }
  }
}