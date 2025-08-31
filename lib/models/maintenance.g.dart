// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemInfo _$SystemInfoFromJson(Map<String, dynamic> json) => SystemInfo(
  version: json['version'] as String,
  apiVersion: json['api_version'] as String,
  architecture: json['architecture'] as String,
  os: json['os'] as String,
  kernelVersion: json['kernel_version'] as String,
  totalMemory: (json['total_memory'] as num).toInt(),
  ncpu: (json['ncpu'] as num).toInt(),
  storageDriver: json['storage_driver'] as String,
  dockerRootDir: json['docker_root_dir'] as String,
  serverVersion: json['server_version'] as String,
);

Map<String, dynamic> _$SystemInfoToJson(SystemInfo instance) =>
    <String, dynamic>{
      'version': instance.version,
      'api_version': instance.apiVersion,
      'architecture': instance.architecture,
      'os': instance.os,
      'kernel_version': instance.kernelVersion,
      'total_memory': instance.totalMemory,
      'ncpu': instance.ncpu,
      'storage_driver': instance.storageDriver,
      'docker_root_dir': instance.dockerRootDir,
      'server_version': instance.serverVersion,
    };

DiskUsage _$DiskUsageFromJson(Map<String, dynamic> json) => DiskUsage(
  layersSize: (json['layers_size'] as num).toInt(),
  imagesSize: (json['images_size'] as num).toInt(),
  containersSize: (json['containers_size'] as num).toInt(),
  volumesSize: (json['volumes_size'] as num).toInt(),
  buildCacheSize: (json['build_cache_size'] as num).toInt(),
  totalSize: (json['total_size'] as num).toInt(),
);

Map<String, dynamic> _$DiskUsageToJson(DiskUsage instance) => <String, dynamic>{
  'layers_size': instance.layersSize,
  'images_size': instance.imagesSize,
  'containers_size': instance.containersSize,
  'volumes_size': instance.volumesSize,
  'build_cache_size': instance.buildCacheSize,
  'total_size': instance.totalSize,
};

ImageInfo _$ImageInfoFromJson(Map<String, dynamic> json) => ImageInfo(
  repository: json['repository'] as String,
  tag: json['tag'] as String,
  id: json['id'] as String,
  size: (json['size'] as num).toInt(),
  created: json['created'] as String,
  dangling: json['dangling'] as bool,
  unused: json['unused'] as bool,
);

Map<String, dynamic> _$ImageInfoToJson(ImageInfo instance) => <String, dynamic>{
  'repository': instance.repository,
  'tag': instance.tag,
  'id': instance.id,
  'size': instance.size,
  'created': instance.created,
  'dangling': instance.dangling,
  'unused': instance.unused,
};

