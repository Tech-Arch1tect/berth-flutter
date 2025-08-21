import 'package:flutter/material.dart';

extension CustomColorScheme on ColorScheme {
  Color get success => brightness == Brightness.light ? const Color(0xFF2E7D32) : const Color(0xFF4CAF50);
  Color get onSuccess => brightness == Brightness.light ? Colors.white : Colors.black;
  Color get successContainer => brightness == Brightness.light ? const Color(0xFFE8F5E8) : const Color(0xFF1B5E20);
  Color get onSuccessContainer => brightness == Brightness.light ? const Color(0xFF1B5E20) : const Color(0xFFA5D6A7);
  
  Color get warning => brightness == Brightness.light ? const Color(0xFFE65100) : const Color(0xFFFF9800);
  Color get onWarning => Colors.white;
  Color get warningContainer => brightness == Brightness.light ? const Color(0xFFFFF3E0) : const Color(0xFFE65100);
  Color get onWarningContainer => brightness == Brightness.light ? const Color(0xFFBF360C) : Colors.white;
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1976D2),
        brightness: Brightness.light,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1976D2),
        brightness: Brightness.dark,
      ),
      useMaterial3: true,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}