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


/// tests for VulnscanApi
void main() {
  // final instance = VulnscanApi();

  group('tests for VulnscanApi', () {
    // Get latest scan for stack
    //
    // Returns the most recent vulnerability scan and summary for a stack. Requires stacks.read permission.
    //
    //Future<GetLatestScanResponse> apiV1ServersServeridStacksStacknameVulnscanGet(int serverid, String stackname) async
    test('test apiV1ServersServeridStacksStacknameVulnscanGet', () async {
      // TODO
    });

    // Get scan history for stack
    //
    // Returns all vulnerability scans for a stack with summaries. Requires stacks.read permission.
    //
    //Future<GetScansHistoryResponse> apiV1ServersServeridStacksStacknameVulnscanHistoryGet(int serverid, String stackname) async
    test('test apiV1ServersServeridStacksStacknameVulnscanHistoryGet', () async {
      // TODO
    });

    // Start vulnerability scan
    //
    // Starts a vulnerability scan for a stack. Requires stacks.read permission.
    //
    //Future<StartScanResponse> apiV1ServersServeridStacksStacknameVulnscanPost(int serverid, String stackname, StartScanRequest startScanRequest) async
    test('test apiV1ServersServeridStacksStacknameVulnscanPost', () async {
      // TODO
    });

    // Get scan trend for stack
    //
    // Returns vulnerability trend data for a stack. Requires stacks.read permission.
    //
    //Future<GetScanTrendResponse> apiV1ServersServeridStacksStacknameVulnscanTrendGet(int serverid, String stackname, { int limit }) async
    test('test apiV1ServersServeridStacksStacknameVulnscanTrendGet', () async {
      // TODO
    });

    // Compare two scans
    //
    // Compares two vulnerability scans and returns new, fixed, and unchanged vulnerabilities. Both scans must be from the same stack. Requires stacks.read permission.
    //
    //Future<CompareScanResponse> apiV1VulnscanCompareBaseScanIdCompareScanIdGet(int baseScanId, int compareScanId) async
    test('test apiV1VulnscanCompareBaseScanIdCompareScanIdGet', () async {
      // TODO
    });

    // Get scan by ID
    //
    // Returns a specific vulnerability scan with all vulnerabilities. Requires stacks.read permission for the scanned stack.
    //
    //Future<GetScanResponse> apiV1VulnscanScanidGet(int scanid) async
    test('test apiV1VulnscanScanidGet', () async {
      // TODO
    });

    // Get scan summary
    //
    // Returns vulnerability counts by severity for a scan. Requires stacks.read permission for the scanned stack.
    //
    //Future<GetScanSummaryResponse> apiV1VulnscanScanidSummaryGet(int scanid) async
    test('test apiV1VulnscanScanidSummaryGet', () async {
      // TODO
    });

  });
}
