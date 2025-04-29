import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as base;
import 'package:to_do_app/app/provider/badge_provider.dart';
import 'package:to_do_app/common/colors.dart';
import 'package:to_do_app/ui/constants/images.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Settings
          _SettingsSection(
            title: 'Profile',
            children: [
              _SettingsTile(
                icon: Icons.person,
                title: 'Edit Profile',
                onTap: () {
                  // TODO: Implement edit profile
                },
              ),
              _SettingsTile(
                icon: Icons.notifications,
                title: 'Notifications',
                onTap: () {
                  // TODO: Implement notifications
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // App Settings
          _SettingsSection(
            title: 'App Settings',
            children: [
              _SettingsTile(
                icon: Icons.dark_mode,
                title: 'Theme',
                onTap: () {
                  // TODO: Implement theme switching
                },
              ),
              _SettingsTile(
                icon: Icons.language,
                title: 'Language',
                onTap: () {
                  // TODO: Implement language selection
                },
              ),
            ],
          ),
          const SizedBox(height: 24),

          // About
          _SettingsSection(
            title: 'About',
            children: [
              _SettingsTile(
                icon: Icons.info,
                title: 'About App',
                onTap: () {
                  // TODO: Implement about app
                },
              ),
              _SettingsTile(
                icon: Icons.star,
                title: 'Rate App',
                onTap: () {
                  // TODO: Implement rate app
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...children,
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
