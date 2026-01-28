//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImageUpdate {
  /// Returns a new [ImageUpdate] instance.
  ImageUpdate({
    required this.checkError,
    required this.containerName,
    required this.createdAt,
    required this.currentImageName,
    required this.currentRepoDigest,
    required this.id,
    required this.lastCheckedAt,
    required this.latestRepoDigest,
    required this.serverId,
    required this.stackName,
    required this.updateAvailable,
    required this.updatedAt,
  });

  String checkError;

  String containerName;

  DateTime createdAt;

  String currentImageName;

  String currentRepoDigest;

  /// Minimum value: 0
  int id;

  DateTime? lastCheckedAt;

  String latestRepoDigest;

  /// Minimum value: 0
  int serverId;

  String stackName;

  bool updateAvailable;

  DateTime updatedAt;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ImageUpdate &&
    other.checkError == checkError &&
    other.containerName == containerName &&
    other.createdAt == createdAt &&
    other.currentImageName == currentImageName &&
    other.currentRepoDigest == currentRepoDigest &&
    other.id == id &&
    other.lastCheckedAt == lastCheckedAt &&
    other.latestRepoDigest == latestRepoDigest &&
    other.serverId == serverId &&
    other.stackName == stackName &&
    other.updateAvailable == updateAvailable &&
    other.updatedAt == updatedAt;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (checkError.hashCode) +
    (containerName.hashCode) +
    (createdAt.hashCode) +
    (currentImageName.hashCode) +
    (currentRepoDigest.hashCode) +
    (id.hashCode) +
    (lastCheckedAt == null ? 0 : lastCheckedAt!.hashCode) +
    (latestRepoDigest.hashCode) +
    (serverId.hashCode) +
    (stackName.hashCode) +
    (updateAvailable.hashCode) +
    (updatedAt.hashCode);

  @override
  String toString() => 'ImageUpdate[checkError=$checkError, containerName=$containerName, createdAt=$createdAt, currentImageName=$currentImageName, currentRepoDigest=$currentRepoDigest, id=$id, lastCheckedAt=$lastCheckedAt, latestRepoDigest=$latestRepoDigest, serverId=$serverId, stackName=$stackName, updateAvailable=$updateAvailable, updatedAt=$updatedAt]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'check_error'] = this.checkError;
      json[r'container_name'] = this.containerName;
      json[r'created_at'] = this.createdAt.toUtc().toIso8601String();
      json[r'current_image_name'] = this.currentImageName;
      json[r'current_repo_digest'] = this.currentRepoDigest;
      json[r'id'] = this.id;
    if (this.lastCheckedAt != null) {
      json[r'last_checked_at'] = this.lastCheckedAt!.toUtc().toIso8601String();
    } else {
      json[r'last_checked_at'] = null;
    }
      json[r'latest_repo_digest'] = this.latestRepoDigest;
      json[r'server_id'] = this.serverId;
      json[r'stack_name'] = this.stackName;
      json[r'update_available'] = this.updateAvailable;
      json[r'updated_at'] = this.updatedAt.toUtc().toIso8601String();
    return json;
  }

  /// Returns a new [ImageUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImageUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ImageUpdate[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ImageUpdate[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImageUpdate(
        checkError: mapValueOfType<String>(json, r'check_error')!,
        containerName: mapValueOfType<String>(json, r'container_name')!,
        createdAt: mapDateTime(json, r'created_at', r'')!,
        currentImageName: mapValueOfType<String>(json, r'current_image_name')!,
        currentRepoDigest: mapValueOfType<String>(json, r'current_repo_digest')!,
        id: mapValueOfType<int>(json, r'id')!,
        lastCheckedAt: mapDateTime(json, r'last_checked_at', r''),
        latestRepoDigest: mapValueOfType<String>(json, r'latest_repo_digest')!,
        serverId: mapValueOfType<int>(json, r'server_id')!,
        stackName: mapValueOfType<String>(json, r'stack_name')!,
        updateAvailable: mapValueOfType<bool>(json, r'update_available')!,
        updatedAt: mapDateTime(json, r'updated_at', r'')!,
      );
    }
    return null;
  }

  static List<ImageUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ImageUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImageUpdate> mapFromJson(dynamic json) {
    final map = <String, ImageUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ImageUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImageUpdate-objects as value to a dart map
  static Map<String, List<ImageUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ImageUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImageUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'check_error',
    'container_name',
    'created_at',
    'current_image_name',
    'current_repo_digest',
    'id',
    'last_checked_at',
    'latest_repo_digest',
    'server_id',
    'stack_name',
    'update_available',
    'updated_at',
  };
}

