//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BuildCacheInfo {
  /// Returns a new [BuildCacheInfo] instance.
  BuildCacheInfo({
    required this.created,
    required this.description,
    required this.id,
    required this.inUse,
    required this.lastUsed,
    this.parent,
    required this.shared,
    required this.size,
    required this.type,
    required this.usageCount,
  });

  DateTime created;

  String description;

  String id;

  bool inUse;

  DateTime lastUsed;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parent;

  bool shared;

  int size;

  String type;

  int usageCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BuildCacheInfo &&
    other.created == created &&
    other.description == description &&
    other.id == id &&
    other.inUse == inUse &&
    other.lastUsed == lastUsed &&
    other.parent == parent &&
    other.shared == shared &&
    other.size == size &&
    other.type == type &&
    other.usageCount == usageCount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created.hashCode) +
    (description.hashCode) +
    (id.hashCode) +
    (inUse.hashCode) +
    (lastUsed.hashCode) +
    (parent == null ? 0 : parent!.hashCode) +
    (shared.hashCode) +
    (size.hashCode) +
    (type.hashCode) +
    (usageCount.hashCode);

  @override
  String toString() => 'BuildCacheInfo[created=$created, description=$description, id=$id, inUse=$inUse, lastUsed=$lastUsed, parent=$parent, shared=$shared, size=$size, type=$type, usageCount=$usageCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created'] = this.created.toUtc().toIso8601String();
      json[r'description'] = this.description;
      json[r'id'] = this.id;
      json[r'in_use'] = this.inUse;
      json[r'last_used'] = this.lastUsed.toUtc().toIso8601String();
    if (this.parent != null) {
      json[r'parent'] = this.parent;
    } else {
      json[r'parent'] = null;
    }
      json[r'shared'] = this.shared;
      json[r'size'] = this.size;
      json[r'type'] = this.type;
      json[r'usage_count'] = this.usageCount;
    return json;
  }

  /// Returns a new [BuildCacheInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BuildCacheInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BuildCacheInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BuildCacheInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BuildCacheInfo(
        created: mapDateTime(json, r'created', r'')!,
        description: mapValueOfType<String>(json, r'description')!,
        id: mapValueOfType<String>(json, r'id')!,
        inUse: mapValueOfType<bool>(json, r'in_use')!,
        lastUsed: mapDateTime(json, r'last_used', r'')!,
        parent: mapValueOfType<String>(json, r'parent'),
        shared: mapValueOfType<bool>(json, r'shared')!,
        size: mapValueOfType<int>(json, r'size')!,
        type: mapValueOfType<String>(json, r'type')!,
        usageCount: mapValueOfType<int>(json, r'usage_count')!,
      );
    }
    return null;
  }

  static List<BuildCacheInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuildCacheInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuildCacheInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BuildCacheInfo> mapFromJson(dynamic json) {
    final map = <String, BuildCacheInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BuildCacheInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BuildCacheInfo-objects as value to a dart map
  static Map<String, List<BuildCacheInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BuildCacheInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BuildCacheInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created',
    'description',
    'id',
    'in_use',
    'last_used',
    'shared',
    'size',
    'type',
    'usage_count',
  };
}

