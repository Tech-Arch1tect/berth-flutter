//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BaseModel {
  /// Returns a new [BaseModel] instance.
  BaseModel({
    required this.createdAt,
    required this.deletedAt,
    required this.id,
    required this.updatedAt,
  });

  DateTime createdAt;

  DeletedAt deletedAt;

  /// Minimum value: 0
  int id;

  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BaseModel &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.id == id &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (createdAt.hashCode) +
    (deletedAt.hashCode) +
    (id.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'BaseModel[createdAt=$createdAt, deletedAt=$deletedAt, id=$id, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'deleted_at'] = this.deletedAt;
      json[r'id'] = this.id;
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [BaseModel] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BaseModel? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BaseModel[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BaseModel[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BaseModel(
        createdAt: mapDateTime(json, r'created_at', r'')!,
        deletedAt: DeletedAt.fromJson(json[r'deleted_at'])!,
        id: mapValueOfType<int>(json, r'id')!,
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
      );
    }
    return null;
  }

  static List<BaseModel> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BaseModel>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BaseModel.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BaseModel> mapFromJson(dynamic json) {
    final map = <String, BaseModel>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BaseModel.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BaseModel-objects as value to a dart map
  static Map<String, List<BaseModel>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BaseModel>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BaseModel.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created_at',
    'deleted_at',
    'id',
    'updated_at',
  };
}

