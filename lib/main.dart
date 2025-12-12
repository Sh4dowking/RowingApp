import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:row_up/Screens/calendar_screen.dart';
import 'package:row_up/Screens/notifications_screen.dart';
import 'package:row_up/Theme/theme_manager.dart';
import 'package:row_up/Widgets/information_drawer.dart';
import 'package:row_up/providers/navigation_provider.dart';
import 'Screens/home_screen.dart';

/// Entry point of the application
/// Wraps the app with ProviderScope for state management
void main() {
  runApp(const ProviderScope(child: RowUp()));
}

/// Root widget of the RowUp application
/// Manages theme switching and provides MaterialApp configuration
class RowUp extends StatelessWidget {
  const RowUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen to theme changes and rebuild when theme mode changes
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          title: 'Row Up',
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

/// Main page container with bottom navigation
/// Uses ConsumerWidget to access Riverpod providers
class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  /// List of navigation items configuration
  static const List<_NavigationItem> _navigationItems = [
    _NavigationItem(icon: Icons.home, label: 'Home', screen: HomeScreen()),
    _NavigationItem(
      icon: Icons.calendar_month,
      label: 'Calendar',
      screen: CalendarScreen(),
    ),
    _NavigationItem(
      icon: Icons.inbox,
      label: 'Notifications',
      screen: NotificationsScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the current navigation index from the provider
    final int currentIndex = ref.watch(navigationIndexProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Row Up'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      drawer: const InformationDrawer(),
      body: _navigationItems[currentIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items:
            _navigationItems
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    label: item.label,
                  ),
                )
                .toList(),
        currentIndex: currentIndex,
        onTap: (index) {
          // Update the navigation index when a tab is tapped
          ref.read(navigationIndexProvider.notifier).state = index;
        },
      ),
    );
  }
}

/// Internal class to define navigation item structure
class _NavigationItem {
  final IconData icon;
  final String label;
  final Widget screen;

  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
