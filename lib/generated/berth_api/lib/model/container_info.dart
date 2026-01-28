//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContainerInfo {
  /// Returns a new [ContainerInfo] instance.
  ContainerInfo({
    required this.created,
    required this.id,
    required this.image,
    this.labels = const {},
    required this.name,
    required this.size,
    required this.state,
    required this.status,
  });

  DateTime created;

  String id;

  String image;

  Map<String, String> labels;

  String name;

  int size;

  String state;

  String status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContainerInfo &&
    other.created == created &&
    other.id == id &&
    other.image == image &&
    _deepEquality.equals(other.labels, labels) &&
    other.name == name &&
    other.size == size &&
    other.state == state &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created.hashCode) +
    (id.hashCode) +
    (image.hashCode) +
    (labels.hashCode) +
    (name.hashCode) +
    (size.hashCode) +
    (state.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'ContainerInfo[created=$created, id=$id, image=$image, labels=$labels, name=$name, size=$size, state=$state, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created'] = this.created.toUtc().toIso8601String();
      json[r'id'] = this.id;
      json[r'image'] = this.image;
      json[r'labels'] = this.labels;
      json[r'name'] = this.name;
      json[r'size'] = this.size;
      json[r'state'] = this.state;
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [ContainerInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContainerInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContainerInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContainerInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContainerInfo(
        created: mapDateTime(json, r'created', r'')!,
        id: mapValueOfType<String>(json, r'id')!,
        image: mapValueOfType<String>(json, r'image')!,
        labels: mapCastOfType<String, String>(json, r'labels')!,
        name: mapValueOfType<String>(json, r'name')!,
        size: mapValueOfType<int>(json, r'size')!,
        state: mapValueOfType<String>(json, r'state')!,
        status: mapValueOfType<String>(json, r'status')!,
      );
    }
    return null;
  }

  static List<ContainerInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContainerInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContainerInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContainerInfo> mapFromJson(dynamic json) {
    final map = <String, ContainerInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContainerInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContainerInfo-objects as value to a dart map
  static Map<String, List<ContainerInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContainerInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContainerInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created',
    'id',
    'image',
    'labels',
    'name',
    'size',
    'state',
    'status',
  };
}

