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


/// tests for MaintenanceApi
void main() {
  // final instance = MaintenanceApi();

  group('tests for MaintenanceApi', () {
    // Get Docker system information
    //
    // Returns detailed Docker system information including disk usage, images, containers, volumes, networks, and build cache
    //
    //Future<MaintenanceInfo> apiV1ServersServeridMaintenanceInfoGet(int serverid) async
    test('test apiV1ServersServeridMaintenanceInfoGet', () async {
      // TODO
    });

    // Check maintenance permissions
    //
    // Returns the user's read and write permissions for Docker maintenance operations on the server
    //
    //Future<PermissionsResponse> apiV1ServersServeridMaintenancePermissionsGet(int serverid) async
    test('test apiV1ServersServeridMaintenancePermissionsGet', () async {
      // TODO
    });

    // Prune Docker resources
    //
    // Removes unused Docker resources such as images, containers, volumes, networks, or build cache
    //
    //Future<PruneResult> apiV1ServersServeridMaintenancePrunePost(int serverid, PruneRequest pruneRequest) async
    test('test apiV1ServersServeridMaintenancePrunePost', () async {
      // TODO
    });

    // Delete Docker resource
    //
    // Deletes a specific Docker resource (image, container, volume, or network) by ID
    //
    //Future<DeleteResult> apiV1ServersServeridMaintenanceResourceDelete(int serverid, DeleteRequest deleteRequest) async
    test('test apiV1ServersServeridMaintenanceResourceDelete', () async {
      // TODO
    });

  });
}
