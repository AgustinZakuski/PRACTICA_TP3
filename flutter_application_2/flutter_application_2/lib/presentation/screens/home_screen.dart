import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});

  final String user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Home Screen, $user !',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}