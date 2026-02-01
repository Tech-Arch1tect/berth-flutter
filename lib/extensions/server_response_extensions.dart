import 'package:berth_api/api.dart' as berth_api;

extension ServerInfoExtensions on berth_api.ServerInfo {
  String get baseUrl => 'https://$host:$port';
}
