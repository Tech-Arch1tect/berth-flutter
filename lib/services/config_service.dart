import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ConfigService extends ChangeNotifier {
  static const _secureStorage = FlutterSecureStorage();
  String? _serverUrl;
  bool _isConfigured = false;

  String? get serverUrl => _serverUrl;
  bool get isConfigured => _isConfigured;

  Future<void> loadConfiguration() async {
    _serverUrl = await _secureStorage.read(key: 'server_url');
    _isConfigured = _serverUrl != null && _serverUrl!.isNotEmpty;
    notifyListeners();
  }

  Future<bool> setServerUrl(String url) async {
    try {
      final uri = Uri.tryParse(url);
      if (uri == null || (!uri.hasScheme || (!uri.scheme.startsWith('http')))) {
        return false;
      }

      String cleanUrl = url.endsWith('/') ? url.substring(0, url.length - 1) : url;
      
      await _secureStorage.write(key: 'server_url', value: cleanUrl);
      
      _serverUrl = cleanUrl;
      _isConfigured = true;
      notifyListeners();
      
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> clearConfiguration() async {
    await _secureStorage.delete(key: 'server_url');
    
    _serverUrl = null;
    _isConfigured = false;
    notifyListeners();
  }

  String? validateServerUrl(String? url) {
    if (url == null || url.isEmpty) {
      return 'Please enter a server URL';
    }

    final uri = Uri.tryParse(url);
    if (uri == null) {
      return 'Please enter a valid URL';
    }

    if (!uri.hasScheme) {
      return 'URL must include http:// or https://';
    }

    if (!uri.scheme.startsWith('http')) {
      return 'URL must start with http:// or https://';
    }

    if (!uri.hasAuthority) {
      return 'Please enter a valid server address';
    }

    return null;
  }

  List<String> get commonUrls => [
    'http://localhost:8080',
    'https://localhost:8443',
    'http://192.168.1.100:8080',
    'https://your-domain.com',
  ];
}