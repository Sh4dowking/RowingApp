import 'package:flutter/material.dart';
import 'package:row_up/Widgets/weekday_box.dart';

typedef DaySelectedCallback = void Function(int dayIndex);

/// Horizontal selector widget for choosing a day of the week
/// Displays abbreviated day names (Mon-Sun) as selectable boxes
class WeekdaySelector extends StatelessWidget {
  final DaySelectedCallback onDaySelected;
  final int
  selectedDay; // Currently selected day index (0 = Monday, 6 = Sunday)

  const WeekdaySelector({
    super.key,
    required this.onDaySelected,
    required this.selectedDay,
  });

  static const List<String> _weekdayLabels = [
    "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun",
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(12),
      height: screenHeight * 0.075,
      child: Row(
        children: List.generate(_weekdayLabels.length, (dayIndex) {
          return Expanded(
            child: WeekdayBox(
              title: _weekdayLabels[dayIndex],
              isSelected: selectedDay == dayIndex,
              onPressed: () => onDaySelected(dayIndex),
            ),
          );
        }),
      ),
    );
  }
}
