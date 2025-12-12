import 'package:flutter/material.dart';

/// Global theme notifier for switching between light, dark, and system themes
/// Listen to this to react to theme changes throughout the app
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

/// Centralized color palette for the application
/// Provides semantic color accessors that adapt to the current theme
class AppColors {
  // Base color palette - consistent across themes
  static const Color white = Color(0xFFFFFFFF);
  static const Color coolWhite = Color(0xFFE8E8E8);
  static const Color steel = Color(0xFF6C6C70);
  static const Color slate = Color(0xFF2C2C2E);
  static const Color charcoal = Color(0xFF1E1E1E);
  static const Color midnight = Color(0xFF121212);
  static const Color black = Color(0xFF000000);
  static const Color burgundy = Color(0xFF710B0B);
  static const Color red = Color(0xFF8B2C2C);

  /// Checks if the current theme is light mode
  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  /// Primary color - typically used for app bars and key UI elements
  static Color primary(BuildContext context) {
    return black;
  }

  /// Color for content displayed on primary surfaces
  static Color onPrimary(BuildContext context) {
    return white;
  }

  /// Background color for elevated surfaces (cards, sheets, etc.)
  static Color surface(BuildContext context) {
    return charcoal;
  }

  /// Color for content displayed on surfaces
  static Color onSurface(BuildContext context) {
    return white;
  }

  /// Accent color for highlights and interactive elements
  static Color accent(BuildContext context) {
    return burgundy;
  }

  /// Lighter variant of accent color for markers and secondary highlights
  static Color lightAccent(BuildContext context) {
    return red;
  }

  /// Color for descriptive/secondary text
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
