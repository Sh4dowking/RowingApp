import 'package:flutter/material.dart';
import 'package:rowing_app/Screens/event_details_screen.dart';
import 'package:rowing_app/Theme/theme_manager.dart'; // Import theme manager
import 'package:rowing_app/Widgets/event_card.dart';
import 'package:rowing_app/Widgets/weekday_selector.dart';

import '../Classes/event_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDay = 0;

  // Store events in a more structured way using our new model
  final Map<int, List<Event>> dailyEvents = {
    0: const [
      Event(title: 'Morning Rowing', time: '08:00 AM', description: 'Endurance session on the water.', icon: Icons.rowing),
      Event(title: 'Evening Gym', time: '06:00 PM', description: 'Strength and conditioning.', icon: Icons.fitness_center),
    ],
    1: const [
      Event(title: 'Morning Run', time: '07:00 AM', description: '5k run.', icon: Icons.directions_run),
      Event(title: 'Evening Yoga', time: '07:00 PM', description: 'Recovery and flexibility.', icon: Icons.self_improvement),
    ],
    2: const [
      Event(title: 'Morning Rowing', time: '08:00 AM', description: 'Sprint intervals on the water.', icon: Icons.rowing),
      Event(title: 'Evening Gym', time: '06:00 PM', description: 'Powerlifting session.', icon: Icons.fitness_center),
    ],
    3: const [
      Event(title: 'Rest Day', time: 'All Day', description: 'Recovery and nutrition focus.', icon: Icons.hotel),
    ],
    4: const [
      Event(title: 'Morning Swim', time: '07:30 AM', description: 'Technique and drills.', icon: Icons.pool),
      Event(title: 'Evening Crossfit', time: '06:30 PM', description: 'High-intensity workout.', icon: Icons.whatshot),
    ],
    5: const [
      Event(title: 'Morning Competition', time: '09:00 AM', description: 'Regatta day!', icon: Icons.emoji_events),
    ],
    6: const [
      Event(title: 'Team Brunch', time: '11:00 AM', description: 'Post-competition celebration.', icon: Icons.fastfood),
    ],
  };

  // Navigate to the details screen
  void _navigateToDetails(Event event) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EventDetailsScreen(event: event),
      ),
    );
  }

  Widget buildDayContent(int dayIndex) {
    final events = dailyEvents[dayIndex] ?? [];

    if (events.isEmpty) {
      return const Expanded(
        child: Center(child: Text('No events scheduled.')),
      );
    }

    return Expanded(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
            return EventCard(
              title: event.title,
              time: event.time,
              description: event.description,
              icon: event.icon,
              onTap: () => _navigateToDetails(event),
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
