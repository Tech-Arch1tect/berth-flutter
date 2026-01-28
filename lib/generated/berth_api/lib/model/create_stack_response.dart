//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateStackResponse {
  /// Returns a new [CreateStackResponse] instance.
  CreateStackResponse({
    required this.message,
    required this.stack,
  });

  String message;

  Stack? stack;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateStackResponse &&
    other.message == message &&
    other.stack == stack;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (message.hashCode) +
    (stack == null ? 0 : stack!.hashCode);

  @override
  String toString() => 'CreateStackResponse[message=$message, stack=$stack]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'message'] = this.message;
    if (this.stack != null) {
      json[r'stack'] = this.stack;
    } else {
      json[r'stack'] = null;
    }
    return json;
  }

  /// Returns a new [CreateStackResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateStackResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "CreateStackResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "CreateStackResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return CreateStackResponse(
        message: mapValueOfType<String>(json, r'message')!,
        stack: Stack.fromJson(json[r'stack']),
      );
    }
    return null;
  }

  static List<CreateStackResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateStackResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateStackResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateStackResponse> mapFromJson(dynamic json) {
    final map = <String, CreateStackResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateStackResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateStackResponse-objects as value to a dart map
  static Map<String, List<CreateStackResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateStackResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateStackResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'message',
    'stack',
  };
}

