import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  final http.Client _client;
  static const _secureStorage = FlutterSecureStorage();
  String? _baseUrl;
  String? _authToken;
  Function? _onTokenRefresh;
  
  ApiClient() : _client = http.Client();

  void setBaseUrl(String url) {
    _baseUrl = url;
  }

  void setAuthToken(String token) {
    _authToken = token;
  }

  void clearAuthToken() {
    _authToken = null;
  }

  void setTokenRefreshCallback(Function() callback) {
    _onTokenRefresh = callback;
  }

  String get baseUrl {
    if (_baseUrl == null || _baseUrl!.isEmpty) {
      throw Exception('Server URL not configured');
    }
    return _baseUrl!;
  }

  Future<Map<String, String>> _getHeaders([Map<String, String>? additionalHeaders]) async {
    final prefs = await SharedPreferences.getInstance();
    
    final mobileAppHeader = await _secureStorage.read(key: 'mobile_app_header') ?? 
                           prefs.getString('mobile_app_header') ?? 'X-Mobile-App';
    final mobileAppIdentifier = await _secureStorage.read(key: 'mobile_app_identifier') ?? 
                               prefs.getString('mobile_app_identifier') ?? 'brx-flutter';
    final userAgent = await _secureStorage.read(key: 'user_agent') ?? 
                     prefs.getString('user_agent') ?? 'BRX-Flutter-Mobile-App/1.0';
    
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      mobileAppHeader: mobileAppIdentifier,
      'User-Agent': userAgent,
    };
    
    if (_authToken != null && _authToken!.isNotEmpty) {
      headers['Authorization'] = 'Bearer $_authToken';
    }
    
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }
    
    return headers;
  }

  Future<http.Response> get(String endpoint) async {
    final url = '$baseUrl$endpoint';
    final headers = await _getHeaders();
    
    
    final response = await _client.get(
      Uri.parse(url),
      headers: headers,
    );
    
    
    if (response.statusCode == 401 && _onTokenRefresh != null) {
      final refreshSuccess = await _onTokenRefresh!();
      if (refreshSuccess) {
        final newHeaders = await _getHeaders();
        return await _client.get(
          Uri.parse(url),
          headers: newHeaders,
        );
      }
    }
    
    return response;
  }

  Future<http.Response> post(String endpoint, {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    final url = '$baseUrl$endpoint';
    final requestHeaders = await _getHeaders(headers);
    
    if (body != null) {
    }
    
    final response = await _client.post(
      Uri.parse(url),
      headers: requestHeaders,
      body: body != null ? json.encode(body) : null,
    );
    
    
    if (response.statusCode == 401 && _onTokenRefresh != null && !endpoint.contains('/auth/refresh')) {
      final refreshSuccess = await _onTokenRefresh!();
      if (refreshSuccess) {
        final newHeaders = await _getHeaders(headers);
        return await _client.post(
          Uri.parse(url),
          headers: newHeaders,
          body: body != null ? json.encode(body) : null,
        );
      }
    }
    
    return response;
  }

  void dispose() {
    _client.close();
  }
}