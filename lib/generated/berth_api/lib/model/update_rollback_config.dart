//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateRollbackConfig {
  /// Returns a new [UpdateRollbackConfig] instance.
  UpdateRollbackConfig({
    this.delay,
    this.failureAction,
    this.maxFailureRatio,
    this.monitor,
    this.order,
    this.parallelism,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? delay;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? failureAction;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  num? maxFailureRatio;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? monitor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? order;

  int? parallelism;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateRollbackConfig &&
    other.delay == delay &&
    other.failureAction == failureAction &&
    other.maxFailureRatio == maxFailureRatio &&
    other.monitor == monitor &&
    other.order == order &&
    other.parallelism == parallelism;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (delay == null ? 0 : delay!.hashCode) +
    (failureAction == null ? 0 : failureAction!.hashCode) +
    (maxFailureRatio == null ? 0 : maxFailureRatio!.hashCode) +
    (monitor == null ? 0 : monitor!.hashCode) +
    (order == null ? 0 : order!.hashCode) +
    (parallelism == null ? 0 : parallelism!.hashCode);

  @override
  String toString() => 'UpdateRollbackConfig[delay=$delay, failureAction=$failureAction, maxFailureRatio=$maxFailureRatio, monitor=$monitor, order=$order, parallelism=$parallelism]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.delay != null) {
      json[r'delay'] = this.delay;
    } else {
      json[r'delay'] = null;
    }
    if (this.failureAction != null) {
      json[r'failure_action'] = this.failureAction;
    } else {
      json[r'failure_action'] = null;
    }
    if (this.maxFailureRatio != null) {
      json[r'max_failure_ratio'] = this.maxFailureRatio;
    } else {
      json[r'max_failure_ratio'] = null;
    }
    if (this.monitor != null) {
      json[r'monitor'] = this.monitor;
    } else {
      json[r'monitor'] = null;
    }
    if (this.order != null) {
      json[r'order'] = this.order;
    } else {
      json[r'order'] = null;
    }
    if (this.parallelism != null) {
      json[r'parallelism'] = this.parallelism;
    } else {
      json[r'parallelism'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateRollbackConfig] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateRollbackConfig? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "UpdateRollbackConfig[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "UpdateRollbackConfig[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return UpdateRollbackConfig(
        delay: mapValueOfType<String>(json, r'delay'),
        failureAction: mapValueOfType<String>(json, r'failure_action'),
        maxFailureRatio: num.parse('${json[r'max_failure_ratio']}'),
        monitor: mapValueOfType<String>(json, r'monitor'),
        order: mapValueOfType<String>(json, r'order'),
        parallelism: mapValueOfType<int>(json, r'parallelism'),
      );
    }
    return null;
  }

  static List<UpdateRollbackConfig> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateRollbackConfig>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateRollbackConfig.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateRollbackConfig> mapFromJson(dynamic json) {
    final map = <String, UpdateRollbackConfig>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateRollbackConfig.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateRollbackConfig-objects as value to a dart map
  static Map<String, List<UpdateRollbackConfig>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateRollbackConfig>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateRollbackConfig.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

