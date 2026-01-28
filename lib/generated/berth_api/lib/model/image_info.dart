//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImageInfo {
  /// Returns a new [ImageInfo] instance.
  ImageInfo({
    required this.created,
    required this.dangling,
    required this.id,
    required this.repository,
    required this.size,
    required this.tag,
    required this.unused,
  });

  DateTime created;

  bool dangling;

  String id;

  String repository;

  int size;

  String tag;

  bool unused;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ImageInfo &&
    other.created == created &&
    other.dangling == dangling &&
    other.id == id &&
    other.repository == repository &&
    other.size == size &&
    other.tag == tag &&
    other.unused == unused;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (created.hashCode) +
    (dangling.hashCode) +
    (id.hashCode) +
    (repository.hashCode) +
    (size.hashCode) +
    (tag.hashCode) +
    (unused.hashCode);

  @override
  String toString() => 'ImageInfo[created=$created, dangling=$dangling, id=$id, repository=$repository, size=$size, tag=$tag, unused=$unused]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'created'] = this.created.toUtc().toIso8601String();
      json[r'dangling'] = this.dangling;
      json[r'id'] = this.id;
      json[r'repository'] = this.repository;
      json[r'size'] = this.size;
      json[r'tag'] = this.tag;
      json[r'unused'] = this.unused;
    return json;
  }

  /// Returns a new [ImageInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImageInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ImageInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ImageInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImageInfo(
        created: mapDateTime(json, r'created', r'')!,
        dangling: mapValueOfType<bool>(json, r'dangling')!,
        id: mapValueOfType<String>(json, r'id')!,
        repository: mapValueOfType<String>(json, r'repository')!,
        size: mapValueOfType<int>(json, r'size')!,
        tag: mapValueOfType<String>(json, r'tag')!,
        unused: mapValueOfType<bool>(json, r'unused')!,
      );
    }
    return null;
  }

  static List<ImageInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ImageInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImageInfo> mapFromJson(dynamic json) {
    final map = <String, ImageInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ImageInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImageInfo-objects as value to a dart map
  static Map<String, List<ImageInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ImageInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImageInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created',
    'dangling',
    'id',
    'repository',
    'size',
    'tag',
    'unused',
  };
}

