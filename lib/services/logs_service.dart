import 'dart:convert';
import '../models/log.dart' as log_models;
import 'api_client.dart';

class LogsService {
  final ApiClient _apiClient;

  LogsService(this._apiClient);

  String _buildQueryString(Map<String, String> params) {
    if (params.isEmpty) return '';
    return '?${params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&')}';
  }

  Future<log_models.LogsResponse> getStackLogs({
    required int serverId,
    required String stackName,
    int? tail,
    String? since,
    bool? timestamps,
  }) async {
    final queryParams = <String, String>{};
    if (tail != null) queryParams['tail'] = tail.toString();
    if (since != null && since.isNotEmpty) queryParams['since'] = since;
    if (timestamps != null) queryParams['timestamps'] = timestamps.toString();

    final endpoint = '/api/v1/servers/$serverId/stacks/${Uri.encodeComponent(stackName)}/logs${_buildQueryString(queryParams)}';
    final response = await _apiClient.get(endpoint);

    if (response.statusCode != 200) {
      throw Exception('Failed to load stack logs: ${response.statusCode}');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    return log_models.LogsResponse.fromJson(data);
  }


  Future<log_models.LogsResponse> getContainerLogs({
    required int serverId,
    required String stackName,
    required String containerName,
    int? tail,
    String? since,
    bool? timestamps,
  }) async {
    final queryParams = <String, String>{};
    if (tail != null) queryParams['tail'] = tail.toString();
    if (since != null && since.isNotEmpty) queryParams['since'] = since;
    if (timestamps != null) queryParams['timestamps'] = timestamps.toString();

    final endpoint = '/api/v1/servers/$serverId/stacks/${Uri.encodeComponent(stackName)}/containers/${Uri.encodeComponent(containerName)}/logs${_buildQueryString(queryParams)}';
    final response = await _apiClient.get(endpoint);

    if (response.statusCode != 200) {
      throw Exception('Failed to load container logs: ${response.statusCode}');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    return log_models.LogsResponse.fromJson(data);
  }
}