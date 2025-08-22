import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user.dart';
import '../models/session.dart';
import 'api_client.dart';

class AuthService extends ChangeNotifier {
  final ApiClient _apiClient;
  static const _secureStorage = FlutterSecureStorage();
  
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
      final response = await _apiClient.post('/api/v1/auth/login', body: {
        'username': username,
        'password': password,
      });

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
      
      final response = await _apiClient.post('/api/v1/auth/register', body: {
        'username': username,
        'email': email,
        'password': password,
      });


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
      // Ignore logout errors - user will be logged out locally regardless
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
      await logout();
      return false;
    }
  }

  Future<bool> _refreshAccessToken() async {
    if (_refreshToken == null) {
      return false;
    }
    
    try {
      
      final response = await _apiClient.post('/api/v1/auth/refresh', body: {
        'refresh_token': _refreshToken!,
      });
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _accessToken = data['access_token'];
        _refreshToken = data['refresh_token'];
        
        await _saveTokensToStorage(_accessToken!, _refreshToken!);
        _apiClient.setAuthToken(_accessToken!);
        
        return true;
      } else {
        return false;
      }
    } catch (e) {
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

  Future<void> _saveUserToStorage(User user) async {
    await _secureStorage.write(key: 'current_user', value: json.encode(user.toJson()));
  }

  Future<User?> _getUserFromStorage() async {
    final userJson = await _secureStorage.read(key: 'current_user');
    if (userJson != null) {
      try {
        return User.fromJson(json.decode(userJson));
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
      
      final response = await _apiClient.post('/api/v1/auth/totp/verify', 
        body: {'code': code},
        headers: {'Authorization': 'Bearer $temporaryToken'},
      );
      

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
        return null;
      }
    } catch (e) {
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
        return false;
      }
    } catch (e) {
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
        return false;
      }
    } catch (e) {
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
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<UserSession>?> getSessions() async {
    try {
      
      final response = await _apiClient.post('/api/v1/sessions', body: {
        'refresh_token': _refreshToken!,
      });
      

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final sessionsResponse = SessionsResponse.fromJson(data);
        
        return sessionsResponse.sessions;
      } else {
        // Failed to fetch sessions
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> revokeSession(int sessionId) async {
    try {
      
      final response = await _apiClient.post('/api/v1/sessions/revoke', body: {
        'session_id': sessionId,
      });
      

      if (response.statusCode == 200) {
        return true;
      } else {
        // Failed to revoke session
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> revokeAllOtherSessions() async {
    try {
      
      final response = await _apiClient.post('/api/v1/sessions/revoke-all-others', body: {
        'refresh_token': _refreshToken!,
      });
      

      if (response.statusCode == 200) {
        return true;
      } else {
        // Failed to revoke all sessions
        return false;
      }
    } catch (e) {
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