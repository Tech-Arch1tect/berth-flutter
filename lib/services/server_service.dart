import 'dart:convert';
import '../models/server.dart';
import 'api_client.dart';

class ServerService {
  final ApiClient _apiClient;

  ServerService(this._apiClient);

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

  Future<Server> getServer(int id) async {
    final response = await _apiClient.get('/api/v1/admin/servers/$id');
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Server.fromJson(data['server']);
    } else {
      throw Exception('Failed to load server: ${response.statusCode}');
    }
  }

  Future<Server> createServer(Server server) async {
    final response = await _apiClient.post(
      '/api/v1/admin/servers',
      body: server.toJson(),
    );
    
    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      return Server.fromJson(data['server']);
    } else {
      final errorData = json.decode(response.body);
      throw Exception('Failed to create server: ${errorData['error'] ?? 'Unknown error'}');
    }
  }

  Future<Server> updateServer(int id, Server server) async {
    final response = await _apiClient.put(
      '/api/v1/admin/servers/$id',
      body: server.toJson(),
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
}