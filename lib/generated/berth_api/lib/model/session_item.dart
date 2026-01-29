//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SessionItem {
  /// Returns a new [SessionItem] instance.
  SessionItem({
    required this.bot,
    required this.browser,
    required this.createdAt,
    required this.current,
    required this.desktop,
    required this.device,
    required this.deviceType,
    required this.expiresAt,
    required this.id,
    required this.ipAddress,
    required this.lastUsed,
    required this.location,
    required this.mobile,
    required this.os,
    required this.tablet,
    required this.token,
    required this.type,
    required this.userAgent,
    required this.userId,
  });

  bool bot;

  String browser;

  DateTime createdAt;

  bool current;

  bool desktop;

  String device;

  String deviceType;

  DateTime expiresAt;

  /// Minimum value: 0
  int id;

  String ipAddress;

  DateTime lastUsed;

  String location;

  bool mobile;

  String os;

  bool tablet;

  String token;

  String type;

  String userAgent;

  /// Minimum value: 0
  int userId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SessionItem &&
    other.bot == bot &&
    other.browser == browser &&
    other.createdAt == createdAt &&
    other.current == current &&
    other.desktop == desktop &&
    other.device == device &&
    other.deviceType == deviceType &&
    other.expiresAt == expiresAt &&
    other.id == id &&
    other.ipAddress == ipAddress &&
    other.lastUsed == lastUsed &&
    other.location == location &&
    other.mobile == mobile &&
    other.os == os &&
    other.tablet == tablet &&
    other.token == token &&
    other.type == type &&
    other.userAgent == userAgent &&
    other.userId == userId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bot.hashCode) +
    (browser.hashCode) +
    (createdAt.hashCode) +
    (current.hashCode) +
    (desktop.hashCode) +
    (device.hashCode) +
    (deviceType.hashCode) +
    (expiresAt.hashCode) +
    (id.hashCode) +
    (ipAddress.hashCode) +
    (lastUsed.hashCode) +
    (location.hashCode) +
    (mobile.hashCode) +
    (os.hashCode) +
    (tablet.hashCode) +
    (token.hashCode) +
    (type.hashCode) +
    (userAgent.hashCode) +
    (userId.hashCode);

  @override
  String toString() => 'SessionItem[bot=$bot, browser=$browser, createdAt=$createdAt, current=$current, desktop=$desktop, device=$device, deviceType=$deviceType, expiresAt=$expiresAt, id=$id, ipAddress=$ipAddress, lastUsed=$lastUsed, location=$location, mobile=$mobile, os=$os, tablet=$tablet, token=$token, type=$type, userAgent=$userAgent, userId=$userId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'bot'] = this.bot;
      json[r'browser'] = this.browser;
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'current'] = this.current;
      json[r'desktop'] = this.desktop;
      json[r'device'] = this.device;
      json[r'device_type'] = this.deviceType;
      json[r'expires_at'] = this.expiresAt.toUtc().toIso8601String();
      json[r'id'] = this.id;
      json[r'ip_address'] = this.ipAddress;
      json[r'last_used'] = this.lastUsed.toUtc().toIso8601String();
      json[r'location'] = this.location;
      json[r'mobile'] = this.mobile;
      json[r'os'] = this.os;
      json[r'tablet'] = this.tablet;
      json[r'token'] = this.token;
      json[r'type'] = this.type;
      json[r'user_agent'] = this.userAgent;
      json[r'user_id'] = this.userId;
    return json;
  }

  /// Returns a new [SessionItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SessionItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SessionItem[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SessionItem[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SessionItem(
        bot: mapValueOfType<bool>(json, r'bot')!,
        browser: mapValueOfType<String>(json, r'browser')!,
        createdAt: mapDateTime(json, r'created_at', r'')!,
        current: mapValueOfType<bool>(json, r'current')!,
        desktop: mapValueOfType<bool>(json, r'desktop')!,
        device: mapValueOfType<String>(json, r'device')!,
        deviceType: mapValueOfType<String>(json, r'device_type')!,
        expiresAt: mapDateTime(json, r'expires_at', r'')!,
        id: mapValueOfType<int>(json, r'id')!,
        ipAddress: mapValueOfType<String>(json, r'ip_address')!,
        lastUsed: mapDateTime(json, r'last_used', r'')!,
        location: mapValueOfType<String>(json, r'location')!,
        mobile: mapValueOfType<bool>(json, r'mobile')!,
        os: mapValueOfType<String>(json, r'os')!,
        tablet: mapValueOfType<bool>(json, r'tablet')!,
        token: mapValueOfType<String>(json, r'token')!,
        type: mapValueOfType<String>(json, r'type')!,
        userAgent: mapValueOfType<String>(json, r'user_agent')!,
        userId: mapValueOfType<int>(json, r'user_id')!,
      );
    }
    return null;
  }

  static List<SessionItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SessionItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SessionItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SessionItem> mapFromJson(dynamic json) {
    final map = <String, SessionItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SessionItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SessionItem-objects as value to a dart map
  static Map<String, List<SessionItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SessionItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SessionItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'bot',
    'browser',
    'created_at',
    'current',
    'desktop',
    'device',
    'device_type',
    'expires_at',
    'id',
    'ip_address',
    'last_used',
    'location',
    'mobile',
    'os',
    'tablet',
    'token',
    'type',
    'user_agent',
    'user_id',
  };
}

