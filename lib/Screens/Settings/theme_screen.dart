import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

/// Theme settings screen allowing users to switch between light, dark, and system themes
class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  /// Available theme mode options
  static const List<_ThemeOption> _themeOptions = [
    _ThemeOption(label: 'System', mode: ThemeMode.system),
    _ThemeOption(label: 'Light', mode: ThemeMode.light),
    _ThemeOption(label: 'Dark', mode: ThemeMode.dark),
  ];

  /// Builds a selectable theme button
  Widget _buildThemeButton(
    BuildContext context,
    String label,
    ThemeMode mode,
    bool isSelected,
  ) {
    return GestureDetector(
      onTap: () {
        // Update the global theme notifier
        themeNotifier.value = mode;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.accent(context) : null,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color:
                  isSelected
                      ? AppColors.onPrimary(context)
                      : AppColors.onSurface(context),
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the theme selector card with all theme options
  Widget _buildThemeSelectorCard(BuildContext context, ThemeMode currentTheme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Theme Mode',
              style: TextStyle(
                color: AppColors.onSurface(context),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children:
                  _themeOptions.map((option) {
                    final isLast = option == _themeOptions.last;
                    return Row(
                      children: [
                        _buildThemeButton(
                          context,
                          option.label,
                          option.mode,
                          currentTheme == option.mode,
                        ),
                        if (!isLast) const SizedBox(width: 6),
                      ],
                    );
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Listen to theme changes and rebuild when updated
            ValueListenableBuilder<ThemeMode>(
              valueListenable: themeNotifier,
              builder: (context, themeMode, child) {
                return _buildThemeSelectorCard(context, themeMode);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// Internal class representing a theme option
class _ThemeOption {
  final String label;
  final ThemeMode mode;

  const _ThemeOption({required this.label, required this.mode});
}
