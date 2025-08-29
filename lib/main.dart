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
import 'screens/server_stacks_screen.dart';
import 'screens/stack_details_screen.dart';
import 'screens/sessions_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/account_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/more_screen.dart';
import 'screens/admin/users_screen.dart';
import 'screens/admin/roles_screen.dart';
import 'screens/admin/servers_screen.dart';
import 'screens/admin/role_stack_permissions_screen.dart';
import 'widgets/navigation_shell.dart';
import 'services/stack_service.dart';
import 'services/server_service.dart';
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
  late final StackService _stackService;
  late final ServerService _serverService;

  @override
  void initState() {
    super.initState();
    _apiClient = ApiClient();
    _authService = AuthService(_apiClient);
    _stackService = StackService(_apiClient);
    _serverService = ServerService(_apiClient);
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

    return BerthApp(
      configService: _configService,
      apiClient: _apiClient,
      authService: _authService,
      stackService: _stackService,
      serverService: _serverService,
    );
  }
}

class BerthApp extends StatelessWidget {
  final ConfigService configService;
  final ApiClient apiClient;
  final AuthService authService;
  final StackService stackService;
  final ServerService serverService;
  
  const BerthApp({
    super.key, 
    required this.configService,
    required this.apiClient,
    required this.authService,
    required this.stackService,
    required this.serverService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: configService),
        Provider.value(value: apiClient),
        ChangeNotifierProvider.value(value: authService),
        Provider.value(value: stackService),
        Provider.value(value: serverService),
      ],
      child: MaterialApp.router(
        title: 'Berth Mobile',
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
          builder: (context, state) => const NavigationShell(
            currentRoute: '/dashboard',
            child: DashboardScreen(),
          ),
        ),
        GoRoute(
          path: '/servers/:id/stacks',
          builder: (context, state) {
            final serverIdStr = state.pathParameters['id'];
            final serverId = int.tryParse(serverIdStr ?? '');
            if (serverId == null) {
              return const NavigationShell(
                currentRoute: '/dashboard',
                child: DashboardScreen(),
              );
            }
            return NavigationShell(
              currentRoute: '/servers/$serverId/stacks',
              child: ServerStacksScreen(
                serverId: serverId,
                stackService: context.read<StackService>(),
              ),
            );
          },
        ),
        GoRoute(
          path: '/servers/:serverId/stacks/:stackName',
          builder: (context, state) {
            final serverIdStr = state.pathParameters['serverId'];
            final stackName = state.pathParameters['stackName'];
            final serverId = int.tryParse(serverIdStr ?? '');
            
            if (serverId == null || stackName == null) {
              return const NavigationShell(
                currentRoute: '/dashboard',
                child: DashboardScreen(),
              );
            }
            
            return NavigationShell(
              currentRoute: '/servers/$serverId/stacks/$stackName',
              child: StackDetailsScreen(
                serverId: serverId,
                stackName: stackName,
                stackService: context.read<StackService>(),
              ),
            );
          },
        ),
        // Account tab routes
        GoRoute(
          path: '/account',
          builder: (context, state) => const NavigationShell(
            currentRoute: '/account',
            child: AccountScreen(),
          ),
        ),
        GoRoute(
          path: '/sessions',
          builder: (context, state) => const NavigationShell(
            currentRoute: '/sessions',
            child: SessionsScreen(),
          ),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const NavigationShell(
            currentRoute: '/profile',
            child: ProfileScreen(),
          ),
        ),

        // Admin tab routes
        GoRoute(
          path: '/admin',
          builder: (context, state) => const NavigationShell(
            currentRoute: '/admin',
            child: AdminScreen(),
          ),
        ),
        GoRoute(
          path: '/admin/users',
          builder: (context, state) => const NavigationShell(
            currentRoute: '/admin/users',
            child: UsersScreen(),
          ),
        ),
        GoRoute(
          path: '/admin/roles',
          builder: (context, state) => const NavigationShell(
            currentRoute: '/admin/roles',
            child: RolesScreen(),
          ),
        ),
        GoRoute(
          path: '/admin/servers',
          builder: (context, state) => const NavigationShell(
            currentRoute: '/admin/servers',
            child: ServersScreen(),
          ),
        ),

        // More tab route
        GoRoute(
          path: '/more',
          builder: (context, state) => const NavigationShell(
            currentRoute: '/more',
            child: MoreScreen(),
          ),
        ),
        GoRoute(
          path: '/admin/roles/:roleId/server-permissions',
          builder: (context, state) {
            final roleId = int.tryParse(state.pathParameters['roleId']!);
            if (roleId == null) {
              return const NavigationShell(
                currentRoute: '/admin/roles',
                child: RolesScreen(),
              );
            }
            return NavigationShell(
              currentRoute: '/admin/roles/$roleId/server-permissions',
              child: RoleStackPermissionsScreen(roleId: roleId),
            );
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
