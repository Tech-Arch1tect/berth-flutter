import 'dart:convert';
import '../models/maintenance.dart';
import 'api_client.dart';

class MaintenanceService {
  final ApiClient _apiClient;

  MaintenanceService(this._apiClient);

  Future<MaintenanceInfo> getMaintenanceInfo(int serverId) async {
    try {
      final response = await _apiClient.get('/api/v1/servers/$serverId/maintenance/info');
      
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return MaintenanceInfo.fromJson(json);
      } else {
        throw Exception('Failed to fetch maintenance info: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching maintenance info: $e');
    }
  }

  Future<PruneResult> pruneResources(int serverId, PruneRequest request) async {
    try {
      final response = await _apiClient.post(
        '/api/v1/servers/$serverId/maintenance/prune',
        body: request.toJson(),
      );
      
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return PruneResult.fromJson(json);
      } else {
        final errorMessage = response.statusCode == 400 || response.statusCode == 500
            ? jsonDecode(response.body)['error'] ?? 'Unknown error'
            : 'Failed to prune resources';
        throw Exception('$errorMessage (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Error pruning resources: $e');
    }
  }

  Future<DeleteResult> deleteResource(int serverId, DeleteRequest request) async {
    try {
      final response = await _apiClient.deleteWithBody(
        '/api/v1/servers/$serverId/maintenance/resource',
        body: request.toJson(),
      );
      
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return DeleteResult.fromJson(json);
      } else {
        final errorMessage = response.statusCode == 400 || response.statusCode == 500
            ? jsonDecode(response.body)['error'] ?? 'Unknown error'
            : 'Failed to delete resource';
        throw Exception('$errorMessage (${response.statusCode})');
      }
    } catch (e) {
      throw Exception('Error deleting resource: $e');
    }
  }
}