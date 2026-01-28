//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ImageInspectInfo {
  /// Returns a new [ImageInspectInfo] instance.
  ImageInspectInfo({
    required this.architecture,
    required this.author,
    required this.config,
    required this.created,
    required this.dockerVersion,
    required this.os,
    this.parent,
    this.repoDigests = const [],
    this.repoTags = const [],
    required this.rootfs,
    required this.size,
    required this.virtualSize,
  });

  String architecture;

  String author;

  ImageConfig config;

  String created;

  String dockerVersion;

  String os;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parent;

  List<String> repoDigests;

  List<String> repoTags;

  RootFS rootfs;

  int size;

  int virtualSize;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ImageInspectInfo &&
    other.architecture == architecture &&
    other.author == author &&
    other.config == config &&
    other.created == created &&
    other.dockerVersion == dockerVersion &&
    other.os == os &&
    other.parent == parent &&
    _deepEquality.equals(other.repoDigests, repoDigests) &&
    _deepEquality.equals(other.repoTags, repoTags) &&
    other.rootfs == rootfs &&
    other.size == size &&
    other.virtualSize == virtualSize;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (architecture.hashCode) +
    (author.hashCode) +
    (config.hashCode) +
    (created.hashCode) +
    (dockerVersion.hashCode) +
    (os.hashCode) +
    (parent == null ? 0 : parent!.hashCode) +
    (repoDigests.hashCode) +
    (repoTags.hashCode) +
    (rootfs.hashCode) +
    (size.hashCode) +
    (virtualSize.hashCode);

  @override
  String toString() => 'ImageInspectInfo[architecture=$architecture, author=$author, config=$config, created=$created, dockerVersion=$dockerVersion, os=$os, parent=$parent, repoDigests=$repoDigests, repoTags=$repoTags, rootfs=$rootfs, size=$size, virtualSize=$virtualSize]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'architecture'] = this.architecture;
      json[r'author'] = this.author;
      json[r'config'] = this.config;
      json[r'created'] = this.created;
      json[r'docker_version'] = this.dockerVersion;
      json[r'os'] = this.os;
    if (this.parent != null) {
      json[r'parent'] = this.parent;
    } else {
      json[r'parent'] = null;
    }
      json[r'repo_digests'] = this.repoDigests;
      json[r'repo_tags'] = this.repoTags;
      json[r'rootfs'] = this.rootfs;
      json[r'size'] = this.size;
      json[r'virtual_size'] = this.virtualSize;
    return json;
  }

  /// Returns a new [ImageInspectInfo] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ImageInspectInfo? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ImageInspectInfo[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ImageInspectInfo[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ImageInspectInfo(
        architecture: mapValueOfType<String>(json, r'architecture')!,
        author: mapValueOfType<String>(json, r'author')!,
        config: ImageConfig.fromJson(json[r'config'])!,
        created: mapValueOfType<String>(json, r'created')!,
        dockerVersion: mapValueOfType<String>(json, r'docker_version')!,
        os: mapValueOfType<String>(json, r'os')!,
        parent: mapValueOfType<String>(json, r'parent'),
        repoDigests: json[r'repo_digests'] is Iterable
            ? (json[r'repo_digests'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        repoTags: json[r'repo_tags'] is Iterable
            ? (json[r'repo_tags'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        rootfs: RootFS.fromJson(json[r'rootfs'])!,
        size: mapValueOfType<int>(json, r'size')!,
        virtualSize: mapValueOfType<int>(json, r'virtual_size')!,
      );
    }
    return null;
  }

  static List<ImageInspectInfo> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ImageInspectInfo>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ImageInspectInfo.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ImageInspectInfo> mapFromJson(dynamic json) {
    final map = <String, ImageInspectInfo>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ImageInspectInfo.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ImageInspectInfo-objects as value to a dart map
  static Map<String, List<ImageInspectInfo>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ImageInspectInfo>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ImageInspectInfo.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'architecture',
    'author',
    'config',
    'created',
    'docker_version',
    'os',
    'rootfs',
    'size',
    'virtual_size',
  };
}

