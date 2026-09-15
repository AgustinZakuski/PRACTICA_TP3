import 'package:flutter/material.dart';

final List<Color> colorOptions = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.orange,
  Colors.purple,
  Colors.yellow,
  Colors.cyan,
  Colors.pink,
  Colors.teal,
  Colors.lime,
];

class AppTheme {
  final int selectedColor;
  final bool darkMode;

  AppTheme({required this.selectedColor, required this.darkMode});

  ThemeData getTheme() {
    return ThemeData(
      colorSchemeSeed: colorOptions[selectedColor],
      brightness: darkMode ? Brightness.dark : Brightness.light,
      useMaterial3: true,
    );
  }

  AppTheme copyWith({int? selectedColor, bool? darkMode}) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
