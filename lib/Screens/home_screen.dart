import 'package:flutter/material.dart';
import 'package:row_up/Screens/event_details_screen.dart';
import 'package:row_up/Theme/theme_manager.dart';
import 'package:row_up/Widgets/event_card.dart';
import 'package:row_up/Widgets/weekday_selector.dart';

import '../Classes/event_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDay = DateTime.now().weekday - 1;

  void _navigateToDetails(Event event) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event)),
    );
  }

  Widget buildDayContent(int dayIndex) {
    final List<Event> eventsForDay = [];
    for (final event in events) {
      if (event.time.weekday - 1 == dayIndex) {
        eventsForDay.add(event);
      }
    }

    if (eventsForDay.isEmpty) {
      return const Expanded(
        child: Center(child: Text('No events scheduled for this day.')),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: eventsForDay.length,
        itemBuilder: (context, index) {
          final Event currentEvent = eventsForDay[index];
          return EventCard(
            event: currentEvent,
            onTap: () => _navigateToDetails(currentEvent),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Training Sessions",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                  color: AppColors.onPrimary(context),
                ),
              ),
            ],
          ),
        ),
        WeekdaySelector(
          selectedDay: selectedDay,
          onDaySelected: (dayIndex) {
            setState(() {
              selectedDay = dayIndex;
            });
          },
        ),
        buildDayContent(selectedDay),
      ],
    );
  }
}
