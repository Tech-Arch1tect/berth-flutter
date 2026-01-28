//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PerImageTrend {
  /// Returns a new [PerImageTrend] instance.
  PerImageTrend({
    required this.imageName,
    this.trendPoints = const [],
  });

  String imageName;

  List<ImageTrendPoint> trendPoints;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PerImageTrend &&
    other.imageName == imageName &&
    _deepEquality.equals(other.trendPoints, trendPoints);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (imageName.hashCode) +
    (trendPoints.hashCode);

  @override
  String toString() => 'PerImageTrend[imageName=$imageName, trendPoints=$trendPoints]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'image_name'] = this.imageName;
      json[r'trend_points'] = this.trendPoints;
    return json;
  }

  /// Returns a new [PerImageTrend] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PerImageTrend? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PerImageTrend[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PerImageTrend[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PerImageTrend(
        imageName: mapValueOfType<String>(json, r'image_name')!,
        trendPoints: ImageTrendPoint.listFromJson(json[r'trend_points']),
      );
    }
    return null;
  }

  static List<PerImageTrend> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PerImageTrend>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PerImageTrend.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PerImageTrend> mapFromJson(dynamic json) {
    final map = <String, PerImageTrend>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PerImageTrend.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PerImageTrend-objects as value to a dart map
  static Map<String, List<PerImageTrend>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PerImageTrend>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PerImageTrend.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'image_name',
    'trend_points',
  };
}

