//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChownRequest {
  /// Returns a new [ChownRequest] instance.
  ChownRequest({
    this.groupId,
    this.ownerId,
    required this.path,
    this.recursive,
  });

  /// Minimum value: 0
  int? groupId;

  /// Minimum value: 0
  int? ownerId;

  String path;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? recursive;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChownRequest &&
    other.groupId == groupId &&
    other.ownerId == ownerId &&
    other.path == path &&
    other.recursive == recursive;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (groupId == null ? 0 : groupId!.hashCode) +
    (ownerId == null ? 0 : ownerId!.hashCode) +
    (path.hashCode) +
    (recursive == null ? 0 : recursive!.hashCode);

  @override
  String toString() => 'ChownRequest[groupId=$groupId, ownerId=$ownerId, path=$path, recursive=$recursive]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.groupId != null) {
      json[r'group_id'] = this.groupId;
    } else {
      json[r'group_id'] = null;
    }
    if (this.ownerId != null) {
      json[r'owner_id'] = this.ownerId;
    } else {
      json[r'owner_id'] = null;
    }
      json[r'path'] = this.path;
    if (this.recursive != null) {
      json[r'recursive'] = this.recursive;
    } else {
      json[r'recursive'] = null;
    }
    return json;
  }

  /// Returns a new [ChownRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChownRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ChownRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ChownRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ChownRequest(
        groupId: mapValueOfType<int>(json, r'group_id'),
        ownerId: mapValueOfType<int>(json, r'owner_id'),
        path: mapValueOfType<String>(json, r'path')!,
        recursive: mapValueOfType<bool>(json, r'recursive'),
      );
    }
    return null;
  }

  static List<ChownRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChownRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChownRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChownRequest> mapFromJson(dynamic json) {
    final map = <String, ChownRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChownRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChownRequest-objects as value to a dart map
  static Map<String, List<ChownRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChownRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChownRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'path',
  };
}

