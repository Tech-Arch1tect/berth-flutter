//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BuildConfig {
  /// Returns a new [BuildConfig] instance.
  BuildConfig({
    this.args = const {},
    this.cacheFrom = const [],
    this.cacheTo = const [],
    this.context,
    this.dockerfile,
    this.platforms = const [],
    this.target,
  });

  Map<String, String> args;

  List<String> cacheFrom;

  List<String> cacheTo;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? context;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? dockerfile;

  List<String> platforms;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? target;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BuildConfig &&
    _deepEquality.equals(other.args, args) &&
    _deepEquality.equals(other.cacheFrom, cacheFrom) &&
    _deepEquality.equals(other.cacheTo, cacheTo) &&
    other.context == context &&
    other.dockerfile == dockerfile &&
    _deepEquality.equals(other.platforms, platforms) &&
    other.target == target;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (args.hashCode) +
    (cacheFrom.hashCode) +
    (cacheTo.hashCode) +
    (context == null ? 0 : context!.hashCode) +
    (dockerfile == null ? 0 : dockerfile!.hashCode) +
    (platforms.hashCode) +
    (target == null ? 0 : target!.hashCode);

  @override
  String toString() => 'BuildConfig[args=$args, cacheFrom=$cacheFrom, cacheTo=$cacheTo, context=$context, dockerfile=$dockerfile, platforms=$platforms, target=$target]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'args'] = this.args;
      json[r'cache_from'] = this.cacheFrom;
      json[r'cache_to'] = this.cacheTo;
    if (this.context != null) {
      json[r'context'] = this.context;
    } else {
      json[r'context'] = null;
    }
    if (this.dockerfile != null) {
      json[r'dockerfile'] = this.dockerfile;
    } else {
      json[r'dockerfile'] = null;
    }
      json[r'platforms'] = this.platforms;
    if (this.target != null) {
      json[r'target'] = this.target;
    } else {
      json[r'target'] = null;
    }
    return json;
  }

  /// Returns a new [BuildConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BuildConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "BuildConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "BuildConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return BuildConfig(
        args: mapCastOfType<String, String>(json, r'args') ?? const {},
        cacheFrom: json[r'cache_from'] is Iterable
            ? (json[r'cache_from'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        cacheTo: json[r'cache_to'] is Iterable
            ? (json[r'cache_to'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        context: mapValueOfType<String>(json, r'context'),
        dockerfile: mapValueOfType<String>(json, r'dockerfile'),
        platforms: json[r'platforms'] is Iterable
            ? (json[r'platforms'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        target: mapValueOfType<String>(json, r'target'),
      );
    }
    return null;
  }

  static List<BuildConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BuildConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BuildConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BuildConfig> mapFromJson(dynamic json) {
    final map = <String, BuildConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BuildConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BuildConfig-objects as value to a dart map
  static Map<String, List<BuildConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BuildConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BuildConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

