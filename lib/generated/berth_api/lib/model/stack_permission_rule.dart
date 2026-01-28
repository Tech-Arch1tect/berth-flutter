//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StackPermissionRule {
  /// Returns a new [StackPermissionRule] instance.
  StackPermissionRule({
    required this.id,
    required this.isStackBased,
    required this.permissionId,
    required this.serverId,
    required this.stackPattern,
  });

  /// Minimum value: 0
  int id;

  bool isStackBased;

  /// Minimum value: 0
  int permissionId;

  /// Minimum value: 0
  int serverId;

  String stackPattern;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StackPermissionRule &&
    other.id == id &&
    other.isStackBased == isStackBased &&
    other.permissionId == permissionId &&
    other.serverId == serverId &&
    other.stackPattern == stackPattern;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (isStackBased.hashCode) +
    (permissionId.hashCode) +
    (serverId.hashCode) +
    (stackPattern.hashCode);

  @override
  String toString() => 'StackPermissionRule[id=$id, isStackBased=$isStackBased, permissionId=$permissionId, serverId=$serverId, stackPattern=$stackPattern]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'is_stack_based'] = this.isStackBased;
      json[r'permission_id'] = this.permissionId;
      json[r'server_id'] = this.serverId;
      json[r'stack_pattern'] = this.stackPattern;
    return json;
  }

  /// Returns a new [StackPermissionRule] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StackPermissionRule? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StackPermissionRule[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StackPermissionRule[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StackPermissionRule(
        id: mapValueOfType<int>(json, r'id')!,
        isStackBased: mapValueOfType<bool>(json, r'is_stack_based')!,
        permissionId: mapValueOfType<int>(json, r'permission_id')!,
        serverId: mapValueOfType<int>(json, r'server_id')!,
        stackPattern: mapValueOfType<String>(json, r'stack_pattern')!,
      );
    }
    return null;
  }

  static List<StackPermissionRule> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StackPermissionRule>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StackPermissionRule.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StackPermissionRule> mapFromJson(dynamic json) {
    final map = <String, StackPermissionRule>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StackPermissionRule.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StackPermissionRule-objects as value to a dart map
  static Map<String, List<StackPermissionRule>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StackPermissionRule>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StackPermissionRule.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'is_stack_based',
    'permission_id',
    'server_id',
    'stack_pattern',
  };
}

