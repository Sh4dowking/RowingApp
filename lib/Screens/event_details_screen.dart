import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:row_up/Classes/event_class.dart';
import 'package:row_up/Theme/theme_manager.dart';

/// Detailed view screen for a specific event
/// Displays comprehensive information about the selected training session or event
class EventDetailsScreen extends StatelessWidget {
  /// The event to display details for
  final Event event;

  const EventDetailsScreen({super.key, required this.event});

  /// Formats the event date and time in a readable format
  String _formatEventDateTime() {
    final timeStr = DateFormat.jm().format(event.time);
    final dateStr = DateFormat.yMMMd().format(event.time);
    return '$dateStr at $timeStr';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(event.title), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Event icon
              Icon(event.icon, size: 100.0, color: AppColors.accent(context)),
              const SizedBox(height: 24.0),

              // Event title
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

              // Scheduled date and time
              Text(
                'Scheduled for:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: AppColors.description(context),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                _formatEventDateTime(),
                style: TextStyle(
                  fontSize: 20.0,
                  color: AppColors.onSurface(context),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 24.0),

              // Event description
              Text(
                event.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  color: AppColors.description(context),
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
