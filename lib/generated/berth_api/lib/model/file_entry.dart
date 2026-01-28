//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FileEntry {
  /// Returns a new [FileEntry] instance.
  FileEntry({
    this.extension_,
    this.group,
    this.groupId,
    required this.isDirectory,
    required this.modTime,
    required this.mode,
    required this.name,
    this.owner,
    this.ownerId,
    required this.path,
    required this.size,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? extension_;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? group;

  /// Minimum value: 0
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? groupId;

  bool isDirectory;

  DateTime modTime;

  String mode;

  String name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? owner;

  /// Minimum value: 0
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? ownerId;

  String path;

  int size;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FileEntry &&
    other.extension_ == extension_ &&
    other.group == group &&
    other.groupId == groupId &&
    other.isDirectory == isDirectory &&
    other.modTime == modTime &&
    other.mode == mode &&
    other.name == name &&
    other.owner == owner &&
    other.ownerId == ownerId &&
    other.path == path &&
    other.size == size;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (extension_ == null ? 0 : extension_!.hashCode) +
    (group == null ? 0 : group!.hashCode) +
    (groupId == null ? 0 : groupId!.hashCode) +
    (isDirectory.hashCode) +
    (modTime.hashCode) +
    (mode.hashCode) +
    (name.hashCode) +
    (owner == null ? 0 : owner!.hashCode) +
    (ownerId == null ? 0 : ownerId!.hashCode) +
    (path.hashCode) +
    (size.hashCode);

  @override
  String toString() => 'FileEntry[extension_=$extension_, group=$group, groupId=$groupId, isDirectory=$isDirectory, modTime=$modTime, mode=$mode, name=$name, owner=$owner, ownerId=$ownerId, path=$path, size=$size]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.extension_ != null) {
      json[r'extension'] = this.extension_;
    } else {
      json[r'extension'] = null;
    }
    if (this.group != null) {
      json[r'group'] = this.group;
    } else {
      json[r'group'] = null;
    }
    if (this.groupId != null) {
      json[r'group_id'] = this.groupId;
    } else {
      json[r'group_id'] = null;
    }
      json[r'is_directory'] = this.isDirectory;
      json[r'mod_time'] = this.modTime.toUtc().toIso8601String();
      json[r'mode'] = this.mode;
      json[r'name'] = this.name;
    if (this.owner != null) {
      json[r'owner'] = this.owner;
    } else {
      json[r'owner'] = null;
    }
    if (this.ownerId != null) {
      json[r'owner_id'] = this.ownerId;
    } else {
      json[r'owner_id'] = null;
    }
      json[r'path'] = this.path;
      json[r'size'] = this.size;
    return json;
  }

  /// Returns a new [FileEntry] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FileEntry? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "FileEntry[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "FileEntry[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return FileEntry(
        extension_: mapValueOfType<String>(json, r'extension'),
        group: mapValueOfType<String>(json, r'group'),
        groupId: mapValueOfType<int>(json, r'group_id'),
        isDirectory: mapValueOfType<bool>(json, r'is_directory')!,
        modTime: mapDateTime(json, r'mod_time', r'')!,
        mode: mapValueOfType<String>(json, r'mode')!,
        name: mapValueOfType<String>(json, r'name')!,
        owner: mapValueOfType<String>(json, r'owner'),
        ownerId: mapValueOfType<int>(json, r'owner_id'),
        path: mapValueOfType<String>(json, r'path')!,
        size: mapValueOfType<int>(json, r'size')!,
      );
    }
    return null;
  }

  static List<FileEntry> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FileEntry>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FileEntry.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FileEntry> mapFromJson(dynamic json) {
    final map = <String, FileEntry>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FileEntry.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FileEntry-objects as value to a dart map
  static Map<String, List<FileEntry>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FileEntry>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FileEntry.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'is_directory',
    'mod_time',
    'mode',
    'name',
    'path',
    'size',
  };
}

