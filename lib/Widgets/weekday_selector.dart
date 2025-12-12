import 'package:flutter/material.dart';
import 'package:row_up/Widgets/weekday_box.dart';

typedef DaySelectedCallback = void Function(int dayIndex);

class WeekdaySelector extends StatelessWidget {
  final DaySelectedCallback onDaySelected;
  final int selectedDay;

  const WeekdaySelector({
    super.key, 
    required this.onDaySelected,
    required this.selectedDay,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(12),
      height: screenHeight * 0.075,
      child: Row(
        children: List.generate(days.length, (dayIndex) {
          return Expanded(
            child: WeekdayBox(
              title: days[dayIndex],
              isSelected: selectedDay == dayIndex,
              onPressed: () {
                onDaySelected(dayIndex);
              },
            ),
          );
        }),
      ),
    );
  }
}
