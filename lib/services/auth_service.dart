import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:berth_api/api.dart' as berth_api;
import 'berth_api_provider.dart';

class AuthService extends ChangeNotifier {
  final BerthApiProvider _berthApiProvider;
  static const _secureStorage = FlutterSecureStorage();

  berth_api.UserInfo? _currentUser;
  bool _isLoading = false;
  String? _accessToken;
  String? _refreshToken;

  AuthService(this._berthApiProvider) {
    _berthApiProvider.setTokenRefreshCallback(() async {
      return await _refreshAccessToken();
    });
  }

  berth_api.UserInfo? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null && _accessToken != null;
  bool get isLoading => _isLoading;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<AuthResponse> login(String username, String password) async {
    _setLoading(true);

    try {
      final request = berth_api.AuthLoginRequest(
        username: username,
        password: password,
      );

      final response = await _berthApiProvider.authApi.apiV1AuthLoginPostWithHttpInfo(request);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['totp_required'] == true) {
          return AuthResponse(
            success: true,
            message: data['message'] ?? 'Two-factor authentication required',
            totpRequired: true,
            temporaryToken: data['temporary_token'],
          );
        }

        final loginResponse = berth_api.AuthLoginResponse.fromJson(data);
        if (loginResponse != null) {
          _accessToken = loginResponse.accessToken;
          _refreshToken = loginResponse.refreshToken;
          _currentUser = loginResponse.user;

          await _saveTokensToStorage(_accessToken!, _refreshToken!);
          await _saveUserToStorage(_currentUser!);

          _berthApiProvider.setAuthToken(_accessToken!);

          notifyListeners();

          return AuthResponse(
            success: true,
            message: 'Login successful',
            user: _currentUser,
          );
        } else {
          return AuthResponse(
            success: false,
            message: 'Login failed - invalid response format',
          );
        }
      } else if (response.statusCode == 401) {
        final data = json.decode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Invalid credentials',
        );
      } else if (response.statusCode == 403) {
        final data = json.decode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Email verification required',
        );
      } else {
        final data = json.decode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Login failed. Please try again.',
        );
      }
    } catch (e) {
      debugPrint('Login error: $e');
      return AuthResponse(
        success: false,
        message: 'Network error. Please check your connection.',
      );
    } finally {
      _setLoading(false);
    }
  }


  Future<void> logout() async {
    _setLoading(true);

    try {
      if (_accessToken != null && _refreshToken != null) {
        final request = berth_api.AuthLogoutRequest(
          refreshToken: _refreshToken!,
        );
        await _berthApiProvider.authApi.apiV1AuthLogoutPost(request);
      }
    } catch (e) {
      debugPrint('Logout error (ignored): $e');
    } finally {
      _currentUser = null;
      _accessToken = null;
      _refreshToken = null;

      await _clearTokensFromStorage();
      await _removeUserFromStorage();

      _berthApiProvider.clearAuthToken();

      notifyListeners();
      _setLoading(false);
    }
  }

  Future<bool> checkAuthStatus() async {
    try {
      final tokens = await _getTokensFromStorage();
      if (tokens['access_token'] == null) {
        return false;
      }

      _accessToken = tokens['access_token'];
      _refreshToken = tokens['refresh_token'];
      _berthApiProvider.setAuthToken(_accessToken!);

      _currentUser = await _getUserFromStorage();

      final response = await _berthApiProvider.profileApi.apiV1ProfileGet();

      if (response != null) {
        _currentUser = response.data;
        await _saveUserToStorage(_currentUser!);
        notifyListeners();
        return true;
      } else {
        final refreshResult = await _refreshAccessToken();
        if (refreshResult) {
          final retryResponse = await _berthApiProvider.profileApi.apiV1ProfileGet();
          if (retryResponse != null) {
            _currentUser = retryResponse.data;
            await _saveUserToStorage(_currentUser!);
            notifyListeners();
            return true;
          }
        }

        await logout();
        return false;
      }
    } on berth_api.ApiException catch (e) {
      if (e.code == 401) {
        final refreshResult = await _refreshAccessToken();
        if (refreshResult) {
          try {
            final retryResponse = await _berthApiProvider.profileApi.apiV1ProfileGet();
            if (retryResponse != null) {
              _currentUser = retryResponse.data;
              await _saveUserToStorage(_currentUser!);
              notifyListeners();
              return true;
            }
          } catch (e) {
            debugPrint('Retry after refresh failed: $e');
          }
        }
      }
      await logout();
      return false;
    } catch (e) {
      debugPrint('Check auth status error: $e');
      await logout();
      return false;
    }
  }

  Future<bool> _refreshAccessToken() async {
    if (_refreshToken == null) {
      debugPrint('Token refresh: No refresh token available');
      return false;
    }

    try {
      debugPrint('Token refresh: Attempting to refresh access token...');
      final request = berth_api.AuthRefreshRequest(
        refreshToken: _refreshToken!,
      );

      final response = await _berthApiProvider.authApi.apiV1AuthRefreshPost(request);

      if (response != null) {
        _accessToken = response.accessToken;
        _refreshToken = response.refreshToken;

        await _saveTokensToStorage(_accessToken!, _refreshToken!);
        _berthApiProvider.setAuthToken(_accessToken!);

        debugPrint('Token refresh: Successfully refreshed access token');
        return true;
      } else {
        debugPrint('Token refresh: Failed - null response');
        return false;
      }
    } catch (e) {
      debugPrint('Token refresh: Error - $e');
      return false;
    }
  }

  Future<void> _saveTokensToStorage(String accessToken, String refreshToken) async {
    await _secureStorage.write(key: 'access_token', value: accessToken);
    await _secureStorage.write(key: 'refresh_token', value: refreshToken);
  }

  Future<Map<String, String?>> _getTokensFromStorage() async {
    final accessToken = await _secureStorage.read(key: 'access_token');
    final refreshToken = await _secureStorage.read(key: 'refresh_token');
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  Future<void> _clearTokensFromStorage() async {
    await _secureStorage.delete(key: 'access_token');
    await _secureStorage.delete(key: 'refresh_token');
  }

  Future<void> _saveUserToStorage(berth_api.UserInfo user) async {
    await _secureStorage.write(key: 'current_user', value: json.encode(user.toJson()));
  }

  Future<berth_api.UserInfo?> _getUserFromStorage() async {
    final userJson = await _secureStorage.read(key: 'current_user');
    if (userJson != null) {
      try {
        return berth_api.UserInfo.fromJson(json.decode(userJson));
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  Future<void> _removeUserFromStorage() async {
    await _secureStorage.delete(key: 'current_user');
  }

  Future<AuthResponse> verifyTOTP(String temporaryToken, String code) async {
    _setLoading(true);

    try {
      _berthApiProvider.setAuthToken(temporaryToken);

      final request = berth_api.AuthTOTPVerifyRequest(
        code: code,
      );

      final response = await _berthApiProvider.authApi.apiV1AuthTotpVerifyPost(request);

      if (response != null) {
        _accessToken = response.accessToken;
        _refreshToken = response.refreshToken;
        _currentUser = response.user;

        await _saveTokensToStorage(_accessToken!, _refreshToken!);
        await _saveUserToStorage(_currentUser!);

        _berthApiProvider.setAuthToken(_accessToken!);

        notifyListeners();

        return AuthResponse(
          success: true,
          message: 'Two-factor authentication successful',
          user: _currentUser,
        );
      } else {
        _berthApiProvider.clearAuthToken();
        return AuthResponse(
          success: false,
          message: 'TOTP verification failed - invalid response format',
        );
      }
    } on berth_api.ApiException catch (e) {
      _berthApiProvider.clearAuthToken();
      String message = 'TOTP verification failed. Please try again.';
      if (e.code == 401) {
        message = 'Invalid TOTP code';
      }
      return AuthResponse(
        success: false,
        message: message,
      );
    } catch (e) {
      _berthApiProvider.clearAuthToken();
      debugPrint('TOTP verify error: $e');
      return AuthResponse(
        success: false,
        message: 'Network error. Please check your connection.',
      );
    } finally {
      _setLoading(false);
    }
  }

  Future<berth_api.TOTPSetupResponse?> getTOTPSetup() async {
    try {
      return await _berthApiProvider.totpApi.apiV1TotpSetupGet();
    } catch (e) {
      debugPrint('Get TOTP setup error: $e');
      return null;
    }
  }

  Future<bool> enableTOTP(String code) async {
    try {
      final request = berth_api.TOTPEnableRequest(
        code: code,
      );

      final response = await _berthApiProvider.totpApi.apiV1TotpEnablePost(request);

      if (response != null) {
        if (_currentUser != null) {
          _currentUser!.totpEnabled = true;
          await _saveUserToStorage(_currentUser!);
          notifyListeners();
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('Enable TOTP error: $e');
      return false;
    }
  }

  Future<bool> disableTOTP(String code, String password) async {
    try {
      final request = berth_api.TOTPDisableRequest(
        code: code,
        password: password,
      );

      final response = await _berthApiProvider.totpApi.apiV1TotpDisablePost(request);

      if (response != null) {
        if (_currentUser != null) {
          _currentUser!.totpEnabled = false;
          await _saveUserToStorage(_currentUser!);
          notifyListeners();
        }
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint('Disable TOTP error: $e');
      return false;
    }
  }

  Future<berth_api.TOTPStatusResponse?> getTOTPStatus() async {
    try {
      return await _berthApiProvider.totpApi.apiV1TotpStatusGet();
    } catch (e) {
      debugPrint('Get TOTP status error: $e');
      return null;
    }
  }

  Future<List<berth_api.SessionItem>?> getSessions() async {
    try {
      final request = berth_api.GetSessionsRequest(
        refreshToken: _refreshToken!,
      );

      final response = await _berthApiProvider.sessionsApi.apiV1SessionsPost(request);

      if (response != null) {
        return response.sessions;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint('Get sessions error: $e');
      return null;
    }
  }

  Future<bool> revokeSession(int sessionId) async {
    try {
      final request = berth_api.RevokeSessionRequest(
        sessionId: sessionId,
      );

      final response = await _berthApiProvider.sessionsApi.apiV1SessionsRevokePost(request);

      return response != null;
    } catch (e) {
      debugPrint('Revoke session error: $e');
      return false;
    }
  }

  Future<bool> revokeAllOtherSessions() async {
    try {
      final request = berth_api.RevokeAllOtherSessionsRequest(
        refreshToken: _refreshToken!,
      );

      final response = await _berthApiProvider.sessionsApi.apiV1SessionsRevokeAllOthersPost(request);

      return response != null;
    } catch (e) {
      debugPrint('Revoke all other sessions error: $e');
      return false;
    }
  }
}

class AuthResponse {
  final bool success;
  final String message;
  final berth_api.UserInfo? user;
  final bool totpRequired;
  final String? temporaryToken;

  AuthResponse({
    required this.success,
    required this.message,
    this.user,
    this.totpRequired = false,
    this.temporaryToken,
  });
}
