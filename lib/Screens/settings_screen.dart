import 'package:flutter/material.dart';
import 'package:rowing_app/Widgets/settings_entry.dart';

import 'Settings/language_screen.dart';
import 'Settings/notifications_screen.dart';
import 'Settings/theme_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<String> settingsTitle = ["Notifications", "Theme", "Language & Region"];
  List<IconData> settingsIcon = [
    Icons.notifications,
    Icons.color_lens,
    Icons.language,
  ];
  List<Widget> destinationScreens = [
    const NotificationsScreen(),
    const ThemeScreen(),
    const LanguageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: List.generate(settingsTitle.length, (index) {
          return SettingsEntry(
            title: settingsTitle[index],
            icon: Icon(settingsIcon[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => destinationScreens[index],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
