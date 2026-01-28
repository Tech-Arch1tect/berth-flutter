//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ComposeChanges {
  /// Returns a new [ComposeChanges] instance.
  ComposeChanges({
    this.addServices = const {},
    this.configChanges = const {},
    this.deleteServices = const [],
    this.networkChanges = const {},
    this.renameServices = const {},
    this.secretChanges = const {},
    this.serviceChanges = const {},
    this.volumeChanges = const {},
  });

  Map<String, NewServiceConfig> addServices;

  Map<String, ConfigConfig> configChanges;

  List<String> deleteServices;

  Map<String, NetworkConfig> networkChanges;

  Map<String, String> renameServices;

  Map<String, SecretConfig> secretChanges;

  Map<String, ServiceChanges> serviceChanges;

  Map<String, VolumeConfig> volumeChanges;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ComposeChanges &&
    _deepEquality.equals(other.addServices, addServices) &&
    _deepEquality.equals(other.configChanges, configChanges) &&
    _deepEquality.equals(other.deleteServices, deleteServices) &&
    _deepEquality.equals(other.networkChanges, networkChanges) &&
    _deepEquality.equals(other.renameServices, renameServices) &&
    _deepEquality.equals(other.secretChanges, secretChanges) &&
    _deepEquality.equals(other.serviceChanges, serviceChanges) &&
    _deepEquality.equals(other.volumeChanges, volumeChanges);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (addServices.hashCode) +
    (configChanges.hashCode) +
    (deleteServices.hashCode) +
    (networkChanges.hashCode) +
    (renameServices.hashCode) +
    (secretChanges.hashCode) +
    (serviceChanges.hashCode) +
    (volumeChanges.hashCode);

  @override
  String toString() => 'ComposeChanges[addServices=$addServices, configChanges=$configChanges, deleteServices=$deleteServices, networkChanges=$networkChanges, renameServices=$renameServices, secretChanges=$secretChanges, serviceChanges=$serviceChanges, volumeChanges=$volumeChanges]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'add_services'] = this.addServices;
      json[r'config_changes'] = this.configChanges;
      json[r'delete_services'] = this.deleteServices;
      json[r'network_changes'] = this.networkChanges;
      json[r'rename_services'] = this.renameServices;
      json[r'secret_changes'] = this.secretChanges;
      json[r'service_changes'] = this.serviceChanges;
      json[r'volume_changes'] = this.volumeChanges;
    return json;
  }

  /// Returns a new [ComposeChanges] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ComposeChanges? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ComposeChanges[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ComposeChanges[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ComposeChanges(
        addServices: NewServiceConfig.mapFromJson(json[r'add_services']),
        configChanges: ConfigConfig.mapFromJson(json[r'config_changes']),
        deleteServices: json[r'delete_services'] is Iterable
            ? (json[r'delete_services'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        networkChanges: NetworkConfig.mapFromJson(json[r'network_changes']),
        renameServices: mapCastOfType<String, String>(json, r'rename_services') ?? const {},
        secretChanges: SecretConfig.mapFromJson(json[r'secret_changes']),
        serviceChanges: ServiceChanges.mapFromJson(json[r'service_changes']),
        volumeChanges: VolumeConfig.mapFromJson(json[r'volume_changes']),
      );
    }
    return null;
  }

  static List<ComposeChanges> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ComposeChanges>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ComposeChanges.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ComposeChanges> mapFromJson(dynamic json) {
    final map = <String, ComposeChanges>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ComposeChanges.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ComposeChanges-objects as value to a dart map
  static Map<String, List<ComposeChanges>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ComposeChanges>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ComposeChanges.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

