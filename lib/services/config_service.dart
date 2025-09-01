import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ConfigService extends ChangeNotifier {
  static const _secureStorage = FlutterSecureStorage();
  String? _serverUrl;
  bool _isConfigured = false;
  bool _skipSslVerification = true;

  String? get serverUrl => _serverUrl;
  bool get isConfigured => _isConfigured;
  bool get skipSslVerification => _skipSslVerification;

  Future<void> loadConfiguration() async {
    _serverUrl = await _secureStorage.read(key: 'server_url');
    final skipSslString = await _secureStorage.read(key: 'skip_ssl_verification');
    _skipSslVerification = skipSslString != null ? skipSslString == 'true' : true;
    _isConfigured = _serverUrl != null && _serverUrl!.isNotEmpty;
    notifyListeners();
  }

  Future<bool> setServerUrl(String url, {bool? skipSslVerification}) async {
    try {
      final uri = Uri.tryParse(url);
      if (uri == null || (!uri.hasScheme || (!uri.scheme.startsWith('http')))) {
        return false;
      }

      String cleanUrl = url.endsWith('/') ? url.substring(0, url.length - 1) : url;
      
      await _secureStorage.write(key: 'server_url', value: cleanUrl);
      
      if (skipSslVerification != null) {
        await _secureStorage.write(key: 'skip_ssl_verification', value: skipSslVerification.toString());
        _skipSslVerification = skipSslVerification;
      }
      
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
    await _secureStorage.delete(key: 'skip_ssl_verification');
    
    _serverUrl = null;
    _skipSslVerification = true;
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
    'https://localhost:8080',
    'http://localhost:8080',
    'https://192.168.1.100:8080',
    'https://your-domain.com',
  ];
}