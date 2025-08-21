import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../models/session.dart';
import 'api_client.dart';

class AuthService extends ChangeNotifier {
  final ApiClient _apiClient;
  
  User? _currentUser;
  bool _isLoading = false;
  String? _accessToken;
  String? _refreshToken;

  AuthService(this._apiClient) {
    _apiClient.setTokenRefreshCallback(() async {
      return await _refreshAccessToken();
    });
  }

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null && _accessToken != null;
  bool get isLoading => _isLoading;

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<AuthResponse> login(String username, String password) async {
    _setLoading(true);
    
    try {
      print('Attempting JWT login with username: $username');
      
      final response = await _apiClient.post('/api/v1/auth/login', body: {
        'username': username,
        'password': password,
      });
      
      print('JWT login response: ${response.statusCode}');
      print('JWT login response body: ${response.body}');

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
        
        _accessToken = data['access_token'];
        _refreshToken = data['refresh_token'];
        
        if (data['user'] != null) {
          _currentUser = User.fromJson(data['user']);
          
          await _saveTokensToStorage(_accessToken!, _refreshToken!);
          await _saveUserToStorage(_currentUser!);
          
          _apiClient.setAuthToken(_accessToken!);
          
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
      print('JWT login error: $e');
      return AuthResponse(
        success: false,
        message: 'Network error. Please check your connection.',
      );
    } finally {
      _setLoading(false);
    }
  }

  Future<AuthResponse> register({
    required String username,
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    
    try {
      print('Attempting JWT registration with username: $username');
      
      final response = await _apiClient.post('/api/v1/auth/register', body: {
        'username': username,
        'email': email,
        'password': password,
      });

      print('JWT register response: ${response.statusCode}');
      print('JWT register response body: ${response.body}');

      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        
        if (data['access_token'] != null && data['user'] != null) {
          _accessToken = data['access_token'];
          _refreshToken = data['refresh_token'];
          _currentUser = User.fromJson(data['user']);
          
          await _saveTokensToStorage(_accessToken!, _refreshToken!);
          await _saveUserToStorage(_currentUser!);
          _apiClient.setAuthToken(_accessToken!);
          
          notifyListeners();
          
          return AuthResponse(
            success: true,
            message: 'Registration successful! You are now logged in.',
            user: _currentUser,
          );
        } else {
          return AuthResponse(
            success: true,
            message: data['message'] ?? 'Registration successful! Please verify your email.',
          );
        }
      } else if (response.statusCode == 400) {
        final data = json.decode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Invalid registration data',
        );
      } else if (response.statusCode == 409) {
        final data = json.decode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Username or email already exists',
        );
      } else {
        final data = json.decode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Registration failed. Please try again.',
        );
      }
    } catch (e) {
      print('JWT registration error: $e');
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
        await _apiClient.post('/api/v1/auth/logout', body: {
          'refresh_token': _refreshToken!,
        });
      }
    } catch (e) {
      print('Logout API call failed: $e');
    } finally {
      _currentUser = null;
      _accessToken = null;
      _refreshToken = null;
      
      await _clearTokensFromStorage();
      await _removeUserFromStorage();
      
      _apiClient.clearAuthToken();
      
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
      _apiClient.setAuthToken(_accessToken!);
      
      _currentUser = await _getUserFromStorage();
      
      final response = await _apiClient.get('/api/v1/profile');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _currentUser = User.fromJson(data);
        await _saveUserToStorage(_currentUser!);
        notifyListeners();
        return true;
      } else if (response.statusCode == 401) {
        final refreshResult = await _refreshAccessToken();
        if (refreshResult) {
          final retryResponse = await _apiClient.get('/api/v1/profile');
          if (retryResponse.statusCode == 200) {
            final data = json.decode(retryResponse.body);
            _currentUser = User.fromJson(data);
            await _saveUserToStorage(_currentUser!);
            notifyListeners();
            return true;
          }
        }
        
        await logout();
        return false;
      } else {
        await logout();
        return false;
      }
    } catch (e) {
      print('Auth status check failed: $e');
      await logout();
      return false;
    }
  }

  Future<bool> _refreshAccessToken() async {
    if (_refreshToken == null) {
      return false;
    }
    
    try {
      print('Attempting to refresh JWT token');
      
      final response = await _apiClient.post('/api/v1/auth/refresh', body: {
        'refresh_token': _refreshToken!,
      });
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _accessToken = data['access_token'];
        _refreshToken = data['refresh_token'];
        
        await _saveTokensToStorage(_accessToken!, _refreshToken!);
        _apiClient.setAuthToken(_accessToken!);
        
        print('JWT token refreshed successfully');
        return true;
      } else {
        print('JWT token refresh failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('JWT token refresh error: $e');
      return false;
    }
  }

  Future<void> _saveTokensToStorage(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', accessToken);
    await prefs.setString('refresh_token', refreshToken);
  }

  Future<Map<String, String?>> _getTokensFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('access_token');
    final refreshToken = prefs.getString('refresh_token');
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
    };
  }

  Future<void> _clearTokensFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
    await prefs.remove('refresh_token');
  }

  Future<void> _saveUserToStorage(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('current_user', json.encode(user.toJson()));
  }

  Future<User?> _getUserFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('current_user');
    if (userJson != null) {
      try {
        return User.fromJson(json.decode(userJson));
      } catch (e) {
        print('Failed to parse user from storage: $e');
        return null;
      }
    }
    return null;
  }

  Future<void> _removeUserFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('current_user');
  }

  Future<AuthResponse> verifyTOTP(String temporaryToken, String code) async {
    _setLoading(true);
    
    try {
      print('Attempting TOTP verification with code: $code');
      
      final response = await _apiClient.post('/api/v1/auth/totp/verify', 
        body: {'code': code},
        headers: {'Authorization': 'Bearer $temporaryToken'},
      );
      
      print('TOTP verify response: ${response.statusCode}');
      print('TOTP verify response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        _accessToken = data['access_token'];
        _refreshToken = data['refresh_token'];
        
        if (data['user'] != null) {
          _currentUser = User.fromJson(data['user']);
          
          await _saveTokensToStorage(_accessToken!, _refreshToken!);
          await _saveUserToStorage(_currentUser!);
          
          _apiClient.setAuthToken(_accessToken!);
          
          notifyListeners();
          
          return AuthResponse(
            success: true,
            message: 'Two-factor authentication successful',
            user: _currentUser,
          );
        } else {
          return AuthResponse(
            success: false,
            message: 'TOTP verification failed - invalid response format',
          );
        }
      } else if (response.statusCode == 401) {
        final data = json.decode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'Invalid TOTP code',
        );
      } else {
        final data = json.decode(response.body);
        return AuthResponse(
          success: false,
          message: data['message'] ?? 'TOTP verification failed. Please try again.',
        );
      }
    } catch (e) {
      print('TOTP verification error: $e');
      return AuthResponse(
        success: false,
        message: 'Network error. Please check your connection.',
      );
    } finally {
      _setLoading(false);
    }
  }

  Future<TOTPSetupResponse?> getTOTPSetup() async {
    try {
      final response = await _apiClient.get('/api/v1/totp/setup');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TOTPSetupResponse.fromJson(data);
      } else {
        print('TOTP setup failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('TOTP setup error: $e');
      return null;
    }
  }

  Future<bool> enableTOTP(String code) async {
    try {
      final response = await _apiClient.post('/api/v1/totp/enable', body: {
        'code': code,
      });
      
      if (response.statusCode == 200) {
        if (_currentUser != null) {
          final updatedUserJson = _currentUser!.toJson();
          updatedUserJson['totp_enabled'] = true;
          _currentUser = User.fromJson(updatedUserJson);
          await _saveUserToStorage(_currentUser!);
          notifyListeners();
        }
        return true;
      } else {
        print('TOTP enable failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('TOTP enable error: $e');
      return false;
    }
  }

  Future<bool> disableTOTP(String code, String password) async {
    try {
      final response = await _apiClient.post('/api/v1/totp/disable', body: {
        'code': code,
        'password': password,
      });
      
      if (response.statusCode == 200) {
        if (_currentUser != null) {
          final updatedUserJson = _currentUser!.toJson();
          updatedUserJson['totp_enabled'] = false;
          _currentUser = User.fromJson(updatedUserJson);
          await _saveUserToStorage(_currentUser!);
          notifyListeners();
        }
        return true;
      } else {
        print('TOTP disable failed: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('TOTP disable error: $e');
      return false;
    }
  }

  Future<TOTPStatusResponse?> getTOTPStatus() async {
    try {
      final response = await _apiClient.get('/api/v1/totp/status');
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return TOTPStatusResponse.fromJson(data);
      } else {
        print('TOTP status failed: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('TOTP status error: $e');
      return null;
    }
  }

  Future<List<UserSession>?> getSessions() async {
    try {
      print('Attempting to fetch user sessions');
      
      final response = await _apiClient.post('/api/v1/sessions', body: {
        'refresh_token': _refreshToken!,
      });
      
      print('Sessions response: ${response.statusCode}');
      print('Sessions response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Sessions data: $data');
        final sessionsResponse = SessionsResponse.fromJson(data);
        
        return sessionsResponse.sessions;
      } else {
        final data = json.decode(response.body);
        print('Failed to fetch sessions: ${data['message']}');
        return null;
      }
    } catch (e) {
      print('Sessions fetch error: $e');
      return null;
    }
  }

  Future<bool> revokeSession(int sessionId) async {
    try {
      print('Attempting to revoke session: $sessionId');
      
      final response = await _apiClient.post('/api/v1/sessions/revoke', body: {
        'session_id': sessionId,
      });
      
      print('Revoke session response: ${response.statusCode}');
      print('Revoke session response body: ${response.body}');

      if (response.statusCode == 200) {
        print('Session revoked successfully');
        return true;
      } else {
        final data = json.decode(response.body);
        print('Failed to revoke session: ${data['message']}');
        return false;
      }
    } catch (e) {
      print('Session revoke error: $e');
      return false;
    }
  }

  Future<bool> revokeAllOtherSessions() async {
    try {
      print('Attempting to revoke all other sessions');
      
      final response = await _apiClient.post('/api/v1/sessions/revoke-all-others', body: {
        'refresh_token': _refreshToken!,
      });
      
      print('Revoke all sessions response: ${response.statusCode}');
      print('Revoke all sessions response body: ${response.body}');

      if (response.statusCode == 200) {
        print('All other sessions revoked successfully');
        return true;
      } else {
        final data = json.decode(response.body);
        print('Failed to revoke all sessions: ${data['message']}');
        return false;
      }
    } catch (e) {
      print('Revoke all sessions error: $e');
      return false;
    }
  }
}

class AuthResponse {
  final bool success;
  final String message;
  final User? user;
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

class TOTPSetupResponse {
  final String qrCodeURI;
  final String secret;

  TOTPSetupResponse({
    required this.qrCodeURI,
    required this.secret,
  });

  factory TOTPSetupResponse.fromJson(Map<String, dynamic> json) {
    return TOTPSetupResponse(
      qrCodeURI: json['qr_code_uri'],
      secret: json['secret'],
    );
  }
}

class TOTPStatusResponse {
  final bool enabled;

  TOTPStatusResponse({required this.enabled});

  factory TOTPStatusResponse.fromJson(Map<String, dynamic> json) {
    return TOTPStatusResponse(enabled: json['enabled']);
  }
}