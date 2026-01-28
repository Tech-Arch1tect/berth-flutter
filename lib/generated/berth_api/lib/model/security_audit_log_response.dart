//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecurityAuditLogResponse {
  /// Returns a new [SecurityAuditLogResponse] instance.
  SecurityAuditLogResponse({
    required this.actorIp,
    required this.actorUserAgent,
    required this.actorUserId,
    required this.actorUsername,
    required this.createdAt,
    required this.eventCategory,
    required this.eventType,
    required this.failureReason,
    required this.id,
    required this.metadata,
    required this.serverId,
    required this.sessionId,
    required this.severity,
    required this.stackName,
    required this.success,
    required this.targetId,
    required this.targetName,
    required this.targetType,
    required this.targetUserId,
    required this.updatedAt,
  });

  String actorIp;

  String actorUserAgent;

  /// Minimum value: 0
  int? actorUserId;

  String actorUsername;

  DateTime createdAt;

  String eventCategory;

  String eventType;

  String failureReason;

  /// Minimum value: 0
  int id;

  String metadata;

  /// Minimum value: 0
  int? serverId;

  String sessionId;

  String severity;

  String stackName;

  bool success;

  /// Minimum value: 0
  int? targetId;

  String targetName;

  String targetType;

  /// Minimum value: 0
  int? targetUserId;

  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SecurityAuditLogResponse &&
    other.actorIp == actorIp &&
    other.actorUserAgent == actorUserAgent &&
    other.actorUserId == actorUserId &&
    other.actorUsername == actorUsername &&
    other.createdAt == createdAt &&
    other.eventCategory == eventCategory &&
    other.eventType == eventType &&
    other.failureReason == failureReason &&
    other.id == id &&
    other.metadata == metadata &&
    other.serverId == serverId &&
    other.sessionId == sessionId &&
    other.severity == severity &&
    other.stackName == stackName &&
    other.success == success &&
    other.targetId == targetId &&
    other.targetName == targetName &&
    other.targetType == targetType &&
    other.targetUserId == targetUserId &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (actorIp.hashCode) +
    (actorUserAgent.hashCode) +
    (actorUserId == null ? 0 : actorUserId!.hashCode) +
    (actorUsername.hashCode) +
    (createdAt.hashCode) +
    (eventCategory.hashCode) +
    (eventType.hashCode) +
    (failureReason.hashCode) +
    (id.hashCode) +
    (metadata.hashCode) +
    (serverId == null ? 0 : serverId!.hashCode) +
    (sessionId.hashCode) +
    (severity.hashCode) +
    (stackName.hashCode) +
    (success.hashCode) +
    (targetId == null ? 0 : targetId!.hashCode) +
    (targetName.hashCode) +
    (targetType.hashCode) +
    (targetUserId == null ? 0 : targetUserId!.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'SecurityAuditLogResponse[actorIp=$actorIp, actorUserAgent=$actorUserAgent, actorUserId=$actorUserId, actorUsername=$actorUsername, createdAt=$createdAt, eventCategory=$eventCategory, eventType=$eventType, failureReason=$failureReason, id=$id, metadata=$metadata, serverId=$serverId, sessionId=$sessionId, severity=$severity, stackName=$stackName, success=$success, targetId=$targetId, targetName=$targetName, targetType=$targetType, targetUserId=$targetUserId, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'actor_ip'] = this.actorIp;
      json[r'actor_user_agent'] = this.actorUserAgent;
    if (this.actorUserId != null) {
      json[r'actor_user_id'] = this.actorUserId;
    } else {
      json[r'actor_user_id'] = null;
    }
      json[r'actor_username'] = this.actorUsername;
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'event_category'] = this.eventCategory;
      json[r'event_type'] = this.eventType;
      json[r'failure_reason'] = this.failureReason;
      json[r'id'] = this.id;
      json[r'metadata'] = this.metadata;
    if (this.serverId != null) {
      json[r'server_id'] = this.serverId;
    } else {
      json[r'server_id'] = null;
    }
      json[r'session_id'] = this.sessionId;
      json[r'severity'] = this.severity;
      json[r'stack_name'] = this.stackName;
      json[r'success'] = this.success;
    if (this.targetId != null) {
      json[r'target_id'] = this.targetId;
    } else {
      json[r'target_id'] = null;
    }
      json[r'target_name'] = this.targetName;
      json[r'target_type'] = this.targetType;
    if (this.targetUserId != null) {
      json[r'target_user_id'] = this.targetUserId;
    } else {
      json[r'target_user_id'] = null;
    }
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [SecurityAuditLogResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SecurityAuditLogResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "SecurityAuditLogResponse[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "SecurityAuditLogResponse[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return SecurityAuditLogResponse(
        actorIp: mapValueOfType<String>(json, r'actor_ip')!,
        actorUserAgent: mapValueOfType<String>(json, r'actor_user_agent')!,
        actorUserId: mapValueOfType<int>(json, r'actor_user_id'),
        actorUsername: mapValueOfType<String>(json, r'actor_username')!,
        createdAt: mapDateTime(json, r'created_at', r'')!,
        eventCategory: mapValueOfType<String>(json, r'event_category')!,
        eventType: mapValueOfType<String>(json, r'event_type')!,
        failureReason: mapValueOfType<String>(json, r'failure_reason')!,
        id: mapValueOfType<int>(json, r'id')!,
        metadata: mapValueOfType<String>(json, r'metadata')!,
        serverId: mapValueOfType<int>(json, r'server_id'),
        sessionId: mapValueOfType<String>(json, r'session_id')!,
        severity: mapValueOfType<String>(json, r'severity')!,
        stackName: mapValueOfType<String>(json, r'stack_name')!,
        success: mapValueOfType<bool>(json, r'success')!,
        targetId: mapValueOfType<int>(json, r'target_id'),
        targetName: mapValueOfType<String>(json, r'target_name')!,
        targetType: mapValueOfType<String>(json, r'target_type')!,
        targetUserId: mapValueOfType<int>(json, r'target_user_id'),
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
      );
    }
    return null;
  }

  static List<SecurityAuditLogResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecurityAuditLogResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecurityAuditLogResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SecurityAuditLogResponse> mapFromJson(dynamic json) {
    final map = <String, SecurityAuditLogResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SecurityAuditLogResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SecurityAuditLogResponse-objects as value to a dart map
  static Map<String, List<SecurityAuditLogResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SecurityAuditLogResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SecurityAuditLogResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'actor_ip',
    'actor_user_agent',
    'actor_user_id',
    'actor_username',
    'created_at',
    'event_category',
    'event_type',
    'failure_reason',
    'id',
    'metadata',
    'server_id',
    'session_id',
    'severity',
    'stack_name',
    'success',
    'target_id',
    'target_name',
    'target_type',
    'target_user_id',
    'updated_at',
  };
}

