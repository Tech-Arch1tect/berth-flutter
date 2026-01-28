//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TOTPSetupData {
  /// Returns a new [TOTPSetupData] instance.
  TOTPSetupData({
    required this.qrCodeUri,
    required this.secret,
  });

  String qrCodeUri;

  String secret;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TOTPSetupData &&
    other.qrCodeUri == qrCodeUri &&
    other.secret == secret;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (qrCodeUri.hashCode) +
    (secret.hashCode);

  @override
  String toString() => 'TOTPSetupData[qrCodeUri=$qrCodeUri, secret=$secret]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'qr_code_uri'] = this.qrCodeUri;
      json[r'secret'] = this.secret;
    return json;
  }

  /// Returns a new [TOTPSetupData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TOTPSetupData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "TOTPSetupData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "TOTPSetupData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return TOTPSetupData(
        qrCodeUri: mapValueOfType<String>(json, r'qr_code_uri')!,
        secret: mapValueOfType<String>(json, r'secret')!,
      );
    }
    return null;
  }

  static List<TOTPSetupData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TOTPSetupData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TOTPSetupData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TOTPSetupData> mapFromJson(dynamic json) {
    final map = <String, TOTPSetupData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TOTPSetupData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TOTPSetupData-objects as value to a dart map
  static Map<String, List<TOTPSetupData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TOTPSetupData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TOTPSetupData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'qr_code_uri',
    'secret',
  };
}

