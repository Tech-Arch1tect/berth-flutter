import 'package:berth_api/api.dart' as berth_api;

extension ServerResponseExtensions on berth_api.ServerResponse {
  String get baseUrl => 'https://$host:$port';
}
