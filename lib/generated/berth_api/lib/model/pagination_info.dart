//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PaginationInfo {
  /// Returns a new [PaginationInfo] instance.
  PaginationInfo({
    required this.currentPage,
    required this.hasNext,
    required this.hasPrev,
    required this.pageSize,
    required this.total,
    required this.totalPages,
  });

  int currentPage;

  bool hasNext;

  bool hasPrev;

  int pageSize;

  int total;

  int totalPages;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PaginationInfo &&
    other.currentPage == currentPage &&
    other.hasNext == hasNext &&
    other.hasPrev == hasPrev &&
    other.pageSize == pageSize &&
    other.total == total &&
    other.totalPages == totalPages;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (currentPage.hashCode) +
    (hasNext.hashCode) +
    (hasPrev.hashCode) +
    (pageSize.hashCode) +
    (total.hashCode) +
    (totalPages.hashCode);

  @override
  String toString() => 'PaginationInfo[currentPage=$currentPage, hasNext=$hasNext, hasPrev=$hasPrev, pageSize=$pageSize, total=$total, totalPages=$totalPages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'current_page'] = this.currentPage;
      json[r'has_next'] = this.hasNext;
      json[r'has_prev'] = this.hasPrev;
      json[r'page_size'] = this.pageSize;
      json[r'total'] = this.total;
      json[r'total_pages'] = this.totalPages;
    return json;
  }

  /// Returns a new [PaginationInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PaginationInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "PaginationInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "PaginationInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return PaginationInfo(
        currentPage: mapValueOfType<int>(json, r'current_page')!,
        hasNext: mapValueOfType<bool>(json, r'has_next')!,
        hasPrev: mapValueOfType<bool>(json, r'has_prev')!,
        pageSize: mapValueOfType<int>(json, r'page_size')!,
        total: mapValueOfType<int>(json, r'total')!,
        totalPages: mapValueOfType<int>(json, r'total_pages')!,
      );
    }
    return null;
  }

  static List<PaginationInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PaginationInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PaginationInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PaginationInfo> mapFromJson(dynamic json) {
    final map = <String, PaginationInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PaginationInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PaginationInfo-objects as value to a dart map
  static Map<String, List<PaginationInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PaginationInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PaginationInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'current_page',
    'has_next',
    'has_prev',
    'page_size',
    'total',
    'total_pages',
  };
}

