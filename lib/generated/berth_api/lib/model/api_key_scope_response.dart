//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class APIKeyScopeResponse {
  /// Returns a new [APIKeyScopeResponse] instance.
  APIKeyScopeResponse({
    required this.apiKeyId,
    required this.createdAt,
    required this.id,
    required this.permission,
    required this.permissionId,
    required this.serverId,
    this.serverName,
    required this.stackPattern,
    required this.updatedAt,
  });

  /// Minimum value: 0
  int apiKeyId;

  String createdAt;

  /// Minimum value: 0
  int id;

  String permission;

  /// Minimum value: 0
  int permissionId;

  /// Minimum value: 0
  int? serverId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serverName;

  String stackPattern;

  String updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is APIKeyScopeResponse &&
    other.apiKeyId == apiKeyId &&
    other.createdAt == createdAt &&
    other.id == id &&
    other.permission == permission &&
    other.permissionId == permissionId &&
    other.serverId == serverId &&
    other.serverName == serverName &&
    other.stackPattern == stackPattern &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (apiKeyId.hashCode) +
    (createdAt.hashCode) +
    (id.hashCode) +
    (permission.hashCode) +
    (permissionId.hashCode) +
    (serverId == null ? 0 : serverId!.hashCode) +
    (serverName == null ? 0 : serverName!.hashCode) +
    (stackPattern.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'APIKeyScopeResponse[apiKeyId=$apiKeyId, createdAt=$createdAt, id=$id, permission=$permission, permissionId=$permissionId, serverId=$serverId, serverName=$serverName, stackPattern=$stackPattern, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'api_key_id'] = this.apiKeyId;
      json[r'created_at'] = this.createdAt;
      json[r'id'] = this.id;
      json[r'permission'] = this.permission;
      json[r'permission_id'] = this.permissionId;
    if (this.serverId != null) {
      json[r'server_id'] = this.serverId;
    } else {
      json[r'server_id'] = null;
    }
    if (this.serverName != null) {
      json[r'server_name'] = this.serverName;
    } else {
      json[r'server_name'] = null;
    }
      json[r'stack_pattern'] = this.stackPattern;
      json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [APIKeyScopeResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static APIKeyScopeResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "APIKeyScopeResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "APIKeyScopeResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return APIKeyScopeResponse(
        apiKeyId: mapValueOfType<int>(json, r'api_key_id')!,
        createdAt: mapValueOfType<String>(json, r'created_at')!,
        id: mapValueOfType<int>(json, r'id')!,
        permission: mapValueOfType<String>(json, r'permission')!,
        permissionId: mapValueOfType<int>(json, r'permission_id')!,
        serverId: mapValueOfType<int>(json, r'server_id'),
        serverName: mapValueOfType<String>(json, r'server_name'),
        stackPattern: mapValueOfType<String>(json, r'stack_pattern')!,
        updatedAt: mapValueOfType<String>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<APIKeyScopeResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <APIKeyScopeResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = APIKeyScopeResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, APIKeyScopeResponse> mapFromJson(dynamic json) {
    final map = <String, APIKeyScopeResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = APIKeyScopeResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of APIKeyScopeResponse-objects as value to a dart map
  static Map<String, List<APIKeyScopeResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<APIKeyScopeResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = APIKeyScopeResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'api_key_id',
    'created_at',
    'id',
    'permission',
    'permission_id',
    'server_id',
    'stack_pattern',
    'updated_at',
  };
}

