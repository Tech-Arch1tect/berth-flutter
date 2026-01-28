//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class VolumeMount {
  /// Returns a new [VolumeMount] instance.
  VolumeMount({
    this.bindOptions = const {},
    this.readOnly,
    required this.source_,
    required this.target,
    this.tmpfsOptions = const {},
    required this.type,
  });

  Map<String, String> bindOptions;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? readOnly;

  String source_;

  String target;

  Map<String, String> tmpfsOptions;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is VolumeMount &&
    _deepEquality.equals(other.bindOptions, bindOptions) &&
    other.readOnly == readOnly &&
    other.source_ == source_ &&
    other.target == target &&
    _deepEquality.equals(other.tmpfsOptions, tmpfsOptions) &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bindOptions.hashCode) +
    (readOnly == null ? 0 : readOnly!.hashCode) +
    (source_.hashCode) +
    (target.hashCode) +
    (tmpfsOptions.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'VolumeMount[bindOptions=$bindOptions, readOnly=$readOnly, source_=$source_, target=$target, tmpfsOptions=$tmpfsOptions, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'bind_options'] = this.bindOptions;
    if (this.readOnly != null) {
      json[r'read_only'] = this.readOnly;
    } else {
      json[r'read_only'] = null;
    }
      json[r'source'] = this.source_;
      json[r'target'] = this.target;
      json[r'tmpfs_options'] = this.tmpfsOptions;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [VolumeMount] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static VolumeMount? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "VolumeMount[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "VolumeMount[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return VolumeMount(
        bindOptions: mapCastOfType<String, String>(json, r'bind_options') ?? const {},
        readOnly: mapValueOfType<bool>(json, r'read_only'),
        source_: mapValueOfType<String>(json, r'source')!,
        target: mapValueOfType<String>(json, r'target')!,
        tmpfsOptions: mapCastOfType<String, String>(json, r'tmpfs_options') ?? const {},
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<VolumeMount> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VolumeMount>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VolumeMount.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, VolumeMount> mapFromJson(dynamic json) {
    final map = <String, VolumeMount>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = VolumeMount.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of VolumeMount-objects as value to a dart map
  static Map<String, List<VolumeMount>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<VolumeMount>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = VolumeMount.listFromJson(entry.value, growable: growable,);
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

