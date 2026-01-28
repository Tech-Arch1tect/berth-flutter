//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImageHistoryLayer {
  /// Returns a new [ImageHistoryLayer] instance.
  ImageHistoryLayer({
    this.comment,
    required this.created,
    required this.createdBy,
    required this.id,
    required this.size,
    this.tags = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? comment;

  int created;

  String createdBy;

  String id;

  int size;

  List<String> tags;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ImageHistoryLayer &&
    other.comment == comment &&
    other.created == created &&
    other.createdBy == createdBy &&
    other.id == id &&
    other.size == size &&
    _deepEquality.equals(other.tags, tags);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (comment == null ? 0 : comment!.hashCode) +
    (created.hashCode) +
    (createdBy.hashCode) +
    (id.hashCode) +
    (size.hashCode) +
    (tags.hashCode);

  @override
  String toString() => 'ImageHistoryLayer[comment=$comment, created=$created, createdBy=$createdBy, id=$id, size=$size, tags=$tags]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.comment != null) {
      json[r'comment'] = this.comment;
    } else {
      json[r'comment'] = null;
    }
      json[r'created'] = this.created;
      json[r'created_by'] = this.createdBy;
      json[r'id'] = this.id;
      json[r'size'] = this.size;
      json[r'tags'] = this.tags;
    return json;
  }

  /// Returns a new [ImageHistoryLayer] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImageHistoryLayer? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ImageHistoryLayer[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ImageHistoryLayer[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImageHistoryLayer(
        comment: mapValueOfType<String>(json, r'comment'),
        created: mapValueOfType<int>(json, r'created')!,
        createdBy: mapValueOfType<String>(json, r'created_by')!,
        id: mapValueOfType<String>(json, r'id')!,
        size: mapValueOfType<int>(json, r'size')!,
        tags: json[r'tags'] is Iterable
            ? (json[r'tags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ImageHistoryLayer> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ImageHistoryLayer>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageHistoryLayer.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImageHistoryLayer> mapFromJson(dynamic json) {
    final map = <String, ImageHistoryLayer>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ImageHistoryLayer.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImageHistoryLayer-objects as value to a dart map
  static Map<String, List<ImageHistoryLayer>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ImageHistoryLayer>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImageHistoryLayer.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'created',
    'created_by',
    'id',
    'size',
  };
}

