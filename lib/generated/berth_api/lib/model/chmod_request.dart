//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChmodRequest {
  /// Returns a new [ChmodRequest] instance.
  ChmodRequest({
    required this.mode,
    required this.path,
    this.recursive,
  });

  String mode;

  String path;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? recursive;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChmodRequest &&
    other.mode == mode &&
    other.path == path &&
    other.recursive == recursive;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (mode.hashCode) +
    (path.hashCode) +
    (recursive == null ? 0 : recursive!.hashCode);

  @override
  String toString() => 'ChmodRequest[mode=$mode, path=$path, recursive=$recursive]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'mode'] = this.mode;
      json[r'path'] = this.path;
    if (this.recursive != null) {
      json[r'recursive'] = this.recursive;
    } else {
      json[r'recursive'] = null;
    }
    return json;
  }

  /// Returns a new [ChmodRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChmodRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChmodRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChmodRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChmodRequest(
        mode: mapValueOfType<String>(json, r'mode')!,
        path: mapValueOfType<String>(json, r'path')!,
        recursive: mapValueOfType<bool>(json, r'recursive'),
      );
    }
    return null;
  }

  static List<ChmodRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChmodRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChmodRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChmodRequest> mapFromJson(dynamic json) {
    final map = <String, ChmodRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChmodRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChmodRequest-objects as value to a dart map
  static Map<String, List<ChmodRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChmodRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChmodRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'mode',
    'path',
  };
}

