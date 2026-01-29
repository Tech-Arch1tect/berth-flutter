import 'package:flutter/foundation.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'berth_api_provider.dart';

class LogsService {
  final BerthApiProvider _berthApiProvider;

  LogsService(this._berthApiProvider);

  Future<berth_api.LogsResponse> getStackLogs({
    required int serverId,
    required String stackName,
    int? tail,
    String? since,
    bool? timestamps,
  }) async {
    debugPrint('[LogsService] getStackLogs: serverId=$serverId, stackName=$stackName');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.logsApi.apiV1ServersServeridStacksStacknameLogsGet(
          serverId,
          stackName,
          tail: tail,
          since: since,
          timestamps: timestamps,
        ),
      );
      if (response == null) {
        throw Exception('Failed to fetch stack logs: null response');
      }
      debugPrint('[LogsService] getStackLogs: success, ${response.logs.length} entries');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[LogsService] getStackLogs: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to fetch stack logs: ${e.code}');
    }
  }

  Future<berth_api.LogsResponse> getContainerLogs({
    required int serverId,
    required String stackName,
    required String containerName,
    int? tail,
    String? since,
    bool? timestamps,
  }) async {
    debugPrint('[LogsService] getContainerLogs: serverId=$serverId, stackName=$stackName, containerName=$containerName');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.logsApi.apiV1ServersServeridStacksStacknameContainersContainerNameLogsGet(
          serverId,
          stackName,
          containerName,
          tail: tail,
          since: since,
          timestamps: timestamps,
        ),
      );
      if (response == null) {
        throw Exception('Failed to fetch container logs: null response');
      }
      debugPrint('[LogsService] getContainerLogs: success, ${response.logs.length} entries');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[LogsService] getContainerLogs: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to fetch container logs: ${e.code}');
    }
  }
}
