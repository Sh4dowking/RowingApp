import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

/// Individual weekday selector box widget
/// Displays a single day label and changes appearance when selected
class WeekdayBox extends StatelessWidget {
  /// The abbreviated day name to display (e.g., "Mon", "Tue")
  final String title;

  /// Whether this day is currently selected
  final bool isSelected;

  /// Callback invoked when the box is tapped
  final VoidCallback onPressed;

  const WeekdayBox({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent(context)
              : AppColors.surface(context),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: isSelected
                  ? AppColors.onPrimary(context)
                  : AppColors.onSurface(context),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
