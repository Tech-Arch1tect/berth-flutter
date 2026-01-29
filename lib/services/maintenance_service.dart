import 'package:flutter/foundation.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'berth_api_provider.dart';

class MaintenanceService {
  final BerthApiProvider _berthApiProvider;

  MaintenanceService(this._berthApiProvider);

  Future<berth_api.MaintenanceInfo> getMaintenanceInfo(int serverId) async {
    debugPrint('[MaintenanceService] getMaintenanceInfo: serverId=$serverId');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.maintenanceApi.apiV1ServersServeridMaintenanceInfoGet(serverId),
      );
      if (response == null) {
        throw Exception('Failed to fetch maintenance info: null response');
      }
      debugPrint('[MaintenanceService] getMaintenanceInfo: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[MaintenanceService] getMaintenanceInfo: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to fetch maintenance info: ${e.code}');
    }
  }

  Future<berth_api.PruneResult> pruneResources(int serverId, berth_api.PruneRequest request) async {
    debugPrint('[MaintenanceService] pruneResources: serverId=$serverId');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.maintenanceApi.apiV1ServersServeridMaintenancePrunePost(serverId, request),
      );
      if (response == null) {
        throw Exception('Failed to prune resources: null response');
      }
      debugPrint('[MaintenanceService] pruneResources: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[MaintenanceService] pruneResources: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to prune resources: ${e.code}');
    }
  }

  Future<berth_api.DeleteResult> deleteResource(int serverId, berth_api.DeleteRequest request) async {
    debugPrint('[MaintenanceService] deleteResource: serverId=$serverId');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.maintenanceApi.apiV1ServersServeridMaintenanceResourceDelete(serverId, request),
      );
      if (response == null) {
        throw Exception('Failed to delete resource: null response');
      }
      debugPrint('[MaintenanceService] deleteResource: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[MaintenanceService] deleteResource: ApiException - code=${e.code}, message=${e.message}');
      if (e.code == 401) {
        throw Exception('Authentication failed');
      }
      throw Exception('Failed to delete resource: ${e.code}');
    }
  }
}
