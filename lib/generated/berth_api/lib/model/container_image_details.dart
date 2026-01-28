//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContainerImageDetails {
  /// Returns a new [ContainerImageDetails] instance.
  ContainerImageDetails({
    required this.containerName,
    this.imageHistory = const [],
    required this.imageId,
    required this.imageInfo,
    required this.imageName,
  });

  String containerName;

  List<ImageHistoryLayer> imageHistory;

  String imageId;

  ImageInspectInfo imageInfo;

  String imageName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContainerImageDetails &&
    other.containerName == containerName &&
    _deepEquality.equals(other.imageHistory, imageHistory) &&
    other.imageId == imageId &&
    other.imageInfo == imageInfo &&
    other.imageName == imageName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (containerName.hashCode) +
    (imageHistory.hashCode) +
    (imageId.hashCode) +
    (imageInfo.hashCode) +
    (imageName.hashCode);

  @override
  String toString() => 'ContainerImageDetails[containerName=$containerName, imageHistory=$imageHistory, imageId=$imageId, imageInfo=$imageInfo, imageName=$imageName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'container_name'] = this.containerName;
      json[r'image_history'] = this.imageHistory;
      json[r'image_id'] = this.imageId;
      json[r'image_info'] = this.imageInfo;
      json[r'image_name'] = this.imageName;
    return json;
  }

  /// Returns a new [ContainerImageDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContainerImageDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContainerImageDetails[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContainerImageDetails[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContainerImageDetails(
        containerName: mapValueOfType<String>(json, r'container_name')!,
        imageHistory: ImageHistoryLayer.listFromJson(json[r'image_history']),
        imageId: mapValueOfType<String>(json, r'image_id')!,
        imageInfo: ImageInspectInfo.fromJson(json[r'image_info'])!,
        imageName: mapValueOfType<String>(json, r'image_name')!,
      );
    }
    return null;
  }

  static List<ContainerImageDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContainerImageDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContainerImageDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContainerImageDetails> mapFromJson(dynamic json) {
    final map = <String, ContainerImageDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContainerImageDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContainerImageDetails-objects as value to a dart map
  static Map<String, List<ContainerImageDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContainerImageDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContainerImageDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'container_name',
    'image_history',
    'image_id',
    'image_info',
    'image_name',
  };
}

