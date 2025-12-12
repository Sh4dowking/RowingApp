import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

/// Reusable list tile widget for settings menu entries
/// Displays an icon, title, and navigation arrow
class SettingsEntry extends StatelessWidget {
  /// The title text to display
  final String title;

  /// The leading icon
  final Icon icon;

  /// Callback invoked when the entry is tapped
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
