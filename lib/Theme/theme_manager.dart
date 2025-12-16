import 'package:flutter/material.dart';

// Global theme notifier for switching between light, dark, and system themes
// Listen to this to react to theme changes throughout the app
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

/// Centralized color palette for the application
/// Provides semantic color accessors that adapt to the current theme
class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color coolWhite = Color(0xFFE8E8E8);
  static const Color steel = Color(0xFF6C6C70);
  static const Color slate = Color(0xFF2C2C2E);
  static const Color charcoal = Color(0xFF1E1E1E);
  static const Color midnight = Color(0xFF121212);
  static const Color black = Color(0xFF000000);
  static const Color burgundy = Color(0xFF710B0B);
  static const Color red = Color(0xFF8B2C2C);

  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static Color primary(BuildContext context) {
    return isLightMode(context) ? white : black;
  }

  static Color onPrimary(BuildContext context) {
    return isLightMode(context) ? black : white;
  }

  static Color surface(BuildContext context) {
    return isLightMode(context) ? coolWhite : charcoal;
  }

  static Color onSurface(BuildContext context) {
    return isLightMode(context) ? black : white;
  }

  static Color accent(BuildContext context) {
    return burgundy;
  }

  static Color lightAccent(BuildContext context) {
    return red;
  }

  static Color description(BuildContext context) {
    return steel;
  }
}

/// Creates and returns the light theme configuration
ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.burgundy,
      foregroundColor: AppColors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.coolWhite,
      selectedItemColor: AppColors.burgundy,
      unselectedItemColor: AppColors.steel,
    ),
    scaffoldBackgroundColor: AppColors.white,
  );
}

/// Creates and returns the dark theme configuration
ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.midnight,
      foregroundColor: AppColors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.midnight,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.steel,
    ),
    scaffoldBackgroundColor: AppColors.black,
  );
}
