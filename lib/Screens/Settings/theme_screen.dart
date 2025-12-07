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
                    Text(
                      'Theme Mode',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
        decoration: BoxDecoration(
          color: isLightMode(context)
              ? isSelected
                  ? burgundy
                  : coolWhite
              : isSelected
                  ? white.withValues(alpha: 0.2)
                  : steel,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: isLightMode(context)
                  ? Colors.grey.withOpacity(0.4)
                  : Colors.black.withOpacity(0.6),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? Colors.white
                  : isLightMode(context)
                      ? Colors.black
                      : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
