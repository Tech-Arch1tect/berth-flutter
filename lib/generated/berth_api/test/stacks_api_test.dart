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


/// tests for StacksApi
void main() {
  // final instance = StacksApi();

  group('tests for StacksApi', () {
    // Check if user can create stacks
    //
    // Returns whether the authenticated user has permission to create stacks on the server
    //
    //Future<ResponseCanCreateStackData> apiV1ServersServeridStacksCanCreateGet(int serverid) async
    test('test apiV1ServersServeridStacksCanCreateGet', () async {
      // TODO
    });

    // List server stacks
    //
    // Returns all stacks on a server that the authenticated user has permission to access
    //
    //Future<ResponseListStacksData> apiV1ServersServeridStacksGet(int serverid) async
    test('test apiV1ServersServeridStacksGet', () async {
      // TODO
    });

    // Create a new stack
    //
    // Creates a new stack on the server
    //
    //Future<ResponseCreateStackData> apiV1ServersServeridStacksPost(int serverid, CreateStackRequest createStackRequest) async
    test('test apiV1ServersServeridStacksPost', () async {
      // TODO
    });

    // Get stack environment variables
    //
    // Returns environment variables for all services in a stack. Use unmask=true to see sensitive values.
    //
    //Future<ResponseStackEnvironmentData> apiV1ServersServeridStacksStacknameEnvironmentGet(int serverid, String stackname, { String unmask }) async
    test('test apiV1ServersServeridStacksStacknameEnvironmentGet', () async {
      // TODO
    });

    // Get stack details
    //
    // Returns detailed information about a specific stack including services and containers
    //
    //Future<ResponseStackDetails> apiV1ServersServeridStacksStacknameGet(int serverid, String stackname) async
    test('test apiV1ServersServeridStacksStacknameGet', () async {
      // TODO
    });

    // Get container image details
    //
    // Returns detailed image information for all containers in a stack
    //
    //Future<ResponseStackImagesData> apiV1ServersServeridStacksStacknameImagesGet(int serverid, String stackname) async
    test('test apiV1ServersServeridStacksStacknameImagesGet', () async {
      // TODO
    });

    // Get stack networks
    //
    // Returns network information for a specific stack
    //
    //Future<ResponseStackNetworksData> apiV1ServersServeridStacksStacknameNetworksGet(int serverid, String stackname) async
    test('test apiV1ServersServeridStacksStacknameNetworksGet', () async {
      // TODO
    });

    // Check stack permissions
    //
    // Returns the list of permissions the authenticated user has for a specific stack
    //
    //Future<ResponseStackPermissionsData> apiV1ServersServeridStacksStacknamePermissionsGet(int serverid, String stackname) async
    test('test apiV1ServersServeridStacksStacknamePermissionsGet', () async {
      // TODO
    });

    // Get stack statistics
    //
    // Returns resource usage statistics for all containers in a stack
    //
    //Future<ResponseStackStats> apiV1ServersServeridStacksStacknameStatsGet(int serverid, String stackname) async
    test('test apiV1ServersServeridStacksStacknameStatsGet', () async {
      // TODO
    });

    // Get stack volumes
    //
    // Returns volume information for a specific stack
    //
    //Future<ResponseStackVolumesData> apiV1ServersServeridStacksStacknameVolumesGet(int serverid, String stackname) async
    test('test apiV1ServersServeridStacksStacknameVolumesGet', () async {
      // TODO
    });

  });
}
