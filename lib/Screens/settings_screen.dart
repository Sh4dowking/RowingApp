import 'package:flutter/material.dart';
import 'package:row_up/Widgets/settings_entry.dart';
import 'Settings/language_screen.dart';
import 'Settings/notifications_screen.dart';
import 'Settings/theme_screen.dart';

/// Settings screen providing access to app configuration options
/// Displays a list of settings categories that navigate to detail screens
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  /// Configuration data for each settings entry
  static const List<_SettingsItem> _settingsItems = [
    _SettingsItem(
      title: "Notifications",
      icon: Icons.notifications,
      screen: NotificationsScreen(),
    ),
    _SettingsItem(
      title: "Theme",
      icon: Icons.color_lens,
      screen: ThemeScreen(),
    ),
    _SettingsItem(
      title: "Language & Region",
      icon: Icons.language,
      screen: LanguageScreen(),
    ),
  ];

  /// Navigates to the specified settings detail screen
  void _navigateToSettingScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView.builder(
        itemCount: _settingsItems.length,
        itemBuilder: (context, index) {
          final item = _settingsItems[index];
          return SettingsEntry(
            title: item.title,
            icon: Icon(item.icon),
            onTap: () => _navigateToSettingScreen(context, item.screen),
          );
        },
      ),
    );
  }
}

/// Internal class representing a settings menu item
class _SettingsItem {
  final String title;
  final IconData icon;
  final Widget screen;

  const _SettingsItem({
    required this.title,
    required this.icon,
    required this.screen,
  });
}

