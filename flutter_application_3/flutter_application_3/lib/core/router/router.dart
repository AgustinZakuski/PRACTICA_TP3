import 'package:flutter_application_3/domain/animal.dart';
import 'package:flutter_application_3/presentation/screens/animal_detail_screen.dart';
import 'package:flutter_application_3/presentation/screens/home_screen.dart';
import 'package:flutter_application_3/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

final approuter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/home', builder: (context, state) => HomeScreen(user: state.extra as String)),
    GoRoute(path: '/animal_detail', builder: (context, state) => AnimalDetailScreen(animal: state.extra as Animal)),

  ]
);