//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImageConfig {
  /// Returns a new [ImageConfig] instance.
  ImageConfig({
    this.cmd = const [],
    this.entrypoint = const [],
    this.env = const [],
    this.exposedPorts = const {},
    this.labels = const {},
    this.user,
    this.workingDir,
  });

  List<String> cmd;

  List<String> entrypoint;

  List<String> env;

  Map<String, Object> exposedPorts;

  Map<String, String> labels;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? user;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? workingDir;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ImageConfig &&
    _deepEquality.equals(other.cmd, cmd) &&
    _deepEquality.equals(other.entrypoint, entrypoint) &&
    _deepEquality.equals(other.env, env) &&
    _deepEquality.equals(other.exposedPorts, exposedPorts) &&
    _deepEquality.equals(other.labels, labels) &&
    other.user == user &&
    other.workingDir == workingDir;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cmd.hashCode) +
    (entrypoint.hashCode) +
    (env.hashCode) +
    (exposedPorts.hashCode) +
    (labels.hashCode) +
    (user == null ? 0 : user!.hashCode) +
    (workingDir == null ? 0 : workingDir!.hashCode);

  @override
  String toString() => 'ImageConfig[cmd=$cmd, entrypoint=$entrypoint, env=$env, exposedPorts=$exposedPorts, labels=$labels, user=$user, workingDir=$workingDir]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'cmd'] = this.cmd;
      json[r'entrypoint'] = this.entrypoint;
      json[r'env'] = this.env;
      json[r'exposed_ports'] = this.exposedPorts;
      json[r'labels'] = this.labels;
    if (this.user != null) {
      json[r'user'] = this.user;
    } else {
      json[r'user'] = null;
    }
    if (this.workingDir != null) {
      json[r'working_dir'] = this.workingDir;
    } else {
      json[r'working_dir'] = null;
    }
    return json;
  }

  /// Returns a new [ImageConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImageConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ImageConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ImageConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImageConfig(
        cmd: json[r'cmd'] is Iterable
            ? (json[r'cmd'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        entrypoint: json[r'entrypoint'] is Iterable
            ? (json[r'entrypoint'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        env: json[r'env'] is Iterable
            ? (json[r'env'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        exposedPorts: mapCastOfType<String, Object>(json, r'exposed_ports') ?? const {},
        labels: mapCastOfType<String, String>(json, r'labels') ?? const {},
        user: mapValueOfType<String>(json, r'user'),
        workingDir: mapValueOfType<String>(json, r'working_dir'),
      );
    }
    return null;
  }

  static List<ImageConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ImageConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImageConfig> mapFromJson(dynamic json) {
    final map = <String, ImageConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ImageConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImageConfig-objects as value to a dart map
  static Map<String, List<ImageConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ImageConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImageConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

