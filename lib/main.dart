import 'package:flutter/material.dart';
import 'package:rowing_app/Screens/calendar_screen.dart';
import 'package:rowing_app/Screens/notifications_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/profile_screen.dart';

void main() {
  runApp(const RowingApp());
}

class RowingApp extends StatelessWidget {
  const RowingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int screenIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const CalendarScreen(),
    const NotificationsScreen(),
    const ProfileScreen()
  ];

  void onBottomNavigationBarTapped(int index){
    setState(() {
      screenIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rowing App'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: screens[screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: screenIndex,
        onTap: onBottomNavigationBarTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey[700]

      ),
    );
  }
}
