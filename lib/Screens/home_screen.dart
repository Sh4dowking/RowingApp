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
  late int _selectedDay; // Currently selected weekday index (0 = Monday, 6 = Sunday)

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now().weekday - 1;
  }

  void _navigateToEventDetails(Event event) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EventDetailsScreen(event: event),
      ),
    );
  }

  List<Event> _getEventsForDay(int dayIndex) {
    return events.where((event) => event.weekdayIndex == dayIndex).toList();
  }

  Widget _buildDayContent() {
    final eventsForDay = _getEventsForDay(_selectedDay);
    if (eventsForDay.isEmpty) {
      return Expanded(
        child: Center(
          child: Text(
            'No events scheduled for this day.',
            style: TextStyle(
              color: AppColors.description(context),
              fontSize: 16,
            ),
          ),
        ),
      );
    }
    return Expanded(
      child: ListView.builder(
        itemCount: eventsForDay.length,
        itemBuilder: (context, index) {
          final event = eventsForDay[index];
          return EventCard(
            event: event,
            onTap: () => _navigateToEventDetails(event),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Text(
        "Training Sessions",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 28,
          color: AppColors.onPrimary(context),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        WeekdaySelector(
          selectedDay: _selectedDay,
          onDaySelected: (dayIndex) {
            setState(() {
              _selectedDay = dayIndex;
            });
          },
        ),
        _buildDayContent(),
      ],
    );
  }
}
