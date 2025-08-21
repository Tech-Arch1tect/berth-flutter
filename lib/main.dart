import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/config_service.dart';
import 'services/auth_service.dart';
import 'services/api_client.dart';

void main() {
  runApp(const AppInitializer());
}

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  bool _initialized = false;
  final _configService = ConfigService();
  late final ApiClient _apiClient;
  late final AuthService _authService;

  @override
  void initState() {
    super.initState();
    _apiClient = ApiClient();
    _authService = AuthService(_apiClient);
    _initialize();
  }

  Future<void> _initialize() async {
    await _configService.loadConfiguration();
    
    if (_configService.isConfigured) {
      _apiClient.setBaseUrl(_configService.serverUrl!);
      
      await _authService.checkAuthStatus();
    }
    
    setState(() {
      _initialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return BrxApp(
      configService: _configService,
      apiClient: _apiClient,
      authService: _authService,
    );
  }
}

class BrxApp extends StatelessWidget {
  final ConfigService configService;
  final ApiClient apiClient;
  final AuthService authService;
  
  const BrxApp({
    super.key, 
    required this.configService,
    required this.apiClient,
    required this.authService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: configService),
        Provider.value(value: apiClient),
        ChangeNotifierProvider.value(value: authService),
      ],
      child: MaterialApp(
        title: 'BRX Mobile',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
          ),
        ),
        home: const Scaffold(
          body: Center(
            child: Text('BRX Mobile App - Ready for routing'),
          ),
        ),
      ),
    );
  }
}
