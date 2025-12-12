import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

/// Language and region settings screen
/// TODO: Implement localization and language selection
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language & Region')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(
            'Language and region settings coming soon...',
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
