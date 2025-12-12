import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:row_up/Theme/theme_manager.dart';
import 'package:row_up/Classes/event_class.dart';
import 'package:intl/intl.dart';
import 'event_details_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  /// The day currently being viewed/focused in the calendar
  late DateTime _focusedDay;

  /// The day currently selected by the user
  late DateTime _selectedDay;

  /// Notifier containing events for the currently selected day
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  /// Retrieves all events scheduled for the specified day
  List<Event> _getEventsForDay(DateTime day) {
    return events.where((event) => isSameDay(event.time, day)).toList();
  }

  /// Handles day selection in the calendar
  /// Updates the selected day and refreshes the events list
  void _onDaySelected(DateTime newlySelectedDay, DateTime newFocusedDay) {
    if (!isSameDay(_selectedDay, newlySelectedDay)) {
      setState(() {
        _selectedDay = newlySelectedDay;
        _focusedDay = newFocusedDay;
      });
      _selectedEvents.value = _getEventsForDay(newlySelectedDay);
    }
  }

  void _navigateToDetails(Event event) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event)),
    );
  }

  /// Builds the calendar widget with custom styling
  Widget _buildCalendar(BuildContext context) {
    return TableCalendar(
      focusedDay: _focusedDay,
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      onDaySelected: _onDaySelected,
      eventLoader: _getEventsForDay,
      // Calendar header styling
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: TextStyle(
          color: AppColors.onPrimary(context),
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: AppColors.onPrimary(context),
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: AppColors.onPrimary(context),
        ),
      ),
      // Calendar cells styling
      calendarStyle: CalendarStyle(
        // Today's date styling
        todayDecoration: BoxDecoration(
          color: AppColors.red,
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(
          color: AppColors.onSurface(context),
          fontWeight: FontWeight.bold,
        ),
        // Selected date styling
        selectedDecoration: BoxDecoration(
          color: AppColors.accent(context),
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(
          color: AppColors.onPrimary(context),
          fontWeight: FontWeight.bold,
        ),
        // Event marker dot styling
        markerDecoration: BoxDecoration(
          color: AppColors.lightAccent(context),
          shape: BoxShape.circle,
        ),
        // Default date text styling
        defaultTextStyle: TextStyle(color: AppColors.onSurface(context)),
        weekendTextStyle: TextStyle(color: AppColors.description(context)),
        outsideTextStyle: TextStyle(color: AppColors.description(context)),
      ),
      // Day of week headers styling
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(
          color: AppColors.onSurface(context),
          fontWeight: FontWeight.bold,
        ),
        weekendStyle: TextStyle(
          color: AppColors.description(context),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// Builds a list tile for displaying an event
  Widget _buildEventTile(BuildContext context, Event event) {
    final formattedTime = DateFormat.jm().format(event.time);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: AppColors.surface(context),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        onTap: () => _navigateToDetails(event),
        leading: Icon(event.icon, color: AppColors.accent(context), size: 24),
        title: Text(
          event.title,
          style: TextStyle(
            color: AppColors.onSurface(context),
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          '$formattedTime - ${event.description}',
          style: TextStyle(color: AppColors.description(context)),
        ),
      ),
    );
  }

  /// Builds the events list for the selected day
  Widget _buildEventsList() {
    return Expanded(
      child: ValueListenableBuilder<List<Event>>(
        valueListenable: _selectedEvents,
        builder: (context, eventsList, _) {
          // Show message when no events are scheduled
          if (eventsList.isEmpty) {
            return Center(
              child: Text(
                'No events scheduled for this day',
                style: TextStyle(
                  color: AppColors.description(context),
                  fontSize: 16,
                ),
              ),
            );
          }

          // Display list of events
          return ListView.builder(
            itemCount: eventsList.length,
            itemBuilder: (context, index) {
              return _buildEventTile(context, eventsList[index]);
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCalendar(context),
        const SizedBox(height: 8.0),
        _buildEventsList(),
      ],
    );
  }
}
