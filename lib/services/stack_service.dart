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
      
      return stacksData
          .map((stackData) => Stack.fromJson(stackData))
          .toList();
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
      return StackDetails.fromJson(data);
    } else if (response.statusCode == 401) {
      throw Exception('Authentication failed');
    } else if (response.statusCode == 404) {
      throw Exception('Stack not found');
    } else {
      throw Exception('Failed to fetch stack details: ${response.statusCode}');
    }
  }
}