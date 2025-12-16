import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Under Construction'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // Placeholder
          children: [
            Icon(
              Icons.construction,
              size: 100,
              color: AppColors.accent(context),
            ),
            const SizedBox(height: 24),
            Text(
              'Under Construction',
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
