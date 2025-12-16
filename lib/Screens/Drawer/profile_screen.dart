import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Placeholder
          children: [
            Icon(
              Icons.person,
              size: 100,
              color: AppColors.accent(context),
            ),
            const SizedBox(height: 24),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface(context),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Coming soon...',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.description(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
