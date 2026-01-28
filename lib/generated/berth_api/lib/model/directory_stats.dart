//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DirectoryStats {
  /// Returns a new [DirectoryStats] instance.
  DirectoryStats({
    this.groupName,
    required this.mostCommonGroup,
    required this.mostCommonMode,
    required this.mostCommonOwner,
    this.ownerName,
    required this.path,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? groupName;

  /// Minimum value: 0
  int mostCommonGroup;

  String mostCommonMode;

  /// Minimum value: 0
  int mostCommonOwner;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ownerName;

  String path;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DirectoryStats &&
    other.groupName == groupName &&
    other.mostCommonGroup == mostCommonGroup &&
    other.mostCommonMode == mostCommonMode &&
    other.mostCommonOwner == mostCommonOwner &&
    other.ownerName == ownerName &&
    other.path == path;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (groupName == null ? 0 : groupName!.hashCode) +
    (mostCommonGroup.hashCode) +
    (mostCommonMode.hashCode) +
    (mostCommonOwner.hashCode) +
    (ownerName == null ? 0 : ownerName!.hashCode) +
    (path.hashCode);

  @override
  String toString() => 'DirectoryStats[groupName=$groupName, mostCommonGroup=$mostCommonGroup, mostCommonMode=$mostCommonMode, mostCommonOwner=$mostCommonOwner, ownerName=$ownerName, path=$path]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.groupName != null) {
      json[r'group_name'] = this.groupName;
    } else {
      json[r'group_name'] = null;
    }
      json[r'most_common_group'] = this.mostCommonGroup;
      json[r'most_common_mode'] = this.mostCommonMode;
      json[r'most_common_owner'] = this.mostCommonOwner;
    if (this.ownerName != null) {
      json[r'owner_name'] = this.ownerName;
    } else {
      json[r'owner_name'] = null;
    }
      json[r'path'] = this.path;
    return json;
  }

  /// Returns a new [DirectoryStats] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DirectoryStats? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DirectoryStats[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DirectoryStats[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DirectoryStats(
        groupName: mapValueOfType<String>(json, r'group_name'),
        mostCommonGroup: mapValueOfType<int>(json, r'most_common_group')!,
        mostCommonMode: mapValueOfType<String>(json, r'most_common_mode')!,
        mostCommonOwner: mapValueOfType<int>(json, r'most_common_owner')!,
        ownerName: mapValueOfType<String>(json, r'owner_name'),
        path: mapValueOfType<String>(json, r'path')!,
      );
    }
    return null;
  }

  static List<DirectoryStats> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DirectoryStats>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DirectoryStats.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DirectoryStats> mapFromJson(dynamic json) {
    final map = <String, DirectoryStats>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DirectoryStats.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DirectoryStats-objects as value to a dart map
  static Map<String, List<DirectoryStats>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DirectoryStats>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DirectoryStats.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'most_common_group',
    'most_common_mode',
    'most_common_owner',
    'path',
  };
}

