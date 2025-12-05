import 'package:flutter/material.dart';
import 'package:rowing_app/Widgets/weekday_box.dart';

typedef DaySelectedCallback = void Function(int dayIndex);

class WeekdaySelector extends StatefulWidget {
  final DaySelectedCallback onDaySelected;

  const WeekdaySelector({super.key, required this.onDaySelected});

  @override
  State<WeekdaySelector> createState() => _WeekdaySelectorState();
}

class _WeekdaySelectorState extends State<WeekdaySelector> {
  int selectedDay = 0;
  final List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(12),
      height: screenHeight * 0.075,
      child: Row(
        children: List.generate(days.length, (dayIndex) {
          return Expanded(
            child: WeekdayBox(
              title: days[dayIndex],
              isSelected: selectedDay == dayIndex,
              onPressed: () {
                setState(() {
                  selectedDay = dayIndex;
                });
                widget.onDaySelected(dayIndex);
              },
            ),
          );
        }),
      ),
    );
  }
}
