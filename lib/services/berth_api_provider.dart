import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../config/app_config.dart';

class BerthApiProvider {
  berth_api.ApiClient? _apiClient;
  String? _baseUrl;
  String? _authToken;
  bool _skipSslVerification;

  Future<bool> Function()? _tokenRefreshCallback;

  Completer<bool>? _refreshCompleter;

  BerthApiProvider({bool skipSslVerification = true})
      : _skipSslVerification = skipSslVerification;

  String get baseUrl {
    if (_baseUrl == null || _baseUrl!.isEmpty) {
      throw Exception('Server URL not configured');
    }
    return _baseUrl!;
  }

  String? get authToken => _authToken;

  bool get skipSslVerification => _skipSslVerification;

  void setTokenRefreshCallback(Future<bool> Function() callback) {
    _tokenRefreshCallback = callback;
  }

  Future<T> callWithAutoRefresh<T>(Future<T> Function() apiCall) async {
    try {
      return await apiCall();
    } on berth_api.ApiException catch (e) {
      if (e.code == 401 && _tokenRefreshCallback != null) {
        debugPrint('BerthApiProvider: Got 401, attempting token refresh...');

        final refreshed = await _attemptTokenRefresh();

        if (refreshed) {
          debugPrint('BerthApiProvider: Token refreshed, retrying API call...');
          return await apiCall();
        } else {
          debugPrint('BerthApiProvider: Token refresh failed, re-throwing 401');
        }
      }
      rethrow;
    }
  }

  Future<bool> _attemptTokenRefresh() async {
    if (_refreshCompleter != null) {
      debugPrint('BerthApiProvider: Refresh already in progress, waiting...');
      return await _refreshCompleter!.future;
    }

    _refreshCompleter = Completer<bool>();

    try {
      final result = await _tokenRefreshCallback!();
      _refreshCompleter!.complete(result);
      return result;
    } catch (e) {
      debugPrint('BerthApiProvider: Token refresh threw error: $e');
      _refreshCompleter!.complete(false);
      return false;
    } finally {
      _refreshCompleter = null;
    }
  }

  void setBaseUrl(String url) {
    _baseUrl = url;
    _recreateClient();
  }

  void setAuthToken(String token) {
    _authToken = token;
    _updateAuthentication();
  }

  void clearAuthToken() {
    _authToken = null;
    _updateAuthentication();
  }

  void updateSslVerification(bool skipSslVerification) {
    if (_skipSslVerification != skipSslVerification) {
      _skipSslVerification = skipSslVerification;
      _recreateClient();
    }
  }

  berth_api.ApiClient get apiClient {
    if (_apiClient == null) {
      _recreateClient();
    }
    return _apiClient!;
  }

  void _recreateClient() {
    _clearApiInstances();
    final httpClient = _createHttpClient();

    berth_api.Authentication? auth;
    if (_authToken != null) {
      final bearerAuth = berth_api.HttpBearerAuth();
      bearerAuth.accessToken = _authToken;
      auth = bearerAuth;
    }

    _apiClient = berth_api.ApiClient(
      basePath: _baseUrl ?? 'http://localhost',
      authentication: auth,
    );

    _apiClient!.client = httpClient;

    _apiClient!.addDefaultHeader('Content-Type', AppConfig.defaultHeaders['Content-Type']!);
    _apiClient!.addDefaultHeader(AppConfig.mobileAppHeader, AppConfig.mobileAppIdentifier);
    _apiClient!.addDefaultHeader('User-Agent', AppConfig.userAgent);
  }

  void _updateAuthentication() {
    if (_apiClient != null && _authToken != null) {
      _recreateClient();
    }
  }

  http.Client _createHttpClient() {
    if (_skipSslVerification) {
      final httpClient = HttpClient()
        ..badCertificateCallback = (cert, host, port) => true;
      return IOClient(httpClient);
    } else {
      return http.Client();
    }
  }

  berth_api.ServersApi? _serversApi;
  berth_api.StacksApi? _stacksApi;
  berth_api.AdminApi? _adminApi;
  berth_api.ProfileApi? _profileApi;
  berth_api.SessionsApi? _sessionsApi;
  berth_api.RolesApi? _rolesApi;
  berth_api.UsersApi? _usersApi;
  berth_api.MaintenanceApi? _maintenanceApi;
  berth_api.OperationLogsApi? _operationLogsApi;
  berth_api.FilesApi? _filesApi;
  berth_api.LogsApi? _logsApi;
  berth_api.MigrationApi? _migrationApi;
  berth_api.TotpApi? _totpApi;
  berth_api.AuthApi? _authApi;

  berth_api.ServersApi get serversApi => _serversApi ??= berth_api.ServersApi(apiClient);
  berth_api.StacksApi get stacksApi => _stacksApi ??= berth_api.StacksApi(apiClient);
  berth_api.AdminApi get adminApi => _adminApi ??= berth_api.AdminApi(apiClient);
  berth_api.ProfileApi get profileApi => _profileApi ??= berth_api.ProfileApi(apiClient);
  berth_api.SessionsApi get sessionsApi => _sessionsApi ??= berth_api.SessionsApi(apiClient);
  berth_api.RolesApi get rolesApi => _rolesApi ??= berth_api.RolesApi(apiClient);
  berth_api.UsersApi get usersApi => _usersApi ??= berth_api.UsersApi(apiClient);
  berth_api.MaintenanceApi get maintenanceApi => _maintenanceApi ??= berth_api.MaintenanceApi(apiClient);
  berth_api.OperationLogsApi get operationLogsApi => _operationLogsApi ??= berth_api.OperationLogsApi(apiClient);
  berth_api.FilesApi get filesApi => _filesApi ??= berth_api.FilesApi(apiClient);
  berth_api.LogsApi get logsApi => _logsApi ??= berth_api.LogsApi(apiClient);
  berth_api.MigrationApi get migrationApi => _migrationApi ??= berth_api.MigrationApi(apiClient);
  berth_api.TotpApi get totpApi => _totpApi ??= berth_api.TotpApi(apiClient);
  berth_api.AuthApi get authApi => _authApi ??= berth_api.AuthApi(apiClient);

  void _clearApiInstances() {
    _serversApi = null;
    _stacksApi = null;
    _adminApi = null;
    _profileApi = null;
    _sessionsApi = null;
    _rolesApi = null;
    _usersApi = null;
    _maintenanceApi = null;
    _operationLogsApi = null;
    _filesApi = null;
    _logsApi = null;
    _migrationApi = null;
    _totpApi = null;
    _authApi = null;
  }
}
