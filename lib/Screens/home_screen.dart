import 'package:flutter/material.dart';
import 'package:rowing_app/Widgets/event_card.dart';
import 'package:rowing_app/Widgets/weekday_selector.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedDay = 0;

  Widget buildDayContent(int dayIndex) {
    Widget content;
    switch (dayIndex) {
      case 0:
        content = ListView(
          children: const [
            EventCard(
              title: 'Morning Rowing',
              time: '08:00 AM',
              description: 'Endurance session on the water.',
              icon: Icons.rowing,
            ),
            EventCard(
              title: 'Evening Gym',
              time: '06:00 PM',
              description: 'Strength and conditioning.',
              icon: Icons.fitness_center,
            ),
          ],
        );
        break;
      case 1:
        content = ListView(
          children: const [
            EventCard(
              title: 'Morning Run',
              time: '07:00 AM',
              description: '5k run.',
              icon: Icons.directions_run,
            ),
            EventCard(
              title: 'Evening Yoga',
              time: '07:00 PM',
              description: 'Recovery and flexibility.',
              icon: Icons.self_improvement,
            ),
          ],
        );
        break;
      case 2:
        content = ListView(
          children: const [
            EventCard(
              title: 'Morning Rowing',
              time: '08:00 AM',
              description: 'Sprint intervals on the water.',
              icon: Icons.rowing,
            ),
            EventCard(
              title: 'Evening Gym',
              time: '06:00 PM',
              description: 'Powerlifting session.',
              icon: Icons.fitness_center,
            ),
          ],
        );
        break;
      case 3:
        content = ListView(
          children: const [
            EventCard(
              title: 'Rest Day',
              time: 'All Day',
              description: 'Recovery and nutrition focus.',
              icon: Icons.hotel,
            ),
          ],
        );
        break;
      case 4:
        content = ListView(
          children: const [
            EventCard(
              title: 'Morning Swim',
              time: '07:30 AM',
              description: 'Technique and drills.',
              icon: Icons.pool,
            ),
            EventCard(
              title: 'Evening Crossfit',
              time: '06:30 PM',
              description: 'High-intensity workout.',
              icon: Icons.whatshot,
            ),
          ],
        );
        break;
      case 5:
        content = ListView(
          children: const [
            EventCard(
              title: 'Morning Competition',
              time: '09:00 AM',
              description: 'Regatta day!',
              icon: Icons.emoji_events,
            ),
          ],
        );
        break;
      case 6:
        content = ListView(
          children: const [
            EventCard(
              title: 'Team Brunch',
              time: '11:00 AM',
              description: 'Post-competition celebration.',
              icon: Icons.fastfood,
            ),
          ],
        );
        break;
      default:
        content = const Center(child: Text('No events scheduled.'));
        break;
    }
    return Expanded(child: Container(child: content));
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
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black
                      : Colors.white,
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
