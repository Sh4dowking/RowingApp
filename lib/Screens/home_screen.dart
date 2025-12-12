import 'package:flutter/material.dart';
import 'package:row_up/Screens/event_details_screen.dart';
import 'package:row_up/Theme/theme_manager.dart';
import 'package:row_up/Widgets/event_card.dart';
import 'package:row_up/Widgets/weekday_selector.dart';
import '../Classes/event_class.dart';

/// Home screen displaying training sessions organized by weekday
/// Allows users to select a day and view all events scheduled for that day
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Currently selected weekday index (0 = Monday, 6 = Sunday)
  /// Initialized to today's weekday
  late int _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now().weekday - 1;
  }

  /// Navigates to the event details screen for the specified event
  void _navigateToDetails(Event event) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EventDetailsScreen(event: event),
      ),
    );
  }

  /// Filters and returns events for the specified weekday index
  List<Event> _getEventsForDay(int dayIndex) {
    return events.where((event) => event.weekdayIndex == dayIndex).toList();
  }

  /// Builds the content area showing events for the selected day
  Widget _buildDayContent() {
    final eventsForDay = _getEventsForDay(_selectedDay);

    // Show message when no events are scheduled
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

    // Display list of events
    return Expanded(
      child: ListView.builder(
        itemCount: eventsForDay.length,
        itemBuilder: (context, index) {
          final event = eventsForDay[index];
          return EventCard(
            event: event,
            onTap: () => _navigateToDetails(event),
          );
        },
      ),
    );
  }

  /// Builds the header section with the screen title
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
