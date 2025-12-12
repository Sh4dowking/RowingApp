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
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  late final ValueNotifier<List<Event>> selectedEvents;

  @override
  void initState() {
    super.initState();
    selectedDay = focusedDay;
    selectedEvents = ValueNotifier(getEventsForDay(selectedDay!));
  }

  @override
  void dispose() {
    selectedEvents.dispose();
    super.dispose();
  }

  List<Event> getEventsForDay(DateTime day) {
    return events.where((event) => isSameDay(event.time, day)).toList();
  }

  void onDaySelected(DateTime newlySelectedDay, DateTime newFocusedDay) {
    if (!isSameDay(selectedDay, newlySelectedDay)) {
      setState(() {
        selectedDay = newlySelectedDay;
        focusedDay = newFocusedDay;
      });
      selectedEvents.value = getEventsForDay(newlySelectedDay);
    }
  }

  void _navigateToDetails(Event event) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => EventDetailsScreen(event: event)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TableCalendar(
            focusedDay: focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: onDaySelected,
            eventLoader: getEventsForDay,
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
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: AppColors.red,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(
                color: AppColors.onSurface(context),
                fontWeight: FontWeight.bold,
              ),
              selectedDecoration: BoxDecoration(
                color: AppColors.accent(context),
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                color: AppColors.onPrimary(context),
                fontWeight: FontWeight.bold,
              ),
              markerDecoration: BoxDecoration(
                color: AppColors.lightAccent(context),
                shape: BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(color: AppColors.onSurface(context)),
              weekendTextStyle: TextStyle(
                color: AppColors.description(context),
              ),
              outsideTextStyle: TextStyle(
                color: AppColors.description(context),
              ),
            ),
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
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: selectedEvents,
              builder: (context, events, _) {
                return ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surface(context),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => _navigateToDetails(events[index]),
                        title: Text(
                          events[index].title,
                          style: TextStyle(
                            color: AppColors.onSurface(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          '${DateFormat.jm().format(events[index].time)} - ${events[index].description}',
                          style: TextStyle(
                            color: AppColors.description(context),
                          ),
                        ),
                        leading: Icon(
                          events[index].icon,
                          color: AppColors.accent(context),
                          size: 24,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
