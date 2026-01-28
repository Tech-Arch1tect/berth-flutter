//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContainerStats {
  /// Returns a new [ContainerStats] instance.
  ContainerStats({
    required this.blockReadBytes,
    required this.blockReadOps,
    required this.blockWriteBytes,
    required this.blockWriteOps,
    required this.cpuPercent,
    required this.cpuSystemTime,
    required this.cpuUserTime,
    required this.memoryCache,
    required this.memoryLimit,
    required this.memoryPercent,
    required this.memoryRss,
    required this.memorySwap,
    required this.memoryUsage,
    required this.name,
    required this.networkRxBytes,
    required this.networkRxPackets,
    required this.networkTxBytes,
    required this.networkTxPackets,
    required this.pageFaults,
    required this.pageMajorFaults,
    required this.serviceName,
  });

  /// Minimum value: 0
  int blockReadBytes;

  /// Minimum value: 0
  int blockReadOps;

  /// Minimum value: 0
  int blockWriteBytes;

  /// Minimum value: 0
  int blockWriteOps;

  num cpuPercent;

  /// Minimum value: 0
  int cpuSystemTime;

  /// Minimum value: 0
  int cpuUserTime;

  /// Minimum value: 0
  int memoryCache;

  /// Minimum value: 0
  int memoryLimit;

  num memoryPercent;

  /// Minimum value: 0
  int memoryRss;

  /// Minimum value: 0
  int memorySwap;

  /// Minimum value: 0
  int memoryUsage;

  String name;

  /// Minimum value: 0
  int networkRxBytes;

  /// Minimum value: 0
  int networkRxPackets;

  /// Minimum value: 0
  int networkTxBytes;

  /// Minimum value: 0
  int networkTxPackets;

  /// Minimum value: 0
  int pageFaults;

  /// Minimum value: 0
  int pageMajorFaults;

  String serviceName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContainerStats &&
    other.blockReadBytes == blockReadBytes &&
    other.blockReadOps == blockReadOps &&
    other.blockWriteBytes == blockWriteBytes &&
    other.blockWriteOps == blockWriteOps &&
    other.cpuPercent == cpuPercent &&
    other.cpuSystemTime == cpuSystemTime &&
    other.cpuUserTime == cpuUserTime &&
    other.memoryCache == memoryCache &&
    other.memoryLimit == memoryLimit &&
    other.memoryPercent == memoryPercent &&
    other.memoryRss == memoryRss &&
    other.memorySwap == memorySwap &&
    other.memoryUsage == memoryUsage &&
    other.name == name &&
    other.networkRxBytes == networkRxBytes &&
    other.networkRxPackets == networkRxPackets &&
    other.networkTxBytes == networkTxBytes &&
    other.networkTxPackets == networkTxPackets &&
    other.pageFaults == pageFaults &&
    other.pageMajorFaults == pageMajorFaults &&
    other.serviceName == serviceName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (blockReadBytes.hashCode) +
    (blockReadOps.hashCode) +
    (blockWriteBytes.hashCode) +
    (blockWriteOps.hashCode) +
    (cpuPercent.hashCode) +
    (cpuSystemTime.hashCode) +
    (cpuUserTime.hashCode) +
    (memoryCache.hashCode) +
    (memoryLimit.hashCode) +
    (memoryPercent.hashCode) +
    (memoryRss.hashCode) +
    (memorySwap.hashCode) +
    (memoryUsage.hashCode) +
    (name.hashCode) +
    (networkRxBytes.hashCode) +
    (networkRxPackets.hashCode) +
    (networkTxBytes.hashCode) +
    (networkTxPackets.hashCode) +
    (pageFaults.hashCode) +
    (pageMajorFaults.hashCode) +
    (serviceName.hashCode);

  @override
  String toString() => 'ContainerStats[blockReadBytes=$blockReadBytes, blockReadOps=$blockReadOps, blockWriteBytes=$blockWriteBytes, blockWriteOps=$blockWriteOps, cpuPercent=$cpuPercent, cpuSystemTime=$cpuSystemTime, cpuUserTime=$cpuUserTime, memoryCache=$memoryCache, memoryLimit=$memoryLimit, memoryPercent=$memoryPercent, memoryRss=$memoryRss, memorySwap=$memorySwap, memoryUsage=$memoryUsage, name=$name, networkRxBytes=$networkRxBytes, networkRxPackets=$networkRxPackets, networkTxBytes=$networkTxBytes, networkTxPackets=$networkTxPackets, pageFaults=$pageFaults, pageMajorFaults=$pageMajorFaults, serviceName=$serviceName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'block_read_bytes'] = this.blockReadBytes;
      json[r'block_read_ops'] = this.blockReadOps;
      json[r'block_write_bytes'] = this.blockWriteBytes;
      json[r'block_write_ops'] = this.blockWriteOps;
      json[r'cpu_percent'] = this.cpuPercent;
      json[r'cpu_system_time'] = this.cpuSystemTime;
      json[r'cpu_user_time'] = this.cpuUserTime;
      json[r'memory_cache'] = this.memoryCache;
      json[r'memory_limit'] = this.memoryLimit;
      json[r'memory_percent'] = this.memoryPercent;
      json[r'memory_rss'] = this.memoryRss;
      json[r'memory_swap'] = this.memorySwap;
      json[r'memory_usage'] = this.memoryUsage;
      json[r'name'] = this.name;
      json[r'network_rx_bytes'] = this.networkRxBytes;
      json[r'network_rx_packets'] = this.networkRxPackets;
      json[r'network_tx_bytes'] = this.networkTxBytes;
      json[r'network_tx_packets'] = this.networkTxPackets;
      json[r'page_faults'] = this.pageFaults;
      json[r'page_major_faults'] = this.pageMajorFaults;
      json[r'service_name'] = this.serviceName;
    return json;
  }

  /// Returns a new [ContainerStats] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContainerStats? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        requiredKeys.forEach((key) {
          assert(json.containsKey(key), 'Required key "ContainerStats[$key]" is missing from JSON.');
          assert(json[key] != null, 'Required key "ContainerStats[$key]" has a null value in JSON.');
        });
        return true;
      }());

      return ContainerStats(
        blockReadBytes: mapValueOfType<int>(json, r'block_read_bytes')!,
        blockReadOps: mapValueOfType<int>(json, r'block_read_ops')!,
        blockWriteBytes: mapValueOfType<int>(json, r'block_write_bytes')!,
        blockWriteOps: mapValueOfType<int>(json, r'block_write_ops')!,
        cpuPercent: num.parse('${json[r'cpu_percent']}'),
        cpuSystemTime: mapValueOfType<int>(json, r'cpu_system_time')!,
        cpuUserTime: mapValueOfType<int>(json, r'cpu_user_time')!,
        memoryCache: mapValueOfType<int>(json, r'memory_cache')!,
        memoryLimit: mapValueOfType<int>(json, r'memory_limit')!,
        memoryPercent: num.parse('${json[r'memory_percent']}'),
        memoryRss: mapValueOfType<int>(json, r'memory_rss')!,
        memorySwap: mapValueOfType<int>(json, r'memory_swap')!,
        memoryUsage: mapValueOfType<int>(json, r'memory_usage')!,
        name: mapValueOfType<String>(json, r'name')!,
        networkRxBytes: mapValueOfType<int>(json, r'network_rx_bytes')!,
        networkRxPackets: mapValueOfType<int>(json, r'network_rx_packets')!,
        networkTxBytes: mapValueOfType<int>(json, r'network_tx_bytes')!,
        networkTxPackets: mapValueOfType<int>(json, r'network_tx_packets')!,
        pageFaults: mapValueOfType<int>(json, r'page_faults')!,
        pageMajorFaults: mapValueOfType<int>(json, r'page_major_faults')!,
        serviceName: mapValueOfType<String>(json, r'service_name')!,
      );
    }
    return null;
  }

  static List<ContainerStats> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContainerStats>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContainerStats.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContainerStats> mapFromJson(dynamic json) {
    final map = <String, ContainerStats>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContainerStats.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContainerStats-objects as value to a dart map
  static Map<String, List<ContainerStats>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContainerStats>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContainerStats.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'block_read_bytes',
    'block_read_ops',
    'block_write_bytes',
    'block_write_ops',
    'cpu_percent',
    'cpu_system_time',
    'cpu_user_time',
    'memory_cache',
    'memory_limit',
    'memory_percent',
    'memory_rss',
    'memory_swap',
    'memory_usage',
    'name',
    'network_rx_bytes',
    'network_rx_packets',
    'network_tx_bytes',
    'network_tx_packets',
    'page_faults',
    'page_major_faults',
    'service_name',
  };
}

