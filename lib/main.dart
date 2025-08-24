import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'services/config_service.dart';
import 'services/auth_service.dart';
import 'services/api_client.dart';
import 'screens/setup/simple_server_setup.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/auth/totp_setup_screen.dart';
import 'screens/auth/totp_verify_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/sessions_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/admin/users_screen.dart';
import 'screens/admin/roles_screen.dart';
import 'screens/admin/servers_screen.dart';
import 'screens/admin/role_server_permissions_screen.dart';
import 'theme/app_theme.dart';

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
      child: MaterialApp.router(
        title: 'BRX Mobile',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: _createRouter(),
      ),
    );
  }

  GoRouter _createRouter() {
    return GoRouter(
      initialLocation: _getInitialLocation(),
      redirect: (context, state) {
        final isConfigured = configService.isConfigured;
        final isAuthenticated = authService.isAuthenticated;
        final path = state.fullPath;

        if (!isConfigured && path != '/server-setup') {
          return '/server-setup';
        }

        if (isConfigured && !isAuthenticated && 
            !path!.startsWith('/login') && 
            !path.startsWith('/register') &&
            !path.startsWith('/totp-verify') &&
            path != '/server-setup') {
          return '/login';
        }

        if (isAuthenticated && (path == '/login' || path == '/register')) {
          return '/dashboard';
        }

        return null;
      },
      routes: [
        GoRoute(
          path: '/server-setup',
          builder: (context, state) => const SimpleServerSetupScreen(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: '/totp-verify',
          builder: (context, state) {
            final temporaryToken = state.extra as String?;
            if (temporaryToken == null) {
              return const LoginScreen();
            }
            return TOTPVerifyScreen(temporaryToken: temporaryToken);
          },
        ),
        GoRoute(
          path: '/totp-setup',
          builder: (context, state) => const TOTPSetupScreen(),
        ),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/sessions',
          builder: (context, state) => const SessionsScreen(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/admin/users',
          builder: (context, state) => const UsersScreen(),
        ),
        GoRoute(
          path: '/admin/roles',
          builder: (context, state) => const RolesScreen(),
        ),
        GoRoute(
          path: '/admin/servers',
          builder: (context, state) => const ServersScreen(),
        ),
        GoRoute(
          path: '/admin/roles/:roleId/server-permissions',
          builder: (context, state) {
            final roleId = int.tryParse(state.pathParameters['roleId']!);
            if (roleId == null) {
              return const RolesScreen();
            }
            return RoleServerPermissionsScreen(roleId: roleId);
          },
        ),
      ],
    );
  }

  String _getInitialLocation() {
    if (!configService.isConfigured) {
      return '/server-setup';
    }
    
    if (authService.isAuthenticated) {
      return '/dashboard';
    }
    
    return '/login';
  }
}
