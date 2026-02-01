import 'package:flutter/foundation.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'berth_api_provider.dart';

class OperationLogService {
  final BerthApiProvider _berthApiProvider;

  OperationLogService(this._berthApiProvider);

  Future<berth_api.PaginatedOperationLogsResponse?> getUserOperationLogs({
    int page = 1,
    int pageSize = 20,
    String? searchTerm,
    String? status,
    String? command,
  }) async {
    debugPrint('[OperationLogService] getUserOperationLogs: page=$page, pageSize=$pageSize');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.operationLogsApi.apiV1OperationLogsGet(
          page: page,
          pageSize: pageSize,
          search: searchTerm,
          status: status,
          command: command,
        ),
      );
      debugPrint('[OperationLogService] getUserOperationLogs: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[OperationLogService] getUserOperationLogs: ApiException - code=${e.code}, message=${e.message}');
      return null;
    }
  }

  Future<berth_api.OperationLogStatsResponse?> getUserOperationLogStats() async {
    debugPrint('[OperationLogService] getUserOperationLogStats');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.operationLogsApi.apiV1OperationLogsStatsGet(),
      );
      debugPrint('[OperationLogService] getUserOperationLogStats: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[OperationLogService] getUserOperationLogStats: ApiException - code=${e.code}, message=${e.message}');
      return null;
    }
  }

  Future<berth_api.OperationLogDetailResponse?> getUserOperationLogDetail(int logId) async {
    debugPrint('[OperationLogService] getUserOperationLogDetail: logId=$logId');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.operationLogsApi.apiV1OperationLogsIdGet(logId),
      );
      debugPrint('[OperationLogService] getUserOperationLogDetail: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[OperationLogService] getUserOperationLogDetail: ApiException - code=${e.code}, message=${e.message}');
      return null;
    }
  }

  Future<berth_api.PaginatedOperationLogsResponse?> getAdminOperationLogs({
    int page = 1,
    int pageSize = 20,
    String? searchTerm,
    String? status,
    String? command,
  }) async {
    debugPrint('[OperationLogService] getAdminOperationLogs: page=$page, pageSize=$pageSize');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.operationLogsApi.apiV1AdminOperationLogsGet(
          page: page,
          pageSize: pageSize,
          search: searchTerm,
          status: status,
          command: command,
        ),
      );
      debugPrint('[OperationLogService] getAdminOperationLogs: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[OperationLogService] getAdminOperationLogs: ApiException - code=${e.code}, message=${e.message}');
      return null;
    }
  }

  Future<berth_api.OperationLogStatsResponse?> getAdminOperationLogStats() async {
    debugPrint('[OperationLogService] getAdminOperationLogStats');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.operationLogsApi.apiV1AdminOperationLogsStatsGet(),
      );
      debugPrint('[OperationLogService] getAdminOperationLogStats: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[OperationLogService] getAdminOperationLogStats: ApiException - code=${e.code}, message=${e.message}');
      return null;
    }
  }

  Future<berth_api.OperationLogDetailResponse?> getAdminOperationLogDetail(int logId) async {
    debugPrint('[OperationLogService] getAdminOperationLogDetail: logId=$logId');
    try {
      final response = await _berthApiProvider.callWithAutoRefresh(
        () => _berthApiProvider.operationLogsApi.apiV1AdminOperationLogsIdGet(logId),
      );
      debugPrint('[OperationLogService] getAdminOperationLogDetail: success');
      return response;
    } on berth_api.ApiException catch (e) {
      debugPrint('[OperationLogService] getAdminOperationLogDetail: ApiException - code=${e.code}, message=${e.message}');
      return null;
    }
  }
}
