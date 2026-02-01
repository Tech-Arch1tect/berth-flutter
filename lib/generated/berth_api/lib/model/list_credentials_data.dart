//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ListCredentialsData {
  /// Returns a new [ListCredentialsData] instance.
  ListCredentialsData({
    this.credentials = const [],
  });

  List<RegistryCredentialInfo> credentials;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ListCredentialsData &&
    _deepEquality.equals(other.credentials, credentials);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (credentials.hashCode);

  @override
  String toString() => 'ListCredentialsData[credentials=$credentials]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'credentials'] = this.credentials;
    return json;
  }

  /// Returns a new [ListCredentialsData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ListCredentialsData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ListCredentialsData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ListCredentialsData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ListCredentialsData(
        credentials: RegistryCredentialInfo.listFromJson(json[r'credentials']),
      );
    }
    return null;
  }

  static List<ListCredentialsData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ListCredentialsData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListCredentialsData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListCredentialsData> mapFromJson(dynamic json) {
    final map = <String, ListCredentialsData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ListCredentialsData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListCredentialsData-objects as value to a dart map
  static Map<String, List<ListCredentialsData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ListCredentialsData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListCredentialsData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'credentials',
  };
}

