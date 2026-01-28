//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:berth_api/api.dart';
import 'package:test/test.dart';


/// tests for OperationLogsApi
void main() {
  // final instance = OperationLogsApi();

  group('tests for OperationLogsApi', () {
    // List all operation logs
    //
    // Returns paginated list of all operation logs. Requires admin permissions.
    //
    //Future<PaginatedOperationLogs> apiV1AdminOperationLogsGet({ int page, int pageSize, String search, String serverId, String stackName, String command, String status, int daysBack }) async
    test('test apiV1AdminOperationLogsGet', () async {
      // TODO
    });

    // Get operation log details
    //
    // Returns detailed information about a specific operation log including all messages. Requires admin permissions.
    //
    //Future<OperationLogDetail> apiV1AdminOperationLogsIdGet(int id) async
    test('test apiV1AdminOperationLogsIdGet', () async {
      // TODO
    });

    // Get operation logs statistics
    //
    // Returns aggregated statistics for all operation logs. Requires admin permissions.
    //
    //Future<OperationLogStats> apiV1AdminOperationLogsStatsGet() async
    test('test apiV1AdminOperationLogsStatsGet', () async {
      // TODO
    });

    // Get operation log details by operation ID
    //
    // Returns detailed information about a specific operation log by its operation ID. Only returns logs belonging to the authenticated user.
    //
    //Future<OperationLogDetail> apiV1OperationLogsByOperationIdOperationIdGet(String operationId) async
    test('test apiV1OperationLogsByOperationIdOperationIdGet', () async {
      // TODO
    });

    // List user's operation logs
    //
    // Returns paginated list of operation logs for the authenticated user.
    //
    //Future<PaginatedOperationLogs> apiV1OperationLogsGet({ int page, int pageSize, String search, String serverId, String stackName, String command, String status, int daysBack }) async
    test('test apiV1OperationLogsGet', () async {
      // TODO
    });

    // Get operation log details
    //
    // Returns detailed information about a specific operation log including all messages. Only returns logs belonging to the authenticated user.
    //
    //Future<OperationLogDetail> apiV1OperationLogsIdGet(int id) async
    test('test apiV1OperationLogsIdGet', () async {
      // TODO
    });

    // Get user's operation logs statistics
    //
    // Returns aggregated statistics for the authenticated user's operation logs.
    //
    //Future<OperationLogStats> apiV1OperationLogsStatsGet() async
    test('test apiV1OperationLogsStatsGet', () async {
      // TODO
    });

    // Get running operations
    //
    // Returns list of currently running operations for the authenticated user.
    //
    //Future<RunningOperationsResponse> apiV1RunningOperationsGet() async
    test('test apiV1RunningOperationsGet', () async {
      // TODO
    });

  });
}
