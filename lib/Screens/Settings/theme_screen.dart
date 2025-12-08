import 'package:flutter/material.dart';
import 'package:rowing_app/Theme/theme_manager.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  late ThemeMode _currentThemeMode;

  @override
  void initState() {
    super.initState();
    // Get the current theme mode from the app
    _currentThemeMode = themeNotifier.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Theme Mode'),
                    ValueListenableBuilder<ThemeMode>(
                      valueListenable: themeNotifier,
                      builder: (context, themeMode, child) {
                        return Row(
                          children: [
                            _buildThemeButton(
                              context,
                              'System',
                              ThemeMode.system,
                              themeMode == ThemeMode.system,
                            ),
                            const SizedBox(width: 6),
                            _buildThemeButton(
                              context,
                              'Light',
                              ThemeMode.light,
                              themeMode == ThemeMode.light,
                            ),
                            const SizedBox(width: 6),
                            _buildThemeButton(
                              context,
                              'Dark',
                              ThemeMode.dark,
                              themeMode == ThemeMode.dark,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeButton(
    BuildContext context,
    String label,
    ThemeMode mode,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        themeNotifier.value = mode;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2),
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
        child: Center(child: Text(label)),
      ),
    );
  }
}
