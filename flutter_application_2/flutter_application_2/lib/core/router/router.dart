import 'package:flutter_application_2/presentation/screens/home_screen.dart';
import 'package:flutter_application_2/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final approuter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen(user: state.extra as String)),
  ]
);