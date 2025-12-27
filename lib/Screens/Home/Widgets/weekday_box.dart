import 'package:flutter/material.dart';
import 'package:row_up/Theme/theme_manager.dart';

/// Individual weekday selector box widget
/// Displays a single day label and changes appearance when selected
class WeekdayBox extends StatelessWidget {
  final String title;
  final bool isSelected;
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
          color:
              isSelected
                  ? AppColors.accent(context).withValues(alpha: 0.8)
                  : AppColors.surface(context),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.2),
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color:
                  isSelected
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
