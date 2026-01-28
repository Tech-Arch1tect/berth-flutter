//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeleteResult {
  /// Returns a new [DeleteResult] instance.
  DeleteResult({
    this.error,
    required this.id,
    required this.success,
    required this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  String id;

  bool success;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeleteResult &&
    other.error == error &&
    other.id == id &&
    other.success == success &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (error == null ? 0 : error!.hashCode) +
    (id.hashCode) +
    (success.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'DeleteResult[error=$error, id=$id, success=$success, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
      json[r'id'] = this.id;
      json[r'success'] = this.success;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [DeleteResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeleteResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DeleteResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DeleteResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DeleteResult(
        error: mapValueOfType<String>(json, r'error'),
        id: mapValueOfType<String>(json, r'id')!,
        success: mapValueOfType<bool>(json, r'success')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<DeleteResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeleteResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeleteResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeleteResult> mapFromJson(dynamic json) {
    final map = <String, DeleteResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeleteResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeleteResult-objects as value to a dart map
  static Map<String, List<DeleteResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DeleteResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeleteResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'success',
    'type',
  };
}

