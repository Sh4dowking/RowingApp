import 'package:flutter/material.dart';
import 'package:rowing_app/Theme/theme_manager.dart';

class SettingsEntry extends StatefulWidget {
  final String title;
  final Icon icon;
  final VoidCallback onTap;
  const SettingsEntry({super.key, required this.title, required this.icon, required this.onTap});

  @override
  State<SettingsEntry> createState() => _SettingsEntryState();
}

class _SettingsEntryState extends State<SettingsEntry> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: AppColors.surface(context),
        margin: EdgeInsets.all(0),
        shape: Border(),
        child: ListTile(
          leading: widget.icon,
          title: Text(widget.title),
          onTap: widget.onTap
        ),
      ),
    );
  }
}
