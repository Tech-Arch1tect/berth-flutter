import 'package:berth_api/api.dart' as berth_api;

extension FileEntryExtensions on berth_api.FileEntry {
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
