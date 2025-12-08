import 'package:flutter/material.dart';
import 'package:rowing_app/Screens/calendar_screen.dart';
import 'package:rowing_app/Screens/notifications_screen.dart';
import 'package:rowing_app/Theme/theme_manager.dart';
import 'package:rowing_app/Widgets/information_drawer.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const RowingApp());
}

class RowingApp extends StatelessWidget {
  const RowingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          theme: getLightTheme(),
          darkTheme: getDarkTheme(),
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: const MainPage(),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  final ValueNotifier<int> screenIndex = ValueNotifier<int>(0);
  final List<Widget> screens = [
    const HomeScreen(),
    const CalendarScreen(),
    const NotificationsScreen(),
  ];

  void onBottomNavigationBarTapped(int index) {
    screenIndex.value = index;
  }

  @override
  void dispose() {
    screenIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rowing App'),
      titleTextStyle: TextStyle(
          color: AppColors.onPrimary(context),
          fontWeight: FontWeight.bold,
        fontSize: 24
      ),
      ),
      drawer: InformationDrawer(),
      body: ValueListenableBuilder<int>(
        valueListenable: screenIndex,
        builder: (context, value, child) {
          return screens[value];
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: screenIndex,
        builder: (context, index, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inbox),
                label: 'Notifications',
              ),
            ],
            currentIndex: index,
            onTap: onBottomNavigationBarTapped,
          );
        },
      ),
    );
  }
}
