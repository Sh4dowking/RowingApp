import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Notification settings coming soon...',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.description(context),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