ImageSummary _$ImageSummaryFromJson(Map<String, dynamic> json) => ImageSummary(
  totalCount: (json['total_count'] as num).toInt(),
  danglingCount: (json['dangling_count'] as num).toInt(),
  unusedCount: (json['unused_count'] as num).toInt(),
  totalSize: (json['total_size'] as num).toInt(),
  danglingSize: (json['dangling_size'] as num).toInt(),
  unusedSize: (json['unused_size'] as num).toInt(),
  images: (json['images'] as List<dynamic>)
      .map((e) => ImageInfo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ImageSummaryToJson(ImageSummary instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'dangling_count': instance.danglingCount,
      'unused_count': instance.unusedCount,
      'total_size': instance.totalSize,
      'dangling_size': instance.danglingSize,
      'unused_size': instance.unusedSize,
      'images': instance.images,
    };

ContainerInfo _$ContainerInfoFromJson(Map<String, dynamic> json) =>
    ContainerInfo(
      id: json['id'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      state: json['state'] as String,
      status: json['status'] as String,
      created: json['created'] as String,
      size: (json['size'] as num).toInt(),
      labels: Map<String, String>.from(json['labels'] as Map),
    );

Map<String, dynamic> _$ContainerInfoToJson(ContainerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'state': instance.state,
      'status': instance.status,
      'created': instance.created,
      'size': instance.size,
      'labels': instance.labels,
    };

ContainerSummary _$ContainerSummaryFromJson(Map<String, dynamic> json) =>
    ContainerSummary(
      runningCount: (json['running_count'] as num).toInt(),
      stoppedCount: (json['stopped_count'] as num).toInt(),
      totalCount: (json['total_count'] as num).toInt(),
      totalSize: (json['total_size'] as num).toInt(),
      containers: (json['containers'] as List<dynamic>)
          .map((e) => ContainerInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContainerSummaryToJson(ContainerSummary instance) =>
    <String, dynamic>{
      'running_count': instance.runningCount,
      'stopped_count': instance.stoppedCount,
      'total_count': instance.totalCount,
      'total_size': instance.totalSize,
      'containers': instance.containers,
    };

VolumeInfo _$VolumeInfoFromJson(Map<String, dynamic> json) => VolumeInfo(
  name: json['name'] as String,
  driver: json['driver'] as String,
  mountpoint: json['mountpoint'] as String,
  created: json['created'] as String,
  size: (json['size'] as num).toInt(),
  labels: Map<String, String>.from(json['labels'] as Map),
  unused: json['unused'] as bool,
);

Map<String, dynamic> _$VolumeInfoToJson(VolumeInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'driver': instance.driver,
      'mountpoint': instance.mountpoint,
      'created': instance.created,
      'size': instance.size,
      'labels': instance.labels,
      'unused': instance.unused,
    };

VolumeSummary _$VolumeSummaryFromJson(Map<String, dynamic> json) =>
    VolumeSummary(
      totalCount: (json['total_count'] as num).toInt(),
      unusedCount: (json['unused_count'] as num).toInt(),
      totalSize: (json['total_size'] as num).toInt(),
      unusedSize: (json['unused_size'] as num).toInt(),
      volumes: (json['volumes'] as List<dynamic>)
          .map((e) => VolumeInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VolumeSummaryToJson(VolumeSummary instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'unused_count': instance.unusedCount,
      'total_size': instance.totalSize,
      'unused_size': instance.unusedSize,
      'volumes': instance.volumes,
    };

NetworkInfo _$NetworkInfoFromJson(Map<String, dynamic> json) => NetworkInfo(
  id: json['id'] as String,
  name: json['name'] as String,
  driver: json['driver'] as String,
  scope: json['scope'] as String,
  created: json['created'] as String,
  internal: json['internal'] as bool,
  labels: Map<String, String>.from(json['labels'] as Map),
  unused: json['unused'] as bool,
);

Map<String, dynamic> _$NetworkInfoToJson(NetworkInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'driver': instance.driver,
      'scope': instance.scope,
      'created': instance.created,
      'internal': instance.internal,
      'labels': instance.labels,
      'unused': instance.unused,
    };

NetworkSummary _$NetworkSummaryFromJson(Map<String, dynamic> json) =>
    NetworkSummary(
      totalCount: (json['total_count'] as num).toInt(),
      unusedCount: (json['unused_count'] as num).toInt(),
      networks: (json['networks'] as List<dynamic>)
          .map((e) => NetworkInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkSummaryToJson(NetworkSummary instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'unused_count': instance.unusedCount,
      'networks': instance.networks,
    };

BuildCacheInfo _$BuildCacheInfoFromJson(Map<String, dynamic> json) =>
    BuildCacheInfo(
      id: json['id'] as String,
      parent: json['parent'] as String?,
      type: json['type'] as String,
      size: (json['size'] as num).toInt(),
      created: json['created'] as String,
      lastUsed: json['last_used'] as String,
      usageCount: (json['usage_count'] as num).toInt(),
      inUse: json['in_use'] as bool,
      shared: json['shared'] as bool,
      description: json['description'] as String,
    );

Map<String, dynamic> _$BuildCacheInfoToJson(BuildCacheInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent': instance.parent,
      'type': instance.type,
      'size': instance.size,
      'created': instance.created,
      'last_used': instance.lastUsed,
      'usage_count': instance.usageCount,
      'in_use': instance.inUse,
      'shared': instance.shared,
      'description': instance.description,
    };

BuildCacheSummary _$BuildCacheSummaryFromJson(Map<String, dynamic> json) =>
    BuildCacheSummary(
      totalCount: (json['total_count'] as num).toInt(),
      totalSize: (json['total_size'] as num).toInt(),
      cache: (json['cache'] as List<dynamic>)
          .map((e) => BuildCacheInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuildCacheSummaryToJson(BuildCacheSummary instance) =>
    <String, dynamic>{
      'total_count': instance.totalCount,
      'total_size': instance.totalSize,
      'cache': instance.cache,
    };

MaintenanceInfo _$MaintenanceInfoFromJson(Map<String, dynamic> json) =>
    MaintenanceInfo(
      systemInfo: SystemInfo.fromJson(
        json['system_info'] as Map<String, dynamic>,
      ),
      diskUsage: DiskUsage.fromJson(json['disk_usage'] as Map<String, dynamic>),
      imageSummary: ImageSummary.fromJson(
        json['image_summary'] as Map<String, dynamic>,
      ),
      containerSummary: ContainerSummary.fromJson(
        json['container_summary'] as Map<String, dynamic>,
      ),
      volumeSummary: VolumeSummary.fromJson(
        json['volume_summary'] as Map<String, dynamic>,
      ),
      networkSummary: NetworkSummary.fromJson(
        json['network_summary'] as Map<String, dynamic>,
      ),
      buildCacheSummary: BuildCacheSummary.fromJson(
        json['build_cache_summary'] as Map<String, dynamic>,
      ),
      lastUpdated: json['last_updated'] as String,
    );

Map<String, dynamic> _$MaintenanceInfoToJson(MaintenanceInfo instance) =>
    <String, dynamic>{
      'system_info': instance.systemInfo,
      'disk_usage': instance.diskUsage,
      'image_summary': instance.imageSummary,
      'container_summary': instance.containerSummary,
      'volume_summary': instance.volumeSummary,
      'network_summary': instance.networkSummary,
      'build_cache_summary': instance.buildCacheSummary,
      'last_updated': instance.lastUpdated,
    };

PruneRequest _$PruneRequestFromJson(Map<String, dynamic> json) => PruneRequest(
  type: json['type'] as String,
  force: json['force'] as bool?,
  all: json['all'] as bool?,
  filters: json['filters'] as String?,
);

Map<String, dynamic> _$PruneRequestToJson(PruneRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'force': instance.force,
      'all': instance.all,
      'filters': instance.filters,
    };

DeleteRequest _$DeleteRequestFromJson(Map<String, dynamic> json) =>
    DeleteRequest(type: json['type'] as String, id: json['id'] as String);

Map<String, dynamic> _$DeleteRequestToJson(DeleteRequest instance) =>
    <String, dynamic>{'type': instance.type, 'id': instance.id};

DeleteResult _$DeleteResultFromJson(Map<String, dynamic> json) => DeleteResult(
  type: json['type'] as String,
  id: json['id'] as String,
  success: json['success'] as bool,
  error: json['error'] as String?,
);

Map<String, dynamic> _$DeleteResultToJson(DeleteResult instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'success': instance.success,
      'error': instance.error,
    };

PruneResult _$PruneResultFromJson(Map<String, dynamic> json) => PruneResult(
  type: json['type'] as String,
  itemsDeleted: (json['items_deleted'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  spaceReclaimed: (json['space_reclaimed'] as num).toInt(),
  error: json['error'] as String?,
);

Map<String, dynamic> _$PruneResultToJson(PruneResult instance) =>
    <String, dynamic>{
      'type': instance.type,
      'items_deleted': instance.itemsDeleted,
      'space_reclaimed': instance.spaceReclaimed,
      'error': instance.error,
    };
