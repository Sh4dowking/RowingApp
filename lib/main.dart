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
    // Cold, deep, and dark color palette - muted and sophisticated
    const Color bloodRed = Color(
      0xFF710B0B,
    ); // Deep dark red for primary actions
    const Color burgundy = Color(0xFF4A0E14); // Deeper burgundy for emphasis
    const Color mutedRed = Color(0xFF8B3A3A); // Muted dark red for accents
    const Color charcoal = Color(0xFF1C1C1E); // Deep charcoal for surfaces
    const Color midnight = Color(0xFF0D0D0F); // Near-black midnight
    const Color slate = Color(0xFF2C2C2E); // Slate gray for elevated surfaces
    const Color steel = Color(0xFF6C6C70); // Cool steel gray for secondary elements
    const Color coolWhite = Color(0xFFE8E8E8); // Cool off-white for backgrounds
    const Color iceWhite = Color(0xFFF2F2F7); // Slightly warm ice white
    const Color shadow = Color(0xFF121214); // Dark shadow tone

    return MaterialApp(
      // --- LIGHT THEME ---
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: bloodRed,
          onPrimary: iceWhite,
          secondary: mutedRed,
          onSecondary: iceWhite,
          tertiary: burgundy,
          onTertiary: iceWhite,
          surface: iceWhite,
          onSurface: charcoal,
          surfaceContainerHighest: coolWhite,
          error: Color(0xFF8B2C2C),
          onError: iceWhite,
          outline: steel,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: bloodRed,
          foregroundColor: iceWhite,
          elevation: 0,
          centerTitle: true,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: coolWhite,
          selectedItemColor: bloodRed,
          unselectedItemColor: steel,
          elevation: 8,
          type: BottomNavigationBarType.fixed,
        ),
        cardTheme: const CardTheme(
          color: iceWhite,
          elevation: 2,
          shadowColor: Color(0x1A000000),
        ),
      ),
      debugShowCheckedModeBanner: false,
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
  final ValueNotifier<int> screenIndex = ValueNotifier<int>(0);
  final List<Widget> screens = [
    const HomeScreen(),
    const CalendarScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
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
      appBar: AppBar(
        title: Text('Rowing App'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.login),
              onPressed: () {
                print("user pressed login button");
              },
            ),
          ),
        ],
      ),
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
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
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
