class UserSession {
  final int id;
  final int userId;
  final String token;
  final String type;
  final String ipAddress;
  final String userAgent;
  final bool current;
  final DateTime createdAt;
  final DateTime lastUsed;
  final DateTime expiresAt;
  
  final String location;
  final String browser;
  final String os;
  final String deviceType;
  final String device;
  final bool mobile;
  final bool tablet;
  final bool desktop;
  final bool bot;

  UserSession({
    required this.id,
    required this.userId,
    required this.token,
    required this.type,
    required this.ipAddress,
    required this.userAgent,
    required this.current,
    required this.createdAt,
    required this.lastUsed,
    required this.expiresAt,
    required this.location,
    required this.browser,
    required this.os,
    required this.deviceType,
    required this.device,
    required this.mobile,
    required this.tablet,
    required this.desktop,
    required this.bot,
  });

  factory UserSession.fromJson(Map<String, dynamic> json) {
    return UserSession(
      id: json['id'],
      userId: json['user_id'] ?? 0,
      token: json['token'] ?? '',
      type: json['type'] ?? 'web',
      ipAddress: json['ip_address'] ?? '',
      userAgent: json['user_agent'] ?? '',
      current: json['current'] ?? false,
      createdAt: DateTime.parse(json['created_at']),
      lastUsed: DateTime.parse(json['last_used']),
      expiresAt: DateTime.parse(json['expires_at']),
      location: json['location'] ?? 'Unknown Location',
      browser: json['browser'] ?? 'Unknown Browser',
      os: json['os'] ?? 'Unknown OS',
      deviceType: json['device_type'] ?? 'Unknown',
      device: json['device'] ?? 'Unknown Device',
      mobile: json['mobile'] ?? false,
      tablet: json['tablet'] ?? false,
      desktop: json['desktop'] ?? false,
      bot: json['bot'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'token': token,
      'type': type,
      'ip_address': ipAddress,
      'user_agent': userAgent,
      'current': current,
      'created_at': createdAt.toIso8601String(),
      'last_used': lastUsed.toIso8601String(),
      'expires_at': expiresAt.toIso8601String(),
      'location': location,
      'browser': browser,
      'os': os,
      'device_type': deviceType,
      'device': device,
      'mobile': mobile,
      'tablet': tablet,
      'desktop': desktop,
      'bot': bot,
    };
  }

  String get deviceInfo {
    return device;
  }

  String get browserInfo {
    return browser;
  }

  bool get isExpired => DateTime.now().isAfter(expiresAt);
}

class SessionsResponse {
  final List<UserSession> sessions;

  SessionsResponse({required this.sessions});

  factory SessionsResponse.fromJson(Map<String, dynamic> json) {
    var sessionsList = json['sessions'] as List;
    List<UserSession> sessions = sessionsList.map((sessionJson) => 
        UserSession.fromJson(sessionJson)).toList();

    return SessionsResponse(sessions: sessions);
  }
}