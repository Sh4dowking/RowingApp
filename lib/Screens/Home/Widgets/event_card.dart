import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:row_up/Theme/theme_manager.dart';

import '../../../Classes/event_class.dart';

/// Card widget displaying a summary of an event
/// Shows event icon, title, description, and scheduled time
/// On tap, navigates to the event details screen
/// Allows registration for the event with tristate toggle
class EventCard extends StatefulWidget {
  final Event event;
  final VoidCallback onTap;

  const EventCard({super.key, required this.event, required this.onTap});

  @override
  State<EventCard> createState() => _EventCardState();
}

enum RegistrationStatus { pending, registered, declined }

class _EventCardState extends State<EventCard> {
  RegistrationStatus _status = RegistrationStatus.pending;

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat.jm().format(widget.event.time);

    return Card(
      color: AppColors.surface(context),
      margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: AppColors.onSurface(context).withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.event.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.onSurface(context),
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.event.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.description(context),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              size: 14,
                              color: AppColors.accent(
                                context,
                              ).withValues(alpha: 0.7),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              formattedTime,
                              style: TextStyle(
                                color: AppColors.onSurface(
                                  context,
                                ).withValues(alpha: 0.6),
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.accent(context).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.event.icon,
                      color: AppColors.accent(context),
                      size: 26.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.onSurface(context).withValues(alpha: 0.05),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Attending?",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.onSurface(
                        context,
                      ).withValues(alpha: 0.7),
                    ),
                  ),
                  _buildStatusPicker(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusPicker() {
    return SegmentedButton<RegistrationStatus>(
      showSelectedIcon: false,
      style: SegmentedButton.styleFrom(
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // Active/Selected state
        selectedForegroundColor: AppColors.onPrimary(context),
        selectedBackgroundColor: AppColors.accent(
          context,
        ).withValues(alpha: 0.8),
        // Inactive/Unselected state
        foregroundColor: AppColors.onSurface(context).withValues(alpha: 0.6),
        backgroundColor: Colors.transparent,
        // Shape and Border
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: BorderSide(
          color: AppColors.onSurface(context).withValues(alpha: 0.1),
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
      segments: const [
        ButtonSegment(
          value: RegistrationStatus.declined,
          label: Text(
            "No",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        ButtonSegment(
          value: RegistrationStatus.pending,
          label: Text(
            "?",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        ButtonSegment(
          value: RegistrationStatus.registered,
          label: Text(
            "Yes",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      selected: {_status},
      onSelectionChanged: (newSelection) {
        setState(() {
          _status = newSelection.first;
        });
      },
    );
  }
}
