import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'berth_api_provider.dart';

class ServerService {
  final BerthApiProvider _berthApiProvider;

  ServerService(this._berthApiProvider);

  Future<List<berth_api.ServerResponse>> getServers() async {
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.adminApi.apiV1AdminServersGet(),
      );
      if (response == null) {
        throw Exception('Failed to load servers: null response');
      }
      return response.data.servers;
    } on berth_api.ApiException catch (e) {
      debugPrint('[ServerService] getServers: ApiException - code=${e.code}, message=${e.message}');
      rethrow;
    }
  }

  Future<List<berth_api.ServerResponse>> getUserServers() async {
    try {
      debugPrint('[ServerService] getUserServers: calling API...');
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.serversApi.apiV1ServersGet(),
      );
      if (response == null) {
        debugPrint('[ServerService] getUserServers: API returned null response');
        throw Exception('Failed to load servers: null response');
      }
      debugPrint('[ServerService] getUserServers: got ${response.servers.length} servers');
      return response.servers;
    } on berth_api.ApiException catch (e) {
      debugPrint('[ServerService] getUserServers: ApiException - code=${e.code}, message=${e.message}');
      rethrow;
    } catch (e) {
      debugPrint('[ServerService] getUserServers: Unexpected error - $e');
      rethrow;
    }
  }

  Future<berth_api.ServerResponse> getUserServer(int id) async {
    final servers = await getUserServers();
    try {
      return servers.firstWhere((server) => server.id == id);
    } catch (e) {
      throw Exception('Server not found or access denied');
    }
  }

  Future<berth_api.ServerResponse> getServer(int id) async {
    final servers = await getServers();
    try {
      return servers.firstWhere((server) => server.id == id);
    } catch (e) {
      throw Exception('Server not found');
    }
  }

  Future<berth_api.ServerResponse> createServer(berth_api.ServerCreateRequest request) async {
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.adminApi.apiV1AdminServersPost(request),
      );
      if (response == null) {
        throw Exception('Failed to create server: null response');
      }
      return response.data.server;
    } on berth_api.ApiException catch (e) {
      debugPrint('[ServerService] createServer: ApiException - code=${e.code}, message=${e.message}');
      rethrow;
    }
  }

  Future<berth_api.ServerResponse> updateServer(int id, berth_api.ServerUpdateRequest request) async {
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.adminApi.apiV1AdminServersIdPut(id, request),
      );
      if (response == null) {
        throw Exception('Failed to update server: null response');
      }
      return response.data.server;
    } on berth_api.ApiException catch (e) {
      debugPrint('[ServerService] updateServer: ApiException - code=${e.code}, message=${e.message}');
      rethrow;
    }
  }

  Future<void> deleteServer(int id) async {
    try {
      await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.adminApi.apiV1AdminServersIdDelete(id),
      );
    } on berth_api.ApiException catch (e) {
      debugPrint('[ServerService] deleteServer: ApiException - code=${e.code}, message=${e.message}');
      rethrow;
    }
  }

  Future<bool> testConnection(int id) async {
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.adminApi.apiV1AdminServersIdTestPost(id),
      );
      return response?.success ?? false;
    } on berth_api.ApiException catch (e) {
      if (e.code == 503) {
        return false;
      }
      debugPrint('[ServerService] testConnection: ApiException - code=${e.code}, message=${e.message}');
      rethrow;
    }
  }

  Future<berth_api.StackStatistics?> getServerStatistics(int serverId) async {
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(() async {
        final httpResponse = await _berthApiProvider.apiClient.invokeAPI(
          '/api/v1/servers/$serverId/statistics',
          'GET',
          [],
          null,
          {},
          {},
          'application/json',
        );
        return httpResponse;
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['statistics'] != null) {
          return berth_api.StackStatistics.fromJson(data['statistics']);
        }
      }
      return null;
    } catch (e) {
      debugPrint('[ServerService] getServerStatistics: error - $e');
      return null;
    }
  }
}
