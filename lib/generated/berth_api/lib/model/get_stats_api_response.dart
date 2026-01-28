//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetStatsAPIResponse {
  /// Returns a new [GetStatsAPIResponse] instance.
  GetStatsAPIResponse({
    required this.data,
    required this.success,
  });

  StatsResponseData data;

  bool success;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetStatsAPIResponse &&
    other.data == data &&
    other.success == success;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (data.hashCode) +
    (success.hashCode);

  @override
  String toString() => 'GetStatsAPIResponse[data=$data, success=$success]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'data'] = this.data;
      json[r'success'] = this.success;
    return json;
  }

  /// Returns a new [GetStatsAPIResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetStatsAPIResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "GetStatsAPIResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "GetStatsAPIResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return GetStatsAPIResponse(
        data: StatsResponseData.fromJson(json[r'data'])!,
        success: mapValueOfType<bool>(json, r'success')!,
      );
    }
    return null;
  }

  static List<GetStatsAPIResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetStatsAPIResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetStatsAPIResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetStatsAPIResponse> mapFromJson(dynamic json) {
    final map = <String, GetStatsAPIResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetStatsAPIResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetStatsAPIResponse-objects as value to a dart map
  static Map<String, List<GetStatsAPIResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetStatsAPIResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetStatsAPIResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'data',
    'success',
  };
}

