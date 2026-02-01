//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatsResponseData {
  /// Returns a new [StatsResponseData] instance.
  StatsResponseData({
    this.eventsByCategory = const {},
    this.eventsBySeverity = const {},
    required this.eventsLast24Hours,
    required this.eventsLast7Days,
    required this.failedEvents,
    this.recentEventTypes = const [],
    required this.totalEvents,
  });

  Map<String, int> eventsByCategory;

  Map<String, int> eventsBySeverity;

  int eventsLast24Hours;

  int eventsLast7Days;

  int failedEvents;

  List<EventTypeCount> recentEventTypes;

  int totalEvents;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatsResponseData &&
    _deepEquality.equals(other.eventsByCategory, eventsByCategory) &&
    _deepEquality.equals(other.eventsBySeverity, eventsBySeverity) &&
    other.eventsLast24Hours == eventsLast24Hours &&
    other.eventsLast7Days == eventsLast7Days &&
    other.failedEvents == failedEvents &&
    _deepEquality.equals(other.recentEventTypes, recentEventTypes) &&
    other.totalEvents == totalEvents;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (eventsByCategory.hashCode) +
    (eventsBySeverity.hashCode) +
    (eventsLast24Hours.hashCode) +
    (eventsLast7Days.hashCode) +
    (failedEvents.hashCode) +
    (recentEventTypes.hashCode) +
    (totalEvents.hashCode);

  @override
  String toString() => 'StatsResponseData[eventsByCategory=$eventsByCategory, eventsBySeverity=$eventsBySeverity, eventsLast24Hours=$eventsLast24Hours, eventsLast7Days=$eventsLast7Days, failedEvents=$failedEvents, recentEventTypes=$recentEventTypes, totalEvents=$totalEvents]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'events_by_category'] = this.eventsByCategory;
      json[r'events_by_severity'] = this.eventsBySeverity;
      json[r'events_last_24_hours'] = this.eventsLast24Hours;
      json[r'events_last_7_days'] = this.eventsLast7Days;
      json[r'failed_events'] = this.failedEvents;
      json[r'recent_event_types'] = this.recentEventTypes;
      json[r'total_events'] = this.totalEvents;
    return json;
  }

  /// Returns a new [StatsResponseData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatsResponseData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "StatsResponseData[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "StatsResponseData[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return StatsResponseData(
        eventsByCategory: mapCastOfType<String, int>(json, r'events_by_category')!,
        eventsBySeverity: mapCastOfType<String, int>(json, r'events_by_severity')!,
        eventsLast24Hours: mapValueOfType<int>(json, r'events_last_24_hours')!,
        eventsLast7Days: mapValueOfType<int>(json, r'events_last_7_days')!,
        failedEvents: mapValueOfType<int>(json, r'failed_events')!,
        recentEventTypes: EventTypeCount.listFromJson(json[r'recent_event_types']),
        totalEvents: mapValueOfType<int>(json, r'total_events')!,
      );
    }
    return null;
  }

  static List<StatsResponseData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatsResponseData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatsResponseData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatsResponseData> mapFromJson(dynamic json) {
    final map = <String, StatsResponseData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatsResponseData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatsResponseData-objects as value to a dart map
  static Map<String, List<StatsResponseData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatsResponseData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatsResponseData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'events_by_category',
    'events_by_severity',
    'events_last_24_hours',
    'events_last_7_days',
    'failed_events',
    'recent_event_types',
    'total_events',
  };
}

