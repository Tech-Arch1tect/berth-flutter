import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigService extends ChangeNotifier {
  String? _serverUrl;
  bool _isConfigured = false;

  String? get serverUrl => _serverUrl;
  bool get isConfigured => _isConfigured;

  Future<void> loadConfiguration() async {
    final prefs = await SharedPreferences.getInstance();
    _serverUrl = prefs.getString('server_url');
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
      
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('server_url', cleanUrl);
      
      _serverUrl = cleanUrl;
      _isConfigured = true;
      notifyListeners();
      
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> clearConfiguration() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('server_url');
    
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