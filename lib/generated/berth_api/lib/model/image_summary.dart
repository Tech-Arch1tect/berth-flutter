//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImageSummary {
  /// Returns a new [ImageSummary] instance.
  ImageSummary({
    required this.danglingCount,
    required this.danglingSize,
    this.images = const [],
    required this.totalCount,
    required this.totalSize,
    required this.unusedCount,
    required this.unusedSize,
  });

  int danglingCount;

  int danglingSize;

  List<ImageInfo> images;

  int totalCount;

  int totalSize;

  int unusedCount;

  int unusedSize;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ImageSummary &&
    other.danglingCount == danglingCount &&
    other.danglingSize == danglingSize &&
    _deepEquality.equals(other.images, images) &&
    other.totalCount == totalCount &&
    other.totalSize == totalSize &&
    other.unusedCount == unusedCount &&
    other.unusedSize == unusedSize;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (danglingCount.hashCode) +
    (danglingSize.hashCode) +
    (images.hashCode) +
    (totalCount.hashCode) +
    (totalSize.hashCode) +
    (unusedCount.hashCode) +
    (unusedSize.hashCode);

  @override
  String toString() => 'ImageSummary[danglingCount=$danglingCount, danglingSize=$danglingSize, images=$images, totalCount=$totalCount, totalSize=$totalSize, unusedCount=$unusedCount, unusedSize=$unusedSize]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'dangling_count'] = this.danglingCount;
      json[r'dangling_size'] = this.danglingSize;
      json[r'images'] = this.images;
      json[r'total_count'] = this.totalCount;
      json[r'total_size'] = this.totalSize;
      json[r'unused_count'] = this.unusedCount;
      json[r'unused_size'] = this.unusedSize;
    return json;
  }

  /// Returns a new [ImageSummary] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImageSummary? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ImageSummary[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ImageSummary[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImageSummary(
        danglingCount: mapValueOfType<int>(json, r'dangling_count')!,
        danglingSize: mapValueOfType<int>(json, r'dangling_size')!,
        images: ImageInfo.listFromJson(json[r'images']),
        totalCount: mapValueOfType<int>(json, r'total_count')!,
        totalSize: mapValueOfType<int>(json, r'total_size')!,
        unusedCount: mapValueOfType<int>(json, r'unused_count')!,
        unusedSize: mapValueOfType<int>(json, r'unused_size')!,
      );
    }
    return null;
  }

  static List<ImageSummary> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ImageSummary>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageSummary.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImageSummary> mapFromJson(dynamic json) {
    final map = <String, ImageSummary>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ImageSummary.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImageSummary-objects as value to a dart map
  static Map<String, List<ImageSummary>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ImageSummary>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImageSummary.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'dangling_count',
    'dangling_size',
    'images',
    'total_count',
    'total_size',
    'unused_count',
    'unused_size',
  };
}

