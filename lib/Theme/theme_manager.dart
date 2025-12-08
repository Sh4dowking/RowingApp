import 'package:flutter/material.dart';

class AppColors {
  static Color white = Color(0xFFFFFFFF);
  static Color coolWhite = Color(0xFFE8E8E8);
  static Color steel = Color(0xFF6C6C70);
  static Color slate = Color(0xFF2C2C2E);
  static Color charcoal = Color(0xFF1E1E1E);
  static Color midnight = Color(0xFF121212);
  static Color black = Color(0xFF000000);
  static Color burgundy = Color(0xFF710B0B);
  static Color red = Color(0xFF8B2C2C);

  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static Color primary(BuildContext context) {
    return isLightMode(context) ? burgundy : black;
  }

  static Color onPrimary(BuildContext context) {
    return white;
  }

  static Color surface(BuildContext context) {
    return isLightMode(context) ? coolWhite : charcoal;
  }

  static Color onSurface(BuildContext context){
    return isLightMode(context) ? black : white;
  }


}

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);



ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.burgundy,
      foregroundColor: AppColors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.coolWhite,
      selectedItemColor: AppColors.burgundy,
      unselectedItemColor: AppColors.steel,
    ),
    scaffoldBackgroundColor: AppColors.white,
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.steel,
      unselectedItemColor: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.black,
  );
}
