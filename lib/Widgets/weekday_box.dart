import 'package:flutter/material.dart';
import 'package:rowing_app/Theme/theme_manager.dart';

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
              isLightMode(context)
                  ? isSelected
                      ? burgundy
                      : coolWhite
                  : isSelected
                  ? black
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
            title,
            style: TextStyle(
              color:
                  isSelected
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
