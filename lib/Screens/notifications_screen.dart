import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

/// Notifications screen displaying user notifications and alerts
/// TODO: Implement notifications functionality with actual data
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder notification icon
          Icon(
            Icons.notifications_none,
            size: 100,
            color: AppColors.accent(context),
          ),
          const SizedBox(height: 24),

          // Placeholder text
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