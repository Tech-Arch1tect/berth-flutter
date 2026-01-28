//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DeployConfig {
  /// Returns a new [DeployConfig] instance.
  DeployConfig({
    this.mode,
    this.placement,
    this.replicas,
    this.resources,
    this.restartPolicy,
    this.rollbackConfig,
    this.updateConfig,
  });

  String? mode;

  PlacementConfig? placement;

  int? replicas;

  ResourcesConfig? resources;

  RestartPolicyConfig? restartPolicy;

  UpdateRollbackConfig? rollbackConfig;

  UpdateRollbackConfig? updateConfig;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DeployConfig &&
    other.mode == mode &&
    other.placement == placement &&
    other.replicas == replicas &&
    other.resources == resources &&
    other.restartPolicy == restartPolicy &&
    other.rollbackConfig == rollbackConfig &&
    other.updateConfig == updateConfig;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (mode == null ? 0 : mode!.hashCode) +
    (placement == null ? 0 : placement!.hashCode) +
    (replicas == null ? 0 : replicas!.hashCode) +
    (resources == null ? 0 : resources!.hashCode) +
    (restartPolicy == null ? 0 : restartPolicy!.hashCode) +
    (rollbackConfig == null ? 0 : rollbackConfig!.hashCode) +
    (updateConfig == null ? 0 : updateConfig!.hashCode);

  @override
  String toString() => 'DeployConfig[mode=$mode, placement=$placement, replicas=$replicas, resources=$resources, restartPolicy=$restartPolicy, rollbackConfig=$rollbackConfig, updateConfig=$updateConfig]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.mode != null) {
      json[r'mode'] = this.mode;
    } else {
      json[r'mode'] = null;
    }
    if (this.placement != null) {
      json[r'placement'] = this.placement;
    } else {
      json[r'placement'] = null;
    }
    if (this.replicas != null) {
      json[r'replicas'] = this.replicas;
    } else {
      json[r'replicas'] = null;
    }
    if (this.resources != null) {
      json[r'resources'] = this.resources;
    } else {
      json[r'resources'] = null;
    }
    if (this.restartPolicy != null) {
      json[r'restart_policy'] = this.restartPolicy;
    } else {
      json[r'restart_policy'] = null;
    }
    if (this.rollbackConfig != null) {
      json[r'rollback_config'] = this.rollbackConfig;
    } else {
      json[r'rollback_config'] = null;
    }
    if (this.updateConfig != null) {
      json[r'update_config'] = this.updateConfig;
    } else {
      json[r'update_config'] = null;
    }
    return json;
  }

  /// Returns a new [DeployConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DeployConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "DeployConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "DeployConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return DeployConfig(
        mode: mapValueOfType<String>(json, r'mode'),
        placement: PlacementConfig.fromJson(json[r'placement']),
        replicas: mapValueOfType<int>(json, r'replicas'),
        resources: ResourcesConfig.fromJson(json[r'resources']),
        restartPolicy: RestartPolicyConfig.fromJson(json[r'restart_policy']),
        rollbackConfig: UpdateRollbackConfig.fromJson(json[r'rollback_config']),
        updateConfig: UpdateRollbackConfig.fromJson(json[r'update_config']),
      );
    }
    return null;
  }

  static List<DeployConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DeployConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DeployConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DeployConfig> mapFromJson(dynamic json) {
    final map = <String, DeployConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DeployConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DeployConfig-objects as value to a dart map
  static Map<String, List<DeployConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DeployConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DeployConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

