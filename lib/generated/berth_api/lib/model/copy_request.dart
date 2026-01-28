//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CopyRequest {
  /// Returns a new [CopyRequest] instance.
  CopyRequest({
    required this.sourcePath,
    required this.targetPath,
  });

  String sourcePath;

  String targetPath;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CopyRequest &&
    other.sourcePath == sourcePath &&
    other.targetPath == targetPath;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (sourcePath.hashCode) +
    (targetPath.hashCode);

  @override
  String toString() => 'CopyRequest[sourcePath=$sourcePath, targetPath=$targetPath]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'source_path'] = this.sourcePath;
      json[r'target_path'] = this.targetPath;
    return json;
  }

  /// Returns a new [CopyRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CopyRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CopyRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CopyRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CopyRequest(
        sourcePath: mapValueOfType<String>(json, r'source_path')!,
        targetPath: mapValueOfType<String>(json, r'target_path')!,
      );
    }
    return null;
  }

  static List<CopyRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CopyRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CopyRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CopyRequest> mapFromJson(dynamic json) {
    final map = <String, CopyRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CopyRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CopyRequest-objects as value to a dart map
  static Map<String, List<CopyRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CopyRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CopyRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'source_path',
    'target_path',
  };
}

