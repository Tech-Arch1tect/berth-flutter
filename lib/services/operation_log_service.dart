import 'dart:convert';
import '../models/operation_log.dart' as models;
import 'api_client.dart';

class OperationLogService {
  final ApiClient _apiClient;

  OperationLogService(this._apiClient);

  Future<models.PaginatedOperationLogs?> getUserOperationLogs({
    int page = 1,
    int pageSize = 20,
    String? searchTerm,
    String? status,
    String? command,
  }) async {
    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'page_size': pageSize.toString(),
      };

      if (searchTerm?.isNotEmpty == true) {
        queryParams['search'] = searchTerm!;
      }
      if (status?.isNotEmpty == true) {
        queryParams['status'] = status!;
      }
      if (command?.isNotEmpty == true) {
        queryParams['command'] = command!;
      }

      final queryString = queryParams.entries
          .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');

      final response = await _apiClient.get('/api/v1/operation-logs?$queryString');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return models.PaginatedOperationLogs.fromJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<models.OperationLogStats?> getUserOperationLogStats() async {
    try {
      final response = await _apiClient.get('/api/v1/operation-logs/stats');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return models.OperationLogStats.fromJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<models.OperationLogDetail?> getUserOperationLogDetail(int logId) async {
    try {
      final response = await _apiClient.get('/api/v1/operation-logs/$logId');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return models.OperationLogDetail.fromJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<models.PaginatedOperationLogs?> getAdminOperationLogs({
    int page = 1,
    int pageSize = 20,
    String? searchTerm,
    String? status,
    String? command,
  }) async {
    try {
      final queryParams = <String, String>{
        'page': page.toString(),
        'page_size': pageSize.toString(),
      };

      if (searchTerm?.isNotEmpty == true) {
        queryParams['search'] = searchTerm!;
      }
      if (status?.isNotEmpty == true) {
        queryParams['status'] = status!;
      }
      if (command?.isNotEmpty == true) {
        queryParams['command'] = command!;
      }

      final queryString = queryParams.entries
          .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&');

      final response = await _apiClient.get('/api/v1/admin/operation-logs?$queryString');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return models.PaginatedOperationLogs.fromJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<models.OperationLogStats?> getAdminOperationLogStats() async {
    try {
      final response = await _apiClient.get('/api/v1/admin/operation-logs/stats');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return models.OperationLogStats.fromJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<models.OperationLogDetail?> getAdminOperationLogDetail(int logId) async {
    try {
      final response = await _apiClient.get('/api/v1/admin/operation-logs/$logId');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return models.OperationLogDetail.fromJson(data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}