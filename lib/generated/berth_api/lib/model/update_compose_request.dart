//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateComposeRequest {
  /// Returns a new [UpdateComposeRequest] instance.
  UpdateComposeRequest({
    required this.changes,
    this.preview,
  });

  ComposeChanges changes;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? preview;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateComposeRequest &&
    other.changes == changes &&
    other.preview == preview;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (changes.hashCode) +
    (preview == null ? 0 : preview!.hashCode);

  @override
  String toString() => 'UpdateComposeRequest[changes=$changes, preview=$preview]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'changes'] = this.changes;
    if (this.preview != null) {
      json[r'preview'] = this.preview;
    } else {
      json[r'preview'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateComposeRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateComposeRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateComposeRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateComposeRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateComposeRequest(
        changes: ComposeChanges.fromJson(json[r'changes'])!,
        preview: mapValueOfType<bool>(json, r'preview'),
      );
    }
    return null;
  }

  static List<UpdateComposeRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateComposeRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateComposeRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateComposeRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateComposeRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateComposeRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateComposeRequest-objects as value to a dart map
  static Map<String, List<UpdateComposeRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateComposeRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateComposeRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'changes',
  };
}

