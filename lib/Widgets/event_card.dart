import 'package:flutter/material.dart';
import 'package:rowing_app/Theme/theme_manager.dart';

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
      color: isLightMode(context) ? coolWhite : Color(0x21212100),
      elevation: isLightMode(context) ? 8 : 2,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: isLightMode(context) ? burgundy : white,
            size: 40.0,
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text('$description\nTime: $time'),
          isThreeLine: true,
        ),
      ),
    );
  }
}
