import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:rowing_app/Theme/theme_manager.dart';

class Event {
  String title;
  Event(this.title);
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen>{
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  // Use late to initialize in initState
  late final ValueNotifier<List<Event>> selectedEvents;

  final Map<DateTime, List<Event>> events = {
    DateTime.utc(2025,12,5):[Event("GA1 Training"), Event("Team Meeting")],
    DateTime.utc(2025,12,10): [Event('Ergotest')],
    DateTime.utc(2025,12,15): [Event('GA2 Training')],
  };

  @override
  void initState() {
    super.initState();
    selectedDay = focusedDay;
    // Initialize with the events for the initially selected day
    selectedEvents = ValueNotifier(getEventsForDay(selectedDay!));
  }

  @override
  void dispose() {
    selectedEvents.dispose();
    super.dispose();
  }

  List<Event> getEventsForDay(DateTime day){
    return events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  void onDaySelected(DateTime newlySelectedDay, DateTime newFocusedDay) {
    if (!isSameDay(selectedDay, newlySelectedDay)) {
      setState(() {
        selectedDay = newlySelectedDay;
        focusedDay = newFocusedDay;
      });
      // Update the list of events for the newly selected day
      selectedEvents.value = getEventsForDay(newlySelectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              TableCalendar(
                focusedDay: focusedDay,
                firstDay: DateTime.utc(2020,1,1),
                lastDay: DateTime.utc(2030,12,31),
                selectedDayPredicate: (day){
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: onDaySelected,
                eventLoader: getEventsForDay,
              ),
              const SizedBox(height: 8.0),
              // Use Expanded to make the ListView fill the remaining space
              Expanded(
                child: ValueListenableBuilder<List<Event>>(
                  valueListenable: selectedEvents,
                  builder: (context, value, _) {
                    return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: ListTile(
                            onTap: () => print('${value[index].title} pressed!'),
                            title: Text(
                              value[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            leading: Icon(
                              Icons.event,
                              size: 24,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ]
        )
    );
  }
}

