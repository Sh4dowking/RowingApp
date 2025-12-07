import 'package:flutter/material.dart';

Color white = Color(0xFFFFFFFF);
Color coolWhite = Color(0xFFE8E8E8);
Color steel = Color(0xFF6C6C70);
Color black = Color(0xFF000000);
Color burgundy = Color(0xFF710B0B);
Color red = Color(0xFF8B2C2C);

// ValueNotifier to manage theme mode changes
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

bool isLightMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.light;
}

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: burgundy,
      foregroundColor: white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: coolWhite,
      selectedItemColor: burgundy,
      unselectedItemColor: steel,
    ),
    scaffoldBackgroundColor: white,
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: black,
      foregroundColor: white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: black,
      selectedItemColor: steel,
      unselectedItemColor: white,
    ),
    scaffoldBackgroundColor: Colors.grey[900],
  );
}
