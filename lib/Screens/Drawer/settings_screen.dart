import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';
import '../Settings/language_screen.dart';
import '../Settings/notifications_screen.dart';
import '../Settings/theme_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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

/// Reusable list tile widget for settings menu entries
/// Displays an icon, title, and navigation arrow
class SettingsEntry extends StatelessWidget {
  final String title;
  final Icon icon;

  final VoidCallback onTap;

  const SettingsEntry({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.surface(context),
      margin: EdgeInsets.zero,
      shape: const Border(),
      child: ListTile(
        leading: icon,
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
