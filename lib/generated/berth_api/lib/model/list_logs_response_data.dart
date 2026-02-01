//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ListLogsResponseData {
  /// Returns a new [ListLogsResponseData] instance.
  ListLogsResponseData({
    this.logs = const [],
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
  });

  List<SecurityAuditLogInfo> logs;

  int page;

  int perPage;

  int total;

  int totalPages;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ListLogsResponseData &&
    _deepEquality.equals(other.logs, logs) &&
    other.page == page &&
    other.perPage == perPage &&
    other.total == total &&
    other.totalPages == totalPages;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (logs.hashCode) +
    (page.hashCode) +
    (perPage.hashCode) +
    (total.hashCode) +
    (totalPages.hashCode);

  @override
  String toString() => 'ListLogsResponseData[logs=$logs, page=$page, perPage=$perPage, total=$total, totalPages=$totalPages]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'logs'] = this.logs;
      json[r'page'] = this.page;
      json[r'per_page'] = this.perPage;
      json[r'total'] = this.total;
      json[r'total_pages'] = this.totalPages;
    return json;
  }

  /// Returns a new [ListLogsResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ListLogsResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ListLogsResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ListLogsResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ListLogsResponseData(
        logs: SecurityAuditLogInfo.listFromJson(json[r'logs']),
        page: mapValueOfType<int>(json, r'page')!,
        perPage: mapValueOfType<int>(json, r'per_page')!,
        total: mapValueOfType<int>(json, r'total')!,
        totalPages: mapValueOfType<int>(json, r'total_pages')!,
      );
    }
    return null;
  }

  static List<ListLogsResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ListLogsResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListLogsResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListLogsResponseData> mapFromJson(dynamic json) {
    final map = <String, ListLogsResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ListLogsResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListLogsResponseData-objects as value to a dart map
  static Map<String, List<ListLogsResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ListLogsResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListLogsResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'logs',
    'page',
    'per_page',
    'total',
    'total_pages',
  };
}

