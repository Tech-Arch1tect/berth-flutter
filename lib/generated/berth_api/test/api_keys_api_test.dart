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


/// tests for ApiKeysApi
void main() {
  // final instance = ApiKeysApi();

  group('tests for ApiKeysApi', () {
    // List API keys
    //
    // Returns all API keys belonging to the authenticated user.
    //
    //Future<ListAPIKeysResponse> apiV1ApiKeysGet() async
    test('test apiV1ApiKeysGet', () async {
      // TODO
    });

    // Revoke API key
    //
    // Revokes (deletes) an API key. This action cannot be undone.
    //
    //Future<MessageResponse2> apiV1ApiKeysIdDelete(int id) async
    test('test apiV1ApiKeysIdDelete', () async {
      // TODO
    });

    // Get API key
    //
    // Returns details of a specific API key.
    //
    //Future<GetAPIKeyResponse> apiV1ApiKeysIdGet(int id) async
    test('test apiV1ApiKeysIdGet', () async {
      // TODO
    });

    // List API key scopes
    //
    // Returns all scopes configured for a specific API key.
    //
    //Future<ListScopesResponse> apiV1ApiKeysIdScopesGet(int id) async
    test('test apiV1ApiKeysIdScopesGet', () async {
      // TODO
    });

    // Add scope to API key
    //
    // Adds a new permission scope to an API key. The scope limits what the API key can access.
    //
    //Future<MessageResponse2> apiV1ApiKeysIdScopesPost(int id, AddScopeRequest addScopeRequest) async
    test('test apiV1ApiKeysIdScopesPost', () async {
      // TODO
    });

    // Remove scope from API key
    //
    // Removes a permission scope from an API key.
    //
    //Future<MessageResponse2> apiV1ApiKeysIdScopesScopeIdDelete(int id, int scopeId) async
    test('test apiV1ApiKeysIdScopesScopeIdDelete', () async {
      // TODO
    });

    // Create API key
    //
    // Creates a new API key for the authenticated user. The plain key is only returned once at creation time.
    //
    //Future<CreateAPIKeyResponse> apiV1ApiKeysPost(CreateAPIKeyRequest createAPIKeyRequest) async
    test('test apiV1ApiKeysPost', () async {
      // TODO
    });

  });
}
