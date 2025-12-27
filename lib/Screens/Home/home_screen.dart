import 'package:flutter/material.dart';
import 'package:row_up/Screens/Home/Widgets/event_card.dart';
import 'package:row_up/Screens/Home/Widgets/weekday_selector.dart';
import 'package:row_up/Screens/event_details_screen.dart';
import 'package:row_up/Theme/theme_manager.dart';

import '../../Classes/event_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int
  _selectedDay; // Currently selected weekday index (0 = Monday, 6 = Sunday)

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now().weekday - 1;
  }

  void _navigateToEventDetails(Event event) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event)),
    );
  }

  List<Event> _getEventsForDay(int dayIndex) {
    return events.where((event) => event.weekdayIndex == dayIndex).toList();
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.event_busy,
            size: 64,
            color: AppColors.description(context).withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No training sessions today.',
            style: TextStyle(
              color: AppColors.description(context).withValues(alpha: 0.6),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 24, left: 0, right: 0, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Training Sessions",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 32,
              color: AppColors.onSurface(context),
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Manage your weekly schedule",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurface(context).withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final eventsForDay = _getEventsForDay(_selectedDay);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Stack(
          children: [
            if (eventsForDay.isEmpty) _buildEmptyState(),
            Column(
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
                if (eventsForDay.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 8, bottom: 24),
                      itemCount: eventsForDay.length,
                      itemBuilder: (context, index) {
                        final event = eventsForDay[index];
                        return EventCard(
                          event: event,
                          onTap: () => _navigateToEventDetails(event),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
