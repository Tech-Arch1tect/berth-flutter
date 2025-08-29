class AppConfig {
  static const String appName = 'Berth';
  static const String appVersion = '1.0.0';
  
  static const String mobileAppHeader = 'X-Mobile-App';
  static const String mobileAppIdentifier = 'berth-flutter';
  static const String userAgent = 'Berth-Flutter-Mobile-App/1.0';
  
  static const int apiTimeoutSeconds = 30;
  static const int refreshTokenTimeoutSeconds = 10;
  
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}