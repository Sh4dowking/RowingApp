import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:row_up/Screens/calendar_screen.dart';
import 'package:row_up/Screens/notifications_screen.dart';
import 'package:row_up/Theme/theme_manager.dart';
import 'package:row_up/Widgets/information_drawer.dart';
import 'package:row_up/providers/navigation_provider.dart';
import 'Screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: RowUp()));
}

class RowUp extends StatelessWidget {
  const RowUp({super.key});

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

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentIndex = ref.watch(navigationIndexProvider);

    final List<Widget> screens = [
      const HomeScreen(),
      const CalendarScreen(),
      const NotificationsScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rowing App'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      drawer: const InformationDrawer(),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: currentIndex,
        onTap: (index) {
          ref.read(navigationIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}
