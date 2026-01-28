import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../models/server.dart';
import '../models/stack_statistics.dart';
import 'api_client.dart';
import 'berth_api_provider.dart';

class ServerService {
  final ApiClient _apiClient;
  final BerthApiProvider _berthApiProvider;

  ServerService(this._apiClient, this._berthApiProvider);

  Future<List<Server>> getServers() async {
    final response = await _apiClient.get('/api/v1/admin/servers');
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> serverList = data['servers'];
      return serverList.map((json) => Server.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load servers: ${response.statusCode}');
    }
  }

  Future<List<berth_api.ServerResponse>> getUserServers() async {
    try {
      debugPrint('[ServerService] getUserServers: calling API...');
      final response = await _berthApiProvider.serversApi.apiV1ServersGet();
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

  Future<Server> getServer(int id) async {
    final response = await _apiClient.get('/api/v1/admin/servers/$id');
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Server.fromJson(data['server']);
    } else {
      throw Exception('Failed to load server: ${response.statusCode}');
    }
  }

  Future<Server> createServer(ServerInput serverInput) async {
    final response = await _apiClient.post(
      '/api/v1/admin/servers',
      body: serverInput.toJson(),
    );
    
    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return Server.fromJson(data['server']);
    } else {
      final errorData = json.decode(response.body);
      throw Exception('Failed to create server: ${errorData['error'] ?? 'Unknown error'}');
    }
  }

  Future<Server> updateServer(int id, ServerInput serverInput) async {
    final response = await _apiClient.put(
      '/api/v1/admin/servers/$id',
      body: serverInput.toJson(),
    );
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Server.fromJson(data['server']);
    } else {
      final errorData = json.decode(response.body);
      throw Exception('Failed to update server: ${errorData['error'] ?? 'Unknown error'}');
    }
  }

  Future<void> deleteServer(int id) async {
    final response = await _apiClient.delete('/api/v1/admin/servers/$id');
    
    if (response.statusCode != 200) {
      final errorData = json.decode(response.body);
      throw Exception('Failed to delete server: ${errorData['error'] ?? 'Unknown error'}');
    }
  }

  Future<bool> testConnection(int id) async {
    final response = await _apiClient.post('/api/v1/admin/servers/$id/test');
    
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 503) {
      return false;
    } else {
      throw Exception('Failed to test connection: ${response.statusCode}');
    }
  }

  Future<StackStatistics?> getServerStatistics(int serverId) async {
    try {
      final response = await _apiClient.get('/api/v1/servers/$serverId/statistics');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data['statistics'] != null) {
          final statistics = StackStatistics.fromJson(data['statistics']);
          return statistics;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}