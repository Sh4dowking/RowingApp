import 'package:flutter/material.dart';
import 'package:row_up/Screens/Drawer/under_construction_screen.dart';
import '../Screens/Drawer/profile_screen.dart';
import '../Screens/Drawer/settings_screen.dart';
import 'package:row_up/Theme/theme_manager.dart';

/// Navigation drawer providing access to app settings and information
/// Accessible from the main app bar hamburger menu
class InformationDrawer extends StatelessWidget {
  const InformationDrawer({super.key});

  static const List<_DrawerItem> _drawerTopItems = [
    _DrawerItem(
        icon: Icons.person_outlined,
        label: 'Profile',
        screen: ProfileScreen()),
    _DrawerItem(
      icon: Icons.settings_outlined,
      label: 'Settings',
      screen: SettingsScreen(),
    ),
  ];

  static const List<_DrawerItem> _drawerBottomItems = [
    _DrawerItem(
        icon: Icons.info_outlined,
        label: 'About',
        screen: UnderConstructionScreen()),
    _DrawerItem(
      icon: Icons.help_outline,
      label: 'Help (FAQ)',
      screen: UnderConstructionScreen(),
    ),
    _DrawerItem(
      icon: Icons.bug_report_outlined,
      label: 'Report a bug',
      screen: UnderConstructionScreen(),
    ),
  ];

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  Widget _buildDrawerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(leading: Icon(icon), title: Text(title), onTap: onTap);
  }

  // Takes a list of _DrawerItem and returns a list of corresponding widgets
  List<Widget> _buildDrawerItems(List<_DrawerItem> items, BuildContext context) {
    return items
        .map((item) => _buildDrawerTile(
      icon: item.icon,
      title: item.label,
      onTap: () => _navigateToScreen(context, item.screen),
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface(context),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.primary(context)),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          ..._buildDrawerItems(_drawerTopItems, context),
          const Divider(),
          ..._buildDrawerItems(_drawerBottomItems, context),
        ],
      ),
    );
  }
}

class _DrawerItem {
  final IconData icon;
  final String label;
  final Widget screen;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.screen,
  });
}
