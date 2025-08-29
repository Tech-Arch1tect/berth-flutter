import 'package:flutter/material.dart';
import 'bottom_navigation.dart';

class NavigationShell extends StatelessWidget {
  final Widget child;
  final String currentRoute;
  
  const NavigationShell({
    super.key,
    required this.child,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    final int currentIndex = _getNavigationIndex(currentRoute);
    
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigation(currentIndex: currentIndex),
    );
  }

  int _getNavigationIndex(String route) {
    if (route.startsWith('/dashboard') || route.startsWith('/servers')) {
      return 0;
    } else if (route.startsWith('/admin')) {
      return 1;
    } else if (route.startsWith('/account') || route.startsWith('/profile') || route.startsWith('/sessions')) {
      return 2;
    } else if (route.startsWith('/more')) {
      return 3;
    }
    return 0;
  }
}