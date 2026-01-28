//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RenameRequest {
  /// Returns a new [RenameRequest] instance.
  RenameRequest({
    required this.newPath,
    required this.oldPath,
  });

  String newPath;

  String oldPath;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RenameRequest &&
    other.newPath == newPath &&
    other.oldPath == oldPath;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (newPath.hashCode) +
    (oldPath.hashCode);

  @override
  String toString() => 'RenameRequest[newPath=$newPath, oldPath=$oldPath]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'new_path'] = this.newPath;
      json[r'old_path'] = this.oldPath;
    return json;
  }

  /// Returns a new [RenameRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RenameRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RenameRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RenameRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RenameRequest(
        newPath: mapValueOfType<String>(json, r'new_path')!,
        oldPath: mapValueOfType<String>(json, r'old_path')!,
      );
    }
    return null;
  }

  static List<RenameRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RenameRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RenameRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RenameRequest> mapFromJson(dynamic json) {
    final map = <String, RenameRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RenameRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RenameRequest-objects as value to a dart map
  static Map<String, List<RenameRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RenameRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RenameRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'new_path',
    'old_path',
  };
}

