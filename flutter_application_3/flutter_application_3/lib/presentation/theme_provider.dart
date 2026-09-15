import 'package:flutter_application_3/presentation/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final NotifierProvider<ThemeNotifier, AppTheme> themeProvider =
    NotifierProvider<ThemeNotifier, AppTheme>(ThemeNotifier.new);

class ThemeNotifier extends Notifier<AppTheme> {
  @override
  AppTheme build() {
    return AppTheme(selectedColor: 1, darkMode: true);
  }

  void changeColor(int color){
    state = state.copyWith(selectedColor: color);
  }

  void toggleDarkMode() {
    state = state.copyWith(darkMode: !state.darkMode);
  }
}