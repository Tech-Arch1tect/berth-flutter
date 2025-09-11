import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Administration',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Manage users, servers, and system configuration',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              
              const SizedBox(height: 32),

              _buildAdminSection(
                context: context,
                title: 'User Management',
                items: [
                  _AdminItem(
                    icon: Icons.people_rounded,
                    title: 'Users',
                    subtitle: 'Manage user accounts and permissions',
                    route: '/admin/users',
                    color: AppTheme.primaryBlue,
                  ),
                  _AdminItem(
                    icon: Icons.admin_panel_settings_rounded,
                    title: 'Roles',
                    subtitle: 'Configure user roles and permissions',
                    route: '/admin/roles',
                    color: AppTheme.primaryPurple,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              _buildAdminSection(
                context: context,
                title: 'Infrastructure',
                items: [
                  _AdminItem(
                    icon: Icons.dns_rounded,
                    title: 'Servers',
                    subtitle: 'Manage Docker servers and agents',
                    route: '/admin/servers',
                    color: Colors.orange,
                  ),
                  _AdminItem(
                    icon: Icons.history_rounded,
                    title: 'Operation Logs',
                    subtitle: 'View all system operation history',
                    route: '/admin/operation-logs',
                    color: Colors.teal,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              _buildAdminSection(
                context: context,
                title: 'System',
                items: [
                  _AdminItem(
                    icon: Icons.backup_rounded,
                    title: 'Data Migration',
                    subtitle: 'Export and import system configuration',
                    route: '/admin/migration',
                    color: Colors.indigo,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdminSection({
    required BuildContext context,
    required String title,
    required List<_AdminItem> items,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        GlassCard(
          child: Column(
            children: [
              for (int i = 0; i < items.length; i++) ...[
                _buildAdminItem(context, items[i]),
                if (i < items.length - 1) const Divider(height: 1),
              ],
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAdminItem(BuildContext context, _AdminItem item) {
    final colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => context.push(item.route),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: item.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  item.icon,
                  color: item.color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: colorScheme.onSurfaceVariant,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdminItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final String route;
  final Color color;

  const _AdminItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.route,
    required this.color,
  });
}