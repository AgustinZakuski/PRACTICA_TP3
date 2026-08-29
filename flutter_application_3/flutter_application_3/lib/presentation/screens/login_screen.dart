import 'package:flutter/material.dart';
import 'package:flutter_application_3/domain/user.dart';
import 'package:flutter_application_3/repository/user_repository.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final usernameInput = TextEditingController();
    final passwordInput = TextEditingController();

    final List<User> users = UserRepository().users;

    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.10),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: usernameInput,
                      decoration: InputDecoration(hintText: 'Username')),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: passwordInput,
                      decoration: InputDecoration(hintText: 'Password')),
                  ),
                ]
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (validateLogin(context, usernameInput.text, passwordInput.text, users)) {
                context.push('/home', extra: usernameInput.text);
              }
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }

  bool validateLogin(BuildContext context, String username, String password, List<User> users) {
    for (var user in users) {
      if (user.username == username && user.password == password) {
        return true;
      }
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid username or password.'),
      ),
    );
    return false;
  }
    
}
