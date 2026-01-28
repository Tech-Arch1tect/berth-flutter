//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EventTypeCountResponse {
  /// Returns a new [EventTypeCountResponse] instance.
  EventTypeCountResponse({
    required this.count,
    required this.eventType,
  });

  int count;

  String eventType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EventTypeCountResponse &&
    other.count == count &&
    other.eventType == eventType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (count.hashCode) +
    (eventType.hashCode);

  @override
  String toString() => 'EventTypeCountResponse[count=$count, eventType=$eventType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'count'] = this.count;
      json[r'event_type'] = this.eventType;
    return json;
  }

  /// Returns a new [EventTypeCountResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EventTypeCountResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "EventTypeCountResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "EventTypeCountResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return EventTypeCountResponse(
        count: mapValueOfType<int>(json, r'count')!,
        eventType: mapValueOfType<String>(json, r'event_type')!,
      );
    }
    return null;
  }

  static List<EventTypeCountResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EventTypeCountResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EventTypeCountResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EventTypeCountResponse> mapFromJson(dynamic json) {
    final map = <String, EventTypeCountResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EventTypeCountResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EventTypeCountResponse-objects as value to a dart map
  static Map<String, List<EventTypeCountResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EventTypeCountResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EventTypeCountResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'count',
    'event_type',
  };
}

