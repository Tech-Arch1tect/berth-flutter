import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../services/auth_service.dart';
import '../widgets/app_drawer.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = context.watch<AuthService>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: const AppDrawer(currentRoute: '/profile'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            _buildProfileHeader(context, authService),
            
            const SizedBox(height: 32),
            
            // Account Information
            _buildSectionHeader(context, 'Account Information'),
            const SizedBox(height: 16),
            _buildAccountInfoSection(context, authService),
            
            const SizedBox(height: 32),
            
            // Security Settings
            _buildSectionHeader(context, 'Security'),
            const SizedBox(height: 16),
            _buildSecuritySection(context, authService),
            
            const SizedBox(height: 32),
            
            // App Settings
            _buildSectionHeader(context, 'Preferences'),
            const SizedBox(height: 16),
            _buildPreferencesSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, AuthService authService) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(
              Icons.person,
              size: 48,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            authService.currentUser?.username ?? 'User',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            authService.currentUser?.email ?? 'user@example.com',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAccountInfoSection(BuildContext context, AuthService authService) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          _buildInfoTile(
            context,
            Icons.badge,
            'Account ID',
            '${authService.currentUser?.id ?? 'N/A'}',
          ),
          const Divider(height: 1),
          _buildInfoTile(
            context,
            Icons.person,
            'Username',
            authService.currentUser?.username ?? 'N/A',
          ),
          const Divider(height: 1),
          _buildInfoTile(
            context,
            Icons.email,
            'Email Address',
            authService.currentUser?.email ?? 'N/A',
          ),
        ],
      ),
    );
  }

  Widget _buildSecuritySection(BuildContext context, AuthService authService) {
    final hasTOTP = authService.currentUser?.totpEnabled ?? false;
    
    return Card(
      elevation: 2,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.security,
              color: hasTOTP ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.warning,
            ),
            title: const Text('Two-Factor Authentication'),
            subtitle: Text(
              hasTOTP ? 'Enabled - Your account is protected' : 'Disabled - Consider enabling for better security',
              style: TextStyle(
                color: hasTOTP ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.warning,
              ),
            ),
            trailing: Icon(
              hasTOTP ? Icons.check_circle : Icons.warning,
              color: hasTOTP ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.warning,
            ),
            onTap: () {
              if (hasTOTP) {
                _showTOTPManagementDialog(context, authService);
              } else {
                context.go('/totp-setup');
              }
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(
              Icons.devices,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: const Text('Active Sessions'),
            subtitle: const Text('Manage your logged-in devices'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => context.go('/sessions'),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesSection(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.palette,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: const Text('Theme'),
            subtitle: const Text('Automatically follows system setting'),
            trailing: Icon(
              Icons.brightness_auto,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const Divider(height: 1),
          ListTile(
            leading: Icon(
              Icons.language,
              color: Theme.of(context).colorScheme.primary,
            ),
            title: const Text('Language'),
            subtitle: const Text('English (System default)'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Language settings - TODO: implement')),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(BuildContext context, IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(title),
      subtitle: Text(
        value,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
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
          'You can disable it from the main dashboard or sessions page.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.go('/dashboard');
            },
            child: const Text('Go to Dashboard'),
          ),
        ],
      ),
    );
  }
}