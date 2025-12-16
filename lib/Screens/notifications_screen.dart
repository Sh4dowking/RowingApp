import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_none,
            size: 100,
            color: AppColors.accent(context),
          ),
          const SizedBox(height: 24),
          Text(
            'Notifications',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'No new notifications',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.description(context),
            ),
          ),
        ],
      ),
    );
  }
}