import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:row_up/Theme/theme_manager.dart';

import '../Classes/event_class.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onTap;

  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: AppColors.surface(context),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: Icon(
              event.icon,
              color: AppColors.accent(context),
              size: 40.0,
            ),
            title: Text(
              event.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text('${event.description}\nTime: ${DateFormat.jm().format(event.time)}'),
            isThreeLine: true,
          ),
        ),
      ),
    );
  }
}
