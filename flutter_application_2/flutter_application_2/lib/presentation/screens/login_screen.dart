
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final usernameInput = TextEditingController();
    final passwordInput = TextEditingController();

    final List<User> users = [
      User(username: 'user1', password: 'password1'),
      User(username: 'user2', password: 'password2'),
    ];

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBar(title: const Text('Login Screen')),
          TextField(
            controller: usernameInput,
            decoration: InputDecoration(hintText: 'Username')),
          TextField(
            controller: passwordInput,
            decoration: InputDecoration(hintText: 'Password')),
          ElevatedButton(
            onPressed: () {
              if (validateLogin(usernameInput.text, passwordInput.text, users)) {
                context.push('/home', extra: usernameInput.text);
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  bool validateLogin(String username, String password, List<User> users) {
    for (var user in users) {
      if (user.username == username && user.password == password) {
        return true;
      }
    }
    return false;
  }
    
}
