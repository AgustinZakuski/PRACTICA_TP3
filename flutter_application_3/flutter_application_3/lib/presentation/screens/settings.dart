
import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentation/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Notification { always, never, onlyImportant }

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  Notification notification = Notification.always;

  @override
  Widget build(BuildContext context) {
    final appTheme = ref.watch(themeProvider);

    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Dark Mode'),
          subtitle: const Text('Enable dark mode for the app'),
          value: appTheme.darkMode,
          onChanged: (bool value) {
            ref.read(themeProvider.notifier).toggleDarkMode();
          },
        ),

        ExpansionTile(
          title: Text('Notifications'),
          subtitle: Text(notification.toString().split('.').last),
          children: [
            RadioListTile<Notification>(
              title: Text(Notification.always.toString().split('.').last),
              value: Notification.always,
              groupValue: notification,
              onChanged: (value) {
                setState(() {
                  notification = value!;
                });
              },
            ),
                        RadioListTile<Notification>(
              title: Text(Notification.never.toString().split('.').last),
              value: Notification.never,
              groupValue: notification,
              onChanged: (value) {
                setState(() {
                  notification = value!;
                });
              },
            ),

            RadioListTile<Notification>(
              title: Text(Notification.onlyImportant.toString().split('.').last),
              value: Notification.onlyImportant,
              groupValue: notification,
              onChanged: (value) {
                setState(() {
                  notification = value!;
                });
              },
            ),
          ]
        )
      ]
    );
  }
}