import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:row_up/Classes/event_class.dart';
import 'package:row_up/Theme/theme_manager.dart';

class EventDetailsScreen extends StatelessWidget {
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                event.icon,
                size: 100.0,
                color: AppColors.accent(context),
              ),
              const SizedBox(height: 24.0),
              Text(
                event.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0,
                  color: AppColors.onSurface(context),
                ),
              ),
              const SizedBox(height: 16.0),
              Text(
                'Scheduled for: ${DateFormat.jm().format(event.time)}',
                style: TextStyle(
                  fontSize: 20.0,
                  color: AppColors.onSurface(context),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24.0),
              Text(
                event.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.description(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
