
import 'package:flutter/material.dart';

enum Notification { always, never, onlyImportant }

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool darkMode = false;
  Notification notification = Notification.always;

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        SwitchListTile(
          title: const Text('Dark Mode'),
          subtitle: const Text('Enable dark mode for the app'),
          value: darkMode,
          onChanged: (bool value) {
            setState(() {
              darkMode = value;
            });
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