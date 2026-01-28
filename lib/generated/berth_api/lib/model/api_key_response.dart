//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class APIKeyResponse {
  /// Returns a new [APIKeyResponse] instance.
  APIKeyResponse({
    required this.createdAt,
    required this.expiresAt,
    required this.id,
    required this.isActive,
    required this.keyPrefix,
    required this.lastUsedAt,
    required this.name,
    required this.scopeCount,
    required this.updatedAt,
  });

  String createdAt;

  String? expiresAt;

  /// Minimum value: 0
  int id;

  bool isActive;

  String keyPrefix;

  String? lastUsedAt;

  String name;

  int scopeCount;

  String updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is APIKeyResponse &&
    other.createdAt == createdAt &&
    other.expiresAt == expiresAt &&
    other.id == id &&
    other.isActive == isActive &&
    other.keyPrefix == keyPrefix &&
    other.lastUsedAt == lastUsedAt &&
    other.name == name &&
    other.scopeCount == scopeCount &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt.hashCode) +
    (expiresAt == null ? 0 : expiresAt!.hashCode) +
    (id.hashCode) +
    (isActive.hashCode) +
    (keyPrefix.hashCode) +
    (lastUsedAt == null ? 0 : lastUsedAt!.hashCode) +
    (name.hashCode) +
    (scopeCount.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'APIKeyResponse[createdAt=$createdAt, expiresAt=$expiresAt, id=$id, isActive=$isActive, keyPrefix=$keyPrefix, lastUsedAt=$lastUsedAt, name=$name, scopeCount=$scopeCount, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created_at'] = this.createdAt;
    if (this.expiresAt != null) {
      json[r'expires_at'] = this.expiresAt;
    } else {
      json[r'expires_at'] = null;
    }
      json[r'id'] = this.id;
      json[r'is_active'] = this.isActive;
      json[r'key_prefix'] = this.keyPrefix;
    if (this.lastUsedAt != null) {
      json[r'last_used_at'] = this.lastUsedAt;
    } else {
      json[r'last_used_at'] = null;
    }
      json[r'name'] = this.name;
      json[r'scope_count'] = this.scopeCount;
      json[r'updated_at'] = this.updatedAt;
    return json;
  }

  /// Returns a new [APIKeyResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static APIKeyResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "APIKeyResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "APIKeyResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return APIKeyResponse(
        createdAt: mapValueOfType<String>(json, r'created_at')!,
        expiresAt: mapValueOfType<String>(json, r'expires_at'),
        id: mapValueOfType<int>(json, r'id')!,
        isActive: mapValueOfType<bool>(json, r'is_active')!,
        keyPrefix: mapValueOfType<String>(json, r'key_prefix')!,
        lastUsedAt: mapValueOfType<String>(json, r'last_used_at'),
        name: mapValueOfType<String>(json, r'name')!,
        scopeCount: mapValueOfType<int>(json, r'scope_count')!,
        updatedAt: mapValueOfType<String>(json, r'updated_at')!,
      );
    }
    return null;
  }

  static List<APIKeyResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <APIKeyResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = APIKeyResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, APIKeyResponse> mapFromJson(dynamic json) {
    final map = <String, APIKeyResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = APIKeyResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of APIKeyResponse-objects as value to a dart map
  static Map<String, List<APIKeyResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<APIKeyResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = APIKeyResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created_at',
    'expires_at',
    'id',
    'is_active',
    'key_prefix',
    'last_used_at',
    'name',
    'scope_count',
    'updated_at',
  };
}

