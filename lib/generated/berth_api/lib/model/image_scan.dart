//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImageScan {
  /// Returns a new [ImageScan] instance.
  ImageScan({
    required this.agentScanId,
    this.completedAt,
    required this.createdAt,
    required this.deletedAt,
    this.errorMessage,
    required this.id,
    this.lastPollError,
    this.lastPolledAt,
    required this.pollFailures,
    required this.scannedImages,
    this.scopes = const [],
    required this.serverId,
    this.serviceFilter,
    required this.stackName,
    required this.startedAt,
    required this.status,
    required this.totalImages,
    required this.updatedAt,
    this.vulnerabilities = const [],
  });

  String agentScanId;

  DateTime? completedAt;

  DateTime createdAt;

  DeletedAt deletedAt;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? errorMessage;

  /// Minimum value: 0
  int id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? lastPollError;

  DateTime? lastPolledAt;

  int pollFailures;

  int scannedImages;

  List<ScanScope> scopes;

  /// Minimum value: 0
  int serverId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? serviceFilter;

  String stackName;

  DateTime startedAt;

  String status;

  int totalImages;

  DateTime updatedAt;

  List<ImageVulnerability> vulnerabilities;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ImageScan &&
    other.agentScanId == agentScanId &&
    other.completedAt == completedAt &&
    other.createdAt == createdAt &&
    other.deletedAt == deletedAt &&
    other.errorMessage == errorMessage &&
    other.id == id &&
    other.lastPollError == lastPollError &&
    other.lastPolledAt == lastPolledAt &&
    other.pollFailures == pollFailures &&
    other.scannedImages == scannedImages &&
    _deepEquality.equals(other.scopes, scopes) &&
    other.serverId == serverId &&
    other.serviceFilter == serviceFilter &&
    other.stackName == stackName &&
    other.startedAt == startedAt &&
    other.status == status &&
    other.totalImages == totalImages &&
    other.updatedAt == updatedAt &&
    _deepEquality.equals(other.vulnerabilities, vulnerabilities);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (agentScanId.hashCode) +
    (completedAt == null ? 0 : completedAt!.hashCode) +
    (createdAt.hashCode) +
    (deletedAt.hashCode) +
    (errorMessage == null ? 0 : errorMessage!.hashCode) +
    (id.hashCode) +
    (lastPollError == null ? 0 : lastPollError!.hashCode) +
    (lastPolledAt == null ? 0 : lastPolledAt!.hashCode) +
    (pollFailures.hashCode) +
    (scannedImages.hashCode) +
    (scopes.hashCode) +
    (serverId.hashCode) +
    (serviceFilter == null ? 0 : serviceFilter!.hashCode) +
    (stackName.hashCode) +
    (startedAt.hashCode) +
    (status.hashCode) +
    (totalImages.hashCode) +
    (updatedAt.hashCode) +
    (vulnerabilities.hashCode);

  @override
  String toString() => 'ImageScan[agentScanId=$agentScanId, completedAt=$completedAt, createdAt=$createdAt, deletedAt=$deletedAt, errorMessage=$errorMessage, id=$id, lastPollError=$lastPollError, lastPolledAt=$lastPolledAt, pollFailures=$pollFailures, scannedImages=$scannedImages, scopes=$scopes, serverId=$serverId, serviceFilter=$serviceFilter, stackName=$stackName, startedAt=$startedAt, status=$status, totalImages=$totalImages, updatedAt=$updatedAt, vulnerabilities=$vulnerabilities]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'agent_scan_id'] = this.agentScanId;
    if (this.completedAt != null) {
      json[r'completed_at'] = this.completedAt!.toUtc().toIso8601String();
    } else {
      json[r'completed_at'] = null;
    }
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'deleted_at'] = this.deletedAt;
    if (this.errorMessage != null) {
      json[r'error_message'] = this.errorMessage;
    } else {
      json[r'error_message'] = null;
    }
      json[r'id'] = this.id;
    if (this.lastPollError != null) {
      json[r'last_poll_error'] = this.lastPollError;
    } else {
      json[r'last_poll_error'] = null;
    }
    if (this.lastPolledAt != null) {
      json[r'last_polled_at'] = this.lastPolledAt!.toUtc().toIso8601String();
    } else {
      json[r'last_polled_at'] = null;
    }
      json[r'poll_failures'] = this.pollFailures;
      json[r'scanned_images'] = this.scannedImages;
      json[r'scopes'] = this.scopes;
      json[r'server_id'] = this.serverId;
    if (this.serviceFilter != null) {
      json[r'service_filter'] = this.serviceFilter;
    } else {
      json[r'service_filter'] = null;
    }
      json[r'stack_name'] = this.stackName;
      json[r'started_at'] = this.startedAt.toUtc().toIso8601String();
      json[r'status'] = this.status;
      json[r'total_images'] = this.totalImages;
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
      json[r'vulnerabilities'] = this.vulnerabilities;
    return json;
  }

  /// Returns a new [ImageScan] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImageScan? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ImageScan[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ImageScan[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImageScan(
        agentScanId: mapValueOfType<String>(json, r'agent_scan_id')!,
        completedAt: mapDateTime(json, r'completed_at', r''),
        createdAt: mapDateTime(json, r'created_at', r'')!,
        deletedAt: DeletedAt.fromJson(json[r'deleted_at'])!,
        errorMessage: mapValueOfType<String>(json, r'error_message'),
        id: mapValueOfType<int>(json, r'id')!,
        lastPollError: mapValueOfType<String>(json, r'last_poll_error'),
        lastPolledAt: mapDateTime(json, r'last_polled_at', r''),
        pollFailures: mapValueOfType<int>(json, r'poll_failures')!,
        scannedImages: mapValueOfType<int>(json, r'scanned_images')!,
        scopes: ScanScope.listFromJson(json[r'scopes']),
        serverId: mapValueOfType<int>(json, r'server_id')!,
        serviceFilter: mapValueOfType<String>(json, r'service_filter'),
        stackName: mapValueOfType<String>(json, r'stack_name')!,
        startedAt: mapDateTime(json, r'started_at', r'')!,
        status: mapValueOfType<String>(json, r'status')!,
        totalImages: mapValueOfType<int>(json, r'total_images')!,
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
        vulnerabilities: ImageVulnerability.listFromJson(json[r'vulnerabilities']),
      );
    }
    return null;
  }

  static List<ImageScan> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ImageScan>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageScan.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImageScan> mapFromJson(dynamic json) {
    final map = <String, ImageScan>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ImageScan.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImageScan-objects as value to a dart map
  static Map<String, List<ImageScan>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ImageScan>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImageScan.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'agent_scan_id',
    'created_at',
    'deleted_at',
    'id',
    'poll_failures',
    'scanned_images',
    'server_id',
    'stack_name',
    'started_at',
    'status',
    'total_images',
    'updated_at',
  };
}

