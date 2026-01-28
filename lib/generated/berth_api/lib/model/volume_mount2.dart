//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VolumeMount2 {
  /// Returns a new [VolumeMount2] instance.
  VolumeMount2({
    this.readOnly,
    required this.source_,
    required this.target,
    required this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  String source_;

  String target;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VolumeMount2 &&
    other.readOnly == readOnly &&
    other.source_ == source_ &&
    other.target == target &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (readOnly == null ? 0 : readOnly!.hashCode) +
    (source_.hashCode) +
    (target.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'VolumeMount2[readOnly=$readOnly, source_=$source_, target=$target, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.readOnly != null) {
      json[r'read_only'] = this.readOnly;
    } else {
      json[r'read_only'] = null;
    }
      json[r'source'] = this.source_;
      json[r'target'] = this.target;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [VolumeMount2] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VolumeMount2? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VolumeMount2[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VolumeMount2[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VolumeMount2(
        readOnly: mapValueOfType<bool>(json, r'read_only'),
        source_: mapValueOfType<String>(json, r'source')!,
        target: mapValueOfType<String>(json, r'target')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<VolumeMount2> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VolumeMount2>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VolumeMount2.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VolumeMount2> mapFromJson(dynamic json) {
    final map = <String, VolumeMount2>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VolumeMount2.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VolumeMount2-objects as value to a dart map
  static Map<String, List<VolumeMount2>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VolumeMount2>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VolumeMount2.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'source',
    'target',
    'type',
  };
}

