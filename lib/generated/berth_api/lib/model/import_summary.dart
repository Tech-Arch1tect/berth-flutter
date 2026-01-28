//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImportSummary {
  /// Returns a new [ImportSummary] instance.
  ImportSummary({
    required this.permissionsImported,
    required this.rolesImported,
    required this.serversImported,
    required this.totpSecretsImported,
    required this.usersImported,
  });

  int permissionsImported;

  int rolesImported;

  int serversImported;

  int totpSecretsImported;

  int usersImported;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ImportSummary &&
    other.permissionsImported == permissionsImported &&
    other.rolesImported == rolesImported &&
    other.serversImported == serversImported &&
    other.totpSecretsImported == totpSecretsImported &&
    other.usersImported == usersImported;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (permissionsImported.hashCode) +
    (rolesImported.hashCode) +
    (serversImported.hashCode) +
    (totpSecretsImported.hashCode) +
    (usersImported.hashCode);

  @override
  String toString() => 'ImportSummary[permissionsImported=$permissionsImported, rolesImported=$rolesImported, serversImported=$serversImported, totpSecretsImported=$totpSecretsImported, usersImported=$usersImported]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'permissions_imported'] = this.permissionsImported;
      json[r'roles_imported'] = this.rolesImported;
      json[r'servers_imported'] = this.serversImported;
      json[r'totp_secrets_imported'] = this.totpSecretsImported;
      json[r'users_imported'] = this.usersImported;
    return json;
  }

  /// Returns a new [ImportSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImportSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ImportSummary[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ImportSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImportSummary(
        permissionsImported: mapValueOfType<int>(json, r'permissions_imported')!,
        rolesImported: mapValueOfType<int>(json, r'roles_imported')!,
        serversImported: mapValueOfType<int>(json, r'servers_imported')!,
        totpSecretsImported: mapValueOfType<int>(json, r'totp_secrets_imported')!,
        usersImported: mapValueOfType<int>(json, r'users_imported')!,
      );
    }
    return null;
  }

  static List<ImportSummary> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ImportSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImportSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImportSummary> mapFromJson(dynamic json) {
    final map = <String, ImportSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ImportSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImportSummary-objects as value to a dart map
  static Map<String, List<ImportSummary>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ImportSummary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImportSummary.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'permissions_imported',
    'roles_imported',
    'servers_imported',
    'totp_secrets_imported',
    'users_imported',
  };
}

