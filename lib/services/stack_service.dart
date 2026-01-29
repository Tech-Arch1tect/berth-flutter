import 'package:flutter/foundation.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'berth_api_provider.dart';

class StackService {
  final BerthApiProvider _berthApiProvider;

  StackService(this._berthApiProvider);

  Future<List<berth_api.Stack>> getServerStacks(int serverId) async {
    debugPrint('[StackService] getServerStacks: serverId=$serverId');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.stacksApi.apiV1ServersServeridStacksGet(serverId),
      );
      if (response == null) {
        throw Exception('Failed to fetch server stacks: null response');
      }
      final stacks = response.stacks.toList();
      stacks.sort((a, b) => a.name.compareTo(b.name));
      debugPrint('[StackService] getServerStacks: returned ${stacks.length} stacks');
      return stacks;
    } on berth_api.ApiException catch (e) {
      debugPrint('[StackService] getServerStacks: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to fetch server stacks: ${e.code}');
    }
  }

  Future<berth_api.StackDetails> getStackDetails(int serverId, String stackName) async {
    debugPrint('[StackService] getStackDetails: serverId=$serverId, stackName=$stackName');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.stacksApi.apiV1ServersServeridStacksStacknameGet(serverId, stackName),
      );
      if (response == null) {
        throw Exception('Failed to fetch stack details: null response');
      }
      debugPrint('[StackService] getStackDetails: returned stack with ${response.services.length} services');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[StackService] getStackDetails: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 404) {
        throw Exception('Stack not found');
      }
      throw Exception('Failed to fetch stack details: ${e.code}');
    }
  }

  Future<List<berth_api.Network>> getStackNetworks(int serverId, String stackName) async {
    debugPrint('[StackService] getStackNetworks: serverId=$serverId, stackName=$stackName');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.stacksApi.apiV1ServersServeridStacksStacknameNetworksGet(serverId, stackName),
      );
      if (response == null) {
        throw Exception('Failed to fetch stack networks: null response');
      }
      final networks = response.networks.toList();
      networks.sort((a, b) => a.name.compareTo(b.name));
      debugPrint('[StackService] getStackNetworks: returned ${networks.length} networks');
      return networks;
    } on berth_api.ApiException catch (e) {
      debugPrint('[StackService] getStackNetworks: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 404) {
        throw Exception('Stack or networks not found');
      }
      throw Exception('Failed to fetch stack networks: ${e.code}');
    }
  }

  Future<List<berth_api.Volume>> getStackVolumes(int serverId, String stackName) async {
    debugPrint('[StackService] getStackVolumes: serverId=$serverId, stackName=$stackName');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.stacksApi.apiV1ServersServeridStacksStacknameVolumesGet(serverId, stackName),
      );
      if (response == null) {
        throw Exception('Failed to fetch stack volumes: null response');
      }
      final volumes = response.volumes.toList();
      volumes.sort((a, b) => a.name.compareTo(b.name));
      debugPrint('[StackService] getStackVolumes: returned ${volumes.length} volumes');
      return volumes;
    } on berth_api.ApiException catch (e) {
      debugPrint('[StackService] getStackVolumes: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 404) {
        throw Exception('Stack or volumes not found');
      }
      throw Exception('Failed to fetch stack volumes: ${e.code}');
    }
  }

  Future<Map<String, List<berth_api.ServiceEnvironment>>> getStackEnvironmentVariables(int serverId, String stackName) async {
    debugPrint('[StackService] getStackEnvironmentVariables: serverId=$serverId, stackName=$stackName');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.stacksApi.apiV1ServersServeridStacksStacknameEnvironmentGet(serverId, stackName),
      );
      if (response == null) {
        throw Exception('Failed to fetch stack environment variables: null response');
      }
      debugPrint('[StackService] getStackEnvironmentVariables: returned ${response.length} services');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[StackService] getStackEnvironmentVariables: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 404) {
        throw Exception('Stack or environment variables not found');
      }
      throw Exception('Failed to fetch stack environment variables: ${e.code}');
    }
  }

  Future<berth_api.StackStatsResponse> getStackStats(int serverId, String stackName) async {
    debugPrint('[StackService] getStackStats: serverId=$serverId, stackName=$stackName');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.stacksApi.apiV1ServersServeridStacksStacknameStatsGet(serverId, stackName),
      );
      if (response == null) {
        throw Exception('Failed to fetch stack stats: null response');
      }
      debugPrint('[StackService] getStackStats: returned stats with ${response.containers.length} containers');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[StackService] getStackStats: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      } else if (e.code == 404) {
        throw Exception('Stack or stats not found');
      }
      throw Exception('Failed to fetch stack stats: ${e.code}');
    }
  }
}
