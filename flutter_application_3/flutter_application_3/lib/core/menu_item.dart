
import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String path;
  final IconData icon;

  MenuItem({required this.title, required this.path, required this.icon});
}

final menu = [
  MenuItem(title: 'Home', path: '/home', icon: Icons.home_outlined),
  MenuItem(title: 'Settings', path: '/settings', icon: Icons.settings),
  MenuItem(title: 'Spinner', path: '/spinner', icon: Icons.refresh),
];