import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../extensions/user_info_extensions.dart';
import '../services/auth_service.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  
  const BottomNavigation({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final authService = context.watch<AuthService>();
    
    final List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded),
        activeIcon: Icon(Icons.home_rounded),
        label: 'Home',
      ),
      if (authService.currentUser?.isAdmin ?? false) 
        const BottomNavigationBarItem(
          icon: Icon(Icons.admin_panel_settings_rounded),
          activeIcon: Icon(Icons.admin_panel_settings_rounded),
          label: 'Admin',
        ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_rounded),
        activeIcon: Icon(Icons.person_rounded),
        label: 'Account',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz_rounded),
        activeIcon: Icon(Icons.more_horiz_rounded),
        label: 'More',
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(
          top: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
            width: 0.5,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onTabTapped(context, index, authService),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        items: items,
      ),
    );
  }

  void _onTabTapped(BuildContext context, int index, AuthService authService) {
    if (index == currentIndex) return;

    if (!(authService.currentUser?.isAdmin ?? false)) {
      switch (index) {
        case 0:
          context.go('/dashboard');
          break;
        case 1:
          context.go('/account');
          break;
        case 2:
          context.go('/more');
          break;
      }
    } else {
      switch (index) {
        case 0:
          context.go('/dashboard');
          break;
        case 1:
          context.go('/admin');
          break;
        case 2:
          context.go('/account');
          break;
        case 3:
          context.go('/more');
          break;
      }
    }
  }
}