import 'package:flutter_application_3/domain/animal.dart';
import 'package:flutter_application_3/presentation/screens/animal_detail_screen.dart';
import 'package:flutter_application_3/presentation/screens/home_screen.dart';
import 'package:flutter_application_3/presentation/screens/login_screen.dart';
import 'package:flutter_application_3/presentation/screens/settings.dart';
import 'package:flutter_application_3/presentation/screens/spinner_screen.dart';
import 'package:flutter_application_3/presentation/widget/app_shell.dart';
import 'package:go_router/go_router.dart';

final approuter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => AppShell(
        currentPath: state.uri.path,
        child: child,
      ),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) =>
              HomeScreen(),
        ),
        GoRoute(
          path: '/animal_detail',
          builder: (context, state) =>
              AnimalDetailScreen(animal: state.extra as Animal),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) =>
              SettingsScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => SettingsScreen(),
        ),
        GoRoute(
          path: '/spinner',
          builder: (context, state) => const SpinnerScreen(),
        ),
      ],
    ),
  ],
);