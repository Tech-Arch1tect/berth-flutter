import 'package:json_annotation/json_annotation.dart';

part 'maintenance.g.dart';

@JsonSerializable()
class SystemInfo {
  final String version;
  @JsonKey(name: 'api_version')
  final String apiVersion;
  final String architecture;
  final String os;
  @JsonKey(name: 'kernel_version')
  final String kernelVersion;
  @JsonKey(name: 'total_memory')
  final int totalMemory;
  final int ncpu;
  @JsonKey(name: 'storage_driver')
  final String storageDriver;
  @JsonKey(name: 'docker_root_dir')
  final String dockerRootDir;
  @JsonKey(name: 'server_version')
  final String serverVersion;

  SystemInfo({
    required this.version,
    required this.apiVersion,
    required this.architecture,
    required this.os,
    required this.kernelVersion,
    required this.totalMemory,
    required this.ncpu,
    required this.storageDriver,
    required this.dockerRootDir,
    required this.serverVersion,
  });

  factory SystemInfo.fromJson(Map<String, dynamic> json) => _$SystemInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SystemInfoToJson(this);
}

@JsonSerializable()
class DiskUsage {
  @JsonKey(name: 'layers_size')
  final int layersSize;
  @JsonKey(name: 'images_size')
  final int imagesSize;
  @JsonKey(name: 'containers_size')
  final int containersSize;
  @JsonKey(name: 'volumes_size')
  final int volumesSize;
  @JsonKey(name: 'build_cache_size')
  final int buildCacheSize;
  @JsonKey(name: 'total_size')
  final int totalSize;

  DiskUsage({
    required this.layersSize,
    required this.imagesSize,
    required this.containersSize,
    required this.volumesSize,
    required this.buildCacheSize,
    required this.totalSize,
  });

  factory DiskUsage.fromJson(Map<String, dynamic> json) => _$DiskUsageFromJson(json);
  Map<String, dynamic> toJson() => _$DiskUsageToJson(this);
}

@JsonSerializable()
class ImageInfo {
  final String repository;
  final String tag;
  final String id;
  final int size;
  final String created;
  final bool dangling;
  final bool unused;

  ImageInfo({
    required this.repository,
    required this.tag,
    required this.id,
    required this.size,
    required this.created,
    required this.dangling,
    required this.unused,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) => _$ImageInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ImageInfoToJson(this);
}

@JsonSerializable()
class ImageSummary {
  @JsonKey(name: 'total_count')
  final int totalCount;
  @JsonKey(name: 'dangling_count')
  final int danglingCount;
  @JsonKey(name: 'unused_count')
  final int unusedCount;
  @JsonKey(name: 'total_size')
  final int totalSize;
  @JsonKey(name: 'dangling_size')
  final int danglingSize;
  @JsonKey(name: 'unused_size')
  final int unusedSize;
  final List<ImageInfo> images;

  ImageSummary({
    required this.totalCount,
    required this.danglingCount,
    required this.unusedCount,
    required this.totalSize,
    required this.danglingSize,
    required this.unusedSize,
    required this.images,
  });

  factory ImageSummary.fromJson(Map<String, dynamic> json) => _$ImageSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSummaryToJson(this);
}

@JsonSerializable()
class ContainerInfo {
  final String id;
  final String name;
  final String image;
  final String state;
  final String status;
  final String created;
  final int size;
  final Map<String, String> labels;

  ContainerInfo({
    required this.id,
    required this.name,
    required this.image,
    required this.state,
    required this.status,
    required this.created,
    required this.size,
    required this.labels,
  });

  factory ContainerInfo.fromJson(Map<String, dynamic> json) => _$ContainerInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ContainerInfoToJson(this);
}

@JsonSerializable()
class ContainerSummary {
  @JsonKey(name: 'running_count')
  final int runningCount;
  @JsonKey(name: 'stopped_count')
  final int stoppedCount;
  @JsonKey(name: 'total_count')
  final int totalCount;
  @JsonKey(name: 'total_size')
  final int totalSize;
  final List<ContainerInfo> containers;

  ContainerSummary({
    required this.runningCount,
    required this.stoppedCount,
    required this.totalCount,
    required this.totalSize,
    required this.containers,
  });

  factory ContainerSummary.fromJson(Map<String, dynamic> json) => _$ContainerSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$ContainerSummaryToJson(this);
}

@JsonSerializable()
class VolumeInfo {
  final String name;
  final String driver;
  final String mountpoint;
  final String created;
  final int size;
  final Map<String, String> labels;
  final bool unused;

  VolumeInfo({
    required this.name,
    required this.driver,
    required this.mountpoint,
    required this.created,
    required this.size,
    required this.labels,
    required this.unused,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => _$VolumeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}

@JsonSerializable()
class VolumeSummary {
  @JsonKey(name: 'total_count')
  final int totalCount;
  @JsonKey(name: 'unused_count')
  final int unusedCount;
  @JsonKey(name: 'total_size')
  final int totalSize;
  @JsonKey(name: 'unused_size')
  final int unusedSize;
  final List<VolumeInfo> volumes;

  VolumeSummary({
    required this.totalCount,
    required this.unusedCount,
    required this.totalSize,
    required this.unusedSize,
    required this.volumes,
  });

  factory VolumeSummary.fromJson(Map<String, dynamic> json) => _$VolumeSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeSummaryToJson(this);
}

@JsonSerializable()
class NetworkInfo {
  final String id;
  final String name;
  final String driver;
  final String scope;
  final String created;
  final bool internal;
  final Map<String, String> labels;
  final bool unused;

  NetworkInfo({
    required this.id,
    required this.name,
    required this.driver,
    required this.scope,
    required this.created,
    required this.internal,
    required this.labels,
    required this.unused,
  });

  factory NetworkInfo.fromJson(Map<String, dynamic> json) => _$NetworkInfoFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkInfoToJson(this);
}

@JsonSerializable()
class NetworkSummary {
  @JsonKey(name: 'total_count')
  final int totalCount;
  @JsonKey(name: 'unused_count')
  final int unusedCount;
  final List<NetworkInfo> networks;

  NetworkSummary({
    required this.totalCount,
    required this.unusedCount,
    required this.networks,
  });

  factory NetworkSummary.fromJson(Map<String, dynamic> json) => _$NetworkSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkSummaryToJson(this);
}

@JsonSerializable()
class BuildCacheInfo {
  final String id;
  final String? parent;
  final String type;
  final int size;
  final String created;
  @JsonKey(name: 'last_used')
  final String lastUsed;
  @JsonKey(name: 'usage_count')
  final int usageCount;
  @JsonKey(name: 'in_use')
  final bool inUse;
  final bool shared;
  final String description;

  BuildCacheInfo({
    required this.id,
    this.parent,
    required this.type,
    required this.size,
    required this.created,
    required this.lastUsed,
    required this.usageCount,
    required this.inUse,
    required this.shared,
    required this.description,
  });

  factory BuildCacheInfo.fromJson(Map<String, dynamic> json) => _$BuildCacheInfoFromJson(json);
  Map<String, dynamic> toJson() => _$BuildCacheInfoToJson(this);
}

@JsonSerializable()
class BuildCacheSummary {
  @JsonKey(name: 'total_count')
  final int totalCount;
  @JsonKey(name: 'total_size')
  final int totalSize;
  final List<BuildCacheInfo> cache;

  BuildCacheSummary({
    required this.totalCount,
    required this.totalSize,
    required this.cache,
  });

  factory BuildCacheSummary.fromJson(Map<String, dynamic> json) => _$BuildCacheSummaryFromJson(json);
  Map<String, dynamic> toJson() => _$BuildCacheSummaryToJson(this);
}

@JsonSerializable()
class MaintenanceInfo {
  @JsonKey(name: 'system_info')
  final SystemInfo systemInfo;
  @JsonKey(name: 'disk_usage')
  final DiskUsage diskUsage;
  @JsonKey(name: 'image_summary')
  final ImageSummary imageSummary;
  @JsonKey(name: 'container_summary')
  final ContainerSummary containerSummary;
  @JsonKey(name: 'volume_summary')
  final VolumeSummary volumeSummary;
  @JsonKey(name: 'network_summary')
  final NetworkSummary networkSummary;
  @JsonKey(name: 'build_cache_summary')
  final BuildCacheSummary buildCacheSummary;
  @JsonKey(name: 'last_updated')
  final String lastUpdated;

  MaintenanceInfo({
    required this.systemInfo,
    required this.diskUsage,
    required this.imageSummary,
    required this.containerSummary,
    required this.volumeSummary,
    required this.networkSummary,
    required this.buildCacheSummary,
    required this.lastUpdated,
  });

  factory MaintenanceInfo.fromJson(Map<String, dynamic> json) => _$MaintenanceInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MaintenanceInfoToJson(this);
}

@JsonSerializable()
class PruneRequest {
  final String type;
  final bool? force;
  final bool? all;
  final String? filters;

  PruneRequest({
    required this.type,
    this.force,
    this.all,
    this.filters,
  });

  factory PruneRequest.fromJson(Map<String, dynamic> json) => _$PruneRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PruneRequestToJson(this);
}

@JsonSerializable()
class DeleteRequest {
  final String type;
  final String id;

  DeleteRequest({
    required this.type,
    required this.id,
  });

  factory DeleteRequest.fromJson(Map<String, dynamic> json) => _$DeleteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteRequestToJson(this);
}

@JsonSerializable()
class DeleteResult {
  final String type;
  final String id;
  final bool success;
  final String? error;

  DeleteResult({
    required this.type,
    required this.id,
    required this.success,
    this.error,
  });

  factory DeleteResult.fromJson(Map<String, dynamic> json) => _$DeleteResultFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteResultToJson(this);
}

@JsonSerializable()
class PruneResult {
  final String type;
  @JsonKey(name: 'items_deleted')
  final List<String> itemsDeleted;
  @JsonKey(name: 'space_reclaimed')
  final int spaceReclaimed;
  final String? error;

  PruneResult({
    required this.type,
    required this.itemsDeleted,
    required this.spaceReclaimed,
    this.error,
  });

  factory PruneResult.fromJson(Map<String, dynamic> json) => _$PruneResultFromJson(json);
  Map<String, dynamic> toJson() => _$PruneResultToJson(this);
}