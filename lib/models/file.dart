import 'package:json_annotation/json_annotation.dart';

part 'file.g.dart';

@JsonSerializable()
class FileEntry {
  final String name;
  final String path;
  final int size;
  @JsonKey(name: 'is_directory')
  final bool isDirectory;
  @JsonKey(name: 'mod_time')
  final DateTime modTime;
  final String mode;
  final String? extension;

  const FileEntry({
    required this.name,
    required this.path,
    required this.size,
    required this.isDirectory,
    required this.modTime,
    required this.mode,
    this.extension,
  });

  factory FileEntry.fromJson(Map<String, dynamic> json) => _$FileEntryFromJson(json);
  Map<String, dynamic> toJson() => _$FileEntryToJson(this);

  String get displaySize {
    if (size == 0) return '0 B';
    
    const suffixes = ['B', 'KB', 'MB', 'GB'];
    var sizeDouble = size.toDouble();
    var suffixIndex = 0;
    
    while (sizeDouble >= 1024 && suffixIndex < suffixes.length - 1) {
      sizeDouble /= 1024;
      suffixIndex++;
    }
    
    return '${sizeDouble.toStringAsFixed(sizeDouble == sizeDouble.round() ? 0 : 1)} ${suffixes[suffixIndex]}';
  }
}

@JsonSerializable()
class DirectoryListing {
  final String path;
  final List<FileEntry> entries;

  const DirectoryListing({
    required this.path,
    required this.entries,
  });

  factory DirectoryListing.fromJson(Map<String, dynamic> json) {
    return DirectoryListing(
      path: json['path'] as String? ?? '',
      entries: (json['entries'] as List<dynamic>?)
          ?.map((e) => FileEntry.fromJson(e as Map<String, dynamic>))
          .toList() ?? <FileEntry>[],
    );
  }
  
  Map<String, dynamic> toJson() => _$DirectoryListingToJson(this);
}

@JsonSerializable()
class FileContent {
  final String path;
  final String content;
  final int size;
  final String encoding;

  const FileContent({
    required this.path,
    required this.content,
    required this.size,
    required this.encoding,
  });

  factory FileContent.fromJson(Map<String, dynamic> json) => _$FileContentFromJson(json);
  Map<String, dynamic> toJson() => _$FileContentToJson(this);
}

@JsonSerializable()
class FileInfo {
  final String name;
  final String path;
  final int size;
  @JsonKey(name: 'is_directory')
  final bool isDirectory;
  @JsonKey(name: 'mod_time')
  final DateTime modTime;
  final String mode;
  final String? extension;
  @JsonKey(name: 'mime_type')
  final String? mimeType;

  const FileInfo({
    required this.name,
    required this.path,
    required this.size,
    required this.isDirectory,
    required this.modTime,
    required this.mode,
    this.extension,
    this.mimeType,
  });

  factory FileInfo.fromJson(Map<String, dynamic> json) => _$FileInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FileInfoToJson(this);
}

@JsonSerializable()
class WriteFileRequest {
  final String path;
  final String content;
  final String encoding;

  const WriteFileRequest({
    required this.path,
    required this.content,
    this.encoding = 'utf-8',
  });

  factory WriteFileRequest.fromJson(Map<String, dynamic> json) => _$WriteFileRequestFromJson(json);
  Map<String, dynamic> toJson() => _$WriteFileRequestToJson(this);
}

@JsonSerializable()
class CreateDirectoryRequest {
  final String path;

  const CreateDirectoryRequest({
    required this.path,
  });

  factory CreateDirectoryRequest.fromJson(Map<String, dynamic> json) => _$CreateDirectoryRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateDirectoryRequestToJson(this);
}

@JsonSerializable()
class DeleteRequest {
  final String path;

  const DeleteRequest({
    required this.path,
  });

  factory DeleteRequest.fromJson(Map<String, dynamic> json) => _$DeleteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteRequestToJson(this);
}

@JsonSerializable()
class RenameRequest {
  @JsonKey(name: 'old_path')
  final String oldPath;
  @JsonKey(name: 'new_path')
  final String newPath;

  const RenameRequest({
    required this.oldPath,
    required this.newPath,
  });

  factory RenameRequest.fromJson(Map<String, dynamic> json) => _$RenameRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RenameRequestToJson(this);
}

@JsonSerializable()
class CopyRequest {
  @JsonKey(name: 'source_path')
  final String sourcePath;
  @JsonKey(name: 'target_path')
  final String targetPath;

  const CopyRequest({
    required this.sourcePath,
    required this.targetPath,
  });

  factory CopyRequest.fromJson(Map<String, dynamic> json) => _$CopyRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CopyRequestToJson(this);
}