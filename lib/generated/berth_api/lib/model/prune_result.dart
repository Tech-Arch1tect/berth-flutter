//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PruneResult {
  /// Returns a new [PruneResult] instance.
  PruneResult({
    this.error,
    this.itemsDeleted = const [],
    required this.spaceReclaimed,
    required this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  List<String> itemsDeleted;

  int spaceReclaimed;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PruneResult &&
    other.error == error &&
    _deepEquality.equals(other.itemsDeleted, itemsDeleted) &&
    other.spaceReclaimed == spaceReclaimed &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (error == null ? 0 : error!.hashCode) +
    (itemsDeleted.hashCode) +
    (spaceReclaimed.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'PruneResult[error=$error, itemsDeleted=$itemsDeleted, spaceReclaimed=$spaceReclaimed, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
      json[r'items_deleted'] = this.itemsDeleted;
      json[r'space_reclaimed'] = this.spaceReclaimed;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [PruneResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PruneResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PruneResult[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PruneResult[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PruneResult(
        error: mapValueOfType<String>(json, r'error'),
        itemsDeleted: json[r'items_deleted'] is Iterable
            ? (json[r'items_deleted'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        spaceReclaimed: mapValueOfType<int>(json, r'space_reclaimed')!,
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<PruneResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PruneResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PruneResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PruneResult> mapFromJson(dynamic json) {
    final map = <String, PruneResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PruneResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PruneResult-objects as value to a dart map
  static Map<String, List<PruneResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PruneResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PruneResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'items_deleted',
    'space_reclaimed',
    'type',
  };
}

