//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WriteFileRequest {
  /// Returns a new [WriteFileRequest] instance.
  WriteFileRequest({
    required this.content,
    this.encoding,
    this.groupId,
    this.mode,
    this.ownerId,
    required this.path,
  });

  String content;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? encoding;

  /// Minimum value: 0
  int? groupId;

  String? mode;

  /// Minimum value: 0
  int? ownerId;

  String path;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WriteFileRequest &&
    other.content == content &&
    other.encoding == encoding &&
    other.groupId == groupId &&
    other.mode == mode &&
    other.ownerId == ownerId &&
    other.path == path;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (content.hashCode) +
    (encoding == null ? 0 : encoding!.hashCode) +
    (groupId == null ? 0 : groupId!.hashCode) +
    (mode == null ? 0 : mode!.hashCode) +
    (ownerId == null ? 0 : ownerId!.hashCode) +
    (path.hashCode);

  @override
  String toString() => 'WriteFileRequest[content=$content, encoding=$encoding, groupId=$groupId, mode=$mode, ownerId=$ownerId, path=$path]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'content'] = this.content;
    if (this.encoding != null) {
      json[r'encoding'] = this.encoding;
    } else {
      json[r'encoding'] = null;
    }
    if (this.groupId != null) {
      json[r'group_id'] = this.groupId;
    } else {
      json[r'group_id'] = null;
    }
    if (this.mode != null) {
      json[r'mode'] = this.mode;
    } else {
      json[r'mode'] = null;
    }
    if (this.ownerId != null) {
      json[r'owner_id'] = this.ownerId;
    } else {
      json[r'owner_id'] = null;
    }
      json[r'path'] = this.path;
    return json;
  }

  /// Returns a new [WriteFileRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WriteFileRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "WriteFileRequest[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "WriteFileRequest[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return WriteFileRequest(
        content: mapValueOfType<String>(json, r'content')!,
        encoding: mapValueOfType<String>(json, r'encoding'),
        groupId: mapValueOfType<int>(json, r'group_id'),
        mode: mapValueOfType<String>(json, r'mode'),
        ownerId: mapValueOfType<int>(json, r'owner_id'),
        path: mapValueOfType<String>(json, r'path')!,
      );
    }
    return null;
  }

  static List<WriteFileRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WriteFileRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WriteFileRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WriteFileRequest> mapFromJson(dynamic json) {
    final map = <String, WriteFileRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WriteFileRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WriteFileRequest-objects as value to a dart map
  static Map<String, List<WriteFileRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WriteFileRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WriteFileRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'content',
    'path',
  };
}

