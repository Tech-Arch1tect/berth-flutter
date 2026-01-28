//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RootFS {
  /// Returns a new [RootFS] instance.
  RootFS({
    this.layers = const [],
    required this.type,
  });

  List<String> layers;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RootFS &&
    _deepEquality.equals(other.layers, layers) &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (layers.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'RootFS[layers=$layers, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'layers'] = this.layers;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [RootFS] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RootFS? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "RootFS[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "RootFS[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return RootFS(
        layers: json[r'layers'] is Iterable
            ? (json[r'layers'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<RootFS> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RootFS>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RootFS.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RootFS> mapFromJson(dynamic json) {
    final map = <String, RootFS>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RootFS.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RootFS-objects as value to a dart map
  static Map<String, List<RootFS>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RootFS>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RootFS.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

