import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final IconData icon;

  const EventCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      elevation: 4.0, // Controls the shadow depth.
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Space around the card.
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Space inside the card.
        // ListTile is a perfect widget for creating a row with an icon, title, and subtitle.
        child: ListTile(
          // The icon on the left.
          leading: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary,
            size: 40.0,
          ),
          // The main title of the training session.
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          // The description and time, displayed below the title.
          subtitle: Text('$description\nTime: $time'),
          isThreeLine: true, // Allows the subtitle to have two lines.
        ),
      ),
    );
  }
}
