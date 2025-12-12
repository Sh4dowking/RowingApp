import 'package:flutter/material.dart';
import '../Screens/profile_screen.dart';
import '../Screens/settings_screen.dart';
import 'package:row_up/Theme/theme_manager.dart';

/// Navigation drawer providing access to app settings and information
/// Accessible from the main app bar hamburger menu
class InformationDrawer extends StatelessWidget {
  const InformationDrawer({super.key});

  /// Navigates to a screen and closes the drawer
  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  /// Builds a drawer list tile with consistent styling
  Widget _buildDrawerTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface(context),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer header
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary(context),
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),

          // Profile section
          _buildDrawerTile(
            icon: Icons.person_outline,
            title: 'Profile',
            onTap: () => _navigateToScreen(context, const ProfileScreen()),
          ),

          // Settings section
          _buildDrawerTile(
            icon: Icons.settings_outlined,
            title: 'Settings',
            onTap: () => _navigateToScreen(context, const SettingsScreen()),
          ),

          const Divider(),

          // Information sections
          _buildDrawerTile(
            icon: Icons.info_outline,
            title: 'About',
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement About screen
            },
          ),

          _buildDrawerTile(
            icon: Icons.help_outline,
            title: 'Help (FAQ)',
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement Help/FAQ screen
            },
          ),

          _buildDrawerTile(
            icon: Icons.bug_report_outlined,
            title: 'Report a bug',
            onTap: () {
              Navigator.pop(context);
              // TODO: Implement bug reporting functionality
            },
          ),
        ],
      ),
    );
  }
}
