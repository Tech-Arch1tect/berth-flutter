class AppConfig {
  static const String appName = 'BRX Starter Flutter App';
  static const String appVersion = '1.0.0';
  
  static const String mobileAppHeader = 'X-Mobile-App';
  static const String mobileAppIdentifier = 'brx-flutter';
  static const String userAgent = 'BRX-Flutter-Mobile-App/1.0';
  
  static const int apiTimeoutSeconds = 30;
  static const int refreshTokenTimeoutSeconds = 10;
  
  static const Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}