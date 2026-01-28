//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ScanComparison {
  /// Returns a new [ScanComparison] instance.
  ScanComparison({
    this.baseOnlyImages = const [],
    required this.baseScan,
    this.commonImages = const [],
    this.compareOnlyImages = const [],
    required this.compareScan,
    this.fixedVulnerabilities = const [],
    this.newVulnerabilities = const [],
    required this.sameScope,
    required this.unchangedCount,
  });

  List<String> baseOnlyImages;

  ImageScan? baseScan;

  List<String> commonImages;

  List<String> compareOnlyImages;

  ImageScan? compareScan;

  List<ImageVulnerability> fixedVulnerabilities;

  List<ImageVulnerability> newVulnerabilities;

  bool sameScope;

  int unchangedCount;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ScanComparison &&
    _deepEquality.equals(other.baseOnlyImages, baseOnlyImages) &&
    other.baseScan == baseScan &&
    _deepEquality.equals(other.commonImages, commonImages) &&
    _deepEquality.equals(other.compareOnlyImages, compareOnlyImages) &&
    other.compareScan == compareScan &&
    _deepEquality.equals(other.fixedVulnerabilities, fixedVulnerabilities) &&
    _deepEquality.equals(other.newVulnerabilities, newVulnerabilities) &&
    other.sameScope == sameScope &&
    other.unchangedCount == unchangedCount;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (baseOnlyImages.hashCode) +
    (baseScan == null ? 0 : baseScan!.hashCode) +
    (commonImages.hashCode) +
    (compareOnlyImages.hashCode) +
    (compareScan == null ? 0 : compareScan!.hashCode) +
    (fixedVulnerabilities.hashCode) +
    (newVulnerabilities.hashCode) +
    (sameScope.hashCode) +
    (unchangedCount.hashCode);

  @override
  String toString() => 'ScanComparison[baseOnlyImages=$baseOnlyImages, baseScan=$baseScan, commonImages=$commonImages, compareOnlyImages=$compareOnlyImages, compareScan=$compareScan, fixedVulnerabilities=$fixedVulnerabilities, newVulnerabilities=$newVulnerabilities, sameScope=$sameScope, unchangedCount=$unchangedCount]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'base_only_images'] = this.baseOnlyImages;
    if (this.baseScan != null) {
      json[r'base_scan'] = this.baseScan;
    } else {
      json[r'base_scan'] = null;
    }
      json[r'common_images'] = this.commonImages;
      json[r'compare_only_images'] = this.compareOnlyImages;
    if (this.compareScan != null) {
      json[r'compare_scan'] = this.compareScan;
    } else {
      json[r'compare_scan'] = null;
    }
      json[r'fixed_vulnerabilities'] = this.fixedVulnerabilities;
      json[r'new_vulnerabilities'] = this.newVulnerabilities;
      json[r'same_scope'] = this.sameScope;
      json[r'unchanged_count'] = this.unchangedCount;
    return json;
  }

  /// Returns a new [ScanComparison] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ScanComparison? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ScanComparison[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ScanComparison[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ScanComparison(
        baseOnlyImages: json[r'base_only_images'] is Iterable
            ? (json[r'base_only_images'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        baseScan: ImageScan.fromJson(json[r'base_scan']),
        commonImages: json[r'common_images'] is Iterable
            ? (json[r'common_images'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        compareOnlyImages: json[r'compare_only_images'] is Iterable
            ? (json[r'compare_only_images'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        compareScan: ImageScan.fromJson(json[r'compare_scan']),
        fixedVulnerabilities: ImageVulnerability.listFromJson(json[r'fixed_vulnerabilities']),
        newVulnerabilities: ImageVulnerability.listFromJson(json[r'new_vulnerabilities']),
        sameScope: mapValueOfType<bool>(json, r'same_scope')!,
        unchangedCount: mapValueOfType<int>(json, r'unchanged_count')!,
      );
    }
    return null;
  }

  static List<ScanComparison> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ScanComparison>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ScanComparison.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ScanComparison> mapFromJson(dynamic json) {
    final map = <String, ScanComparison>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ScanComparison.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ScanComparison-objects as value to a dart map
  static Map<String, List<ScanComparison>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ScanComparison>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ScanComparison.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'base_only_images',
    'base_scan',
    'common_images',
    'compare_only_images',
    'compare_scan',
    'fixed_vulnerabilities',
    'new_vulnerabilities',
    'same_scope',
    'unchanged_count',
  };
}

