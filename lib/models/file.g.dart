// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileEntry _$FileEntryFromJson(Map<String, dynamic> json) => FileEntry(
  name: json['name'] as String,
  path: json['path'] as String,
  size: (json['size'] as num).toInt(),
  isDirectory: json['is_directory'] as bool,
  modTime: DateTime.parse(json['mod_time'] as String),
  mode: json['mode'] as String,
  owner: json['owner'] as String?,
  group: json['group'] as String?,
  ownerId: (json['owner_id'] as num?)?.toInt(),
  groupId: (json['group_id'] as num?)?.toInt(),
  extension: json['extension'] as String?,
);

Map<String, dynamic> _$FileEntryToJson(FileEntry instance) => <String, dynamic>{
  'name': instance.name,
  'path': instance.path,
  'size': instance.size,
  'is_directory': instance.isDirectory,
  'mod_time': instance.modTime.toIso8601String(),
  'mode': instance.mode,
  'owner': instance.owner,
  'group': instance.group,
  'owner_id': instance.ownerId,
  'group_id': instance.groupId,
  'extension': instance.extension,
};

DirectoryListing _$DirectoryListingFromJson(Map<String, dynamic> json) =>
    DirectoryListing(
      path: json['path'] as String,
      entries: (json['entries'] as List<dynamic>)
          .map((e) => FileEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DirectoryListingToJson(DirectoryListing instance) =>
    <String, dynamic>{'path': instance.path, 'entries': instance.entries};

FileContent _$FileContentFromJson(Map<String, dynamic> json) => FileContent(
  path: json['path'] as String,
  content: json['content'] as String,
  size: (json['size'] as num).toInt(),
  encoding: json['encoding'] as String,
);

Map<String, dynamic> _$FileContentToJson(FileContent instance) =>
    <String, dynamic>{
      'path': instance.path,
      'content': instance.content,
      'size': instance.size,
      'encoding': instance.encoding,
    };

FileInfo _$FileInfoFromJson(Map<String, dynamic> json) => FileInfo(
  name: json['name'] as String,
  path: json['path'] as String,
  size: (json['size'] as num).toInt(),
  isDirectory: json['is_directory'] as bool,
  modTime: DateTime.parse(json['mod_time'] as String),
  mode: json['mode'] as String,
  extension: json['extension'] as String?,
  mimeType: json['mime_type'] as String?,
);

Map<String, dynamic> _$FileInfoToJson(FileInfo instance) => <String, dynamic>{
  'name': instance.name,
  'path': instance.path,
  'size': instance.size,
  'is_directory': instance.isDirectory,
  'mod_time': instance.modTime.toIso8601String(),
  'mode': instance.mode,
  'extension': instance.extension,
  'mime_type': instance.mimeType,
};

WriteFileRequest _$WriteFileRequestFromJson(Map<String, dynamic> json) =>
    WriteFileRequest(
      path: json['path'] as String,
      content: json['content'] as String,
      encoding: json['encoding'] as String? ?? 'utf-8',
    );

Map<String, dynamic> _$WriteFileRequestToJson(WriteFileRequest instance) =>
    <String, dynamic>{
      'path': instance.path,
      'content': instance.content,
      'encoding': instance.encoding,
    };

CreateDirectoryRequest _$CreateDirectoryRequestFromJson(
  Map<String, dynamic> json,
) => CreateDirectoryRequest(path: json['path'] as String);

Map<String, dynamic> _$CreateDirectoryRequestToJson(
  CreateDirectoryRequest instance,
) => <String, dynamic>{'path': instance.path};

DeleteRequest _$DeleteRequestFromJson(Map<String, dynamic> json) =>
    DeleteRequest(path: json['path'] as String);

Map<String, dynamic> _$DeleteRequestToJson(DeleteRequest instance) =>
    <String, dynamic>{'path': instance.path};

RenameRequest _$RenameRequestFromJson(Map<String, dynamic> json) =>
    RenameRequest(
      oldPath: json['old_path'] as String,
      newPath: json['new_path'] as String,
    );

Map<String, dynamic> _$RenameRequestToJson(RenameRequest instance) =>
    <String, dynamic>{
      'old_path': instance.oldPath,
      'new_path': instance.newPath,
    };

CopyRequest _$CopyRequestFromJson(Map<String, dynamic> json) => CopyRequest(
  sourcePath: json['source_path'] as String,
  targetPath: json['target_path'] as String,
);

Map<String, dynamic> _$CopyRequestToJson(CopyRequest instance) =>
    <String, dynamic>{
      'source_path': instance.sourcePath,
      'target_path': instance.targetPath,
    };

ChmodRequest _$ChmodRequestFromJson(Map<String, dynamic> json) => ChmodRequest(
  path: json['path'] as String,
  mode: json['mode'] as String,
  recursive: json['recursive'] as bool? ?? false,
);

Map<String, dynamic> _$ChmodRequestToJson(ChmodRequest instance) =>
    <String, dynamic>{
      'path': instance.path,
      'mode': instance.mode,
      'recursive': instance.recursive,
    };

ChownRequest _$ChownRequestFromJson(Map<String, dynamic> json) => ChownRequest(
  path: json['path'] as String,
  ownerId: (json['owner_id'] as num?)?.toInt(),
  groupId: (json['group_id'] as num?)?.toInt(),
  recursive: json['recursive'] as bool? ?? false,
);

Map<String, dynamic> _$ChownRequestToJson(ChownRequest instance) =>
    <String, dynamic>{
      'path': instance.path,
      'owner_id': instance.ownerId,
      'group_id': instance.groupId,
      'recursive': instance.recursive,
    };
