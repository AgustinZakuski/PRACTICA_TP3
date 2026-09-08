import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentation/widget/drawer.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child, required this.currentPath});

  final String currentPath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal App'),
      ),
      body: child,
      drawer: DrawerMenu(),
    );
  }
}