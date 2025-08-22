import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';
import '../theme/app_theme.dart';

class AppDrawer extends StatelessWidget {
  final String currentRoute;
  
  const AppDrawer({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    final authService = context.read<AuthService>();
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            accountName: Text(
              authService.currentUser?.username ?? 'User',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            accountEmail: Text(
              authService.currentUser?.email ?? '',
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            selected: currentRoute == '/dashboard',
            onTap: () {
              Navigator.pop(context);
              if (currentRoute != '/dashboard') {
                context.go('/dashboard');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.devices),
            title: const Text('Active Sessions'),
            selected: currentRoute == '/sessions',
            onTap: () {
              Navigator.pop(context);
              if (currentRoute != '/sessions') {
                context.go('/sessions');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Two-Factor Authentication'),
            selected: currentRoute == '/totp-setup',
            onTap: () {
              Navigator.pop(context);
              if (authService.currentUser?.totpEnabled == true) {
                _showTOTPManagementDialog(context, authService);
              } else {
                if (currentRoute != '/totp-setup') {
                  context.go('/totp-setup');
                }
              }
            },
          ),
          if (authService.currentUser?.isAdmin == true) ...[
            const Divider(),
            ListTile(
              leading: const Icon(Icons.admin_panel_settings),
              title: const Text('User Management'),
              selected: currentRoute == '/admin/users',
              onTap: () {
                Navigator.pop(context);
                if (currentRoute != '/admin/users') {
                  context.go('/admin/users');
                }
              },
            ),
          ],
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            selected: currentRoute == '/profile',
            onTap: () {
              Navigator.pop(context);
              if (currentRoute != '/profile') {
                context.go('/profile');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings - TODO: implement navigation')),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.error),
            title: Text('Logout', style: TextStyle(color: Theme.of(context).colorScheme.error)),
            onTap: () async {
              Navigator.pop(context);
              await authService.logout();
              if (context.mounted) {
                context.go('/login');
              }
            },
          ),
        ],
      ),
    );
  }

  void _showTOTPManagementDialog(BuildContext context, AuthService authService) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Manage Two-Factor Authentication'),
        content: const Text(
          'Two-factor authentication is currently enabled for your account. '
          'To disable it, you would need to provide your current TOTP code and password.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showDisableTOTPDialog(context, authService);
            },
            child: const Text('Disable 2FA'),
          ),
        ],
      ),
    );
  }

  void _showDisableTOTPDialog(BuildContext context, AuthService authService) {
    final codeController = TextEditingController();
    final passwordController = TextEditingController();
    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text('Disable Two-Factor Authentication'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'To disable two-factor authentication, please enter your current TOTP code and password:',
              ),
              const SizedBox(height: 16),
              TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: 'TOTP Code',
                  hintText: 'Enter 6-digit code',
                ),
                keyboardType: TextInputType.number,
                maxLength: 6,
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: isLoading ? null : () async {
                setState(() => isLoading = true);
                
                final success = await authService.disableTOTP(
                  codeController.text.trim(),
                  passwordController.text,
                );
                
                if (context.mounted) {
                  Navigator.of(context).pop();
                  
                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Two-factor authentication has been disabled'),
                        backgroundColor: Theme.of(context).colorScheme.success,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Failed to disable two-factor authentication'),
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                    );
                  }
                }
                
                setState(() => isLoading = false);
              },
              child: isLoading 
                  ? const SizedBox(
                      width: 16, 
                      height: 16, 
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Disable'),
            ),
          ],
        ),
      ),
    );
  }
}