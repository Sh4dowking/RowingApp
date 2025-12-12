import 'package:flutter/material.dart';

/// Represents a training or team event
/// Contains all information needed to display and manage events in the app
class Event {
  final String title;
  final DateTime time;
  final String description;
  final IconData icon;

  const Event({
    required this.title,
    required this.time,
    required this.description,
    required this.icon,
  });

  /// Checks if this event occurs on the same day as the given date
  bool isSameDay(DateTime date) {
    return time.year == date.year &&
        time.month == date.month &&
        time.day == date.day;
  }

  /// Returns the weekday index (0 = Monday, 6 = Sunday)
  int get weekdayIndex => time.weekday - 1;
}

/// Global list of sample events for the application
/// TODO: Replace with a proper data source (database, API, etc.)
final List<Event> events = [
  Event(
    title: 'Morning Rowing',
    time: DateTime(2025, 12, 15, 8, 0),
    description: 'Endurance session on the water.',
    icon: Icons.rowing,
  ),
  Event(
    title: 'Evening Gym',
    time: DateTime(2025, 12, 15, 18, 0),
    description: 'Strength and conditioning.',
    icon: Icons.fitness_center,
  ),
  Event(
    title: 'Morning Run',
    time: DateTime(2025, 12, 16, 7, 0),
    description: '5k run.',
    icon: Icons.directions_run,
  ),
  Event(
    title: 'Evening Yoga',
    time: DateTime(2025, 12, 16, 19, 0),
    description: 'Recovery and flexibility.',
    icon: Icons.self_improvement,
  ),
  Event(
    title: 'Morning Rowing',
    time: DateTime(2025, 12, 17, 8, 0),
    description: 'Sprint intervals on the water.',
    icon: Icons.rowing,
  ),
  Event(
    title: 'Evening Gym',
    time: DateTime(2025, 12, 17, 18, 0),
    description: 'Powerlifting session.',
    icon: Icons.fitness_center,
  ),
  Event(
    title: 'Morning Swim',
    time: DateTime(2025, 12, 19, 7, 30),
    description: 'Technique and drills.',
    icon: Icons.pool,
  ),
  Event(
    title: 'Evening Crossfit',
    time: DateTime(2025, 12, 19, 18, 30),
    description: 'High-intensity workout.',
    icon: Icons.whatshot,
  ),
  Event(
    title: 'Morning Competition',
    time: DateTime(2025, 12, 20, 9, 0),
    description: 'Regatta day!',
    icon: Icons.emoji_events,
  ),
  Event(
    title: 'Team Brunch',
    time: DateTime(2025, 12, 21, 11, 0),
    description: 'Post-competition celebration.',
    icon: Icons.fastfood,
  ),
];
