import 'package:flutter/material.dart';

class AppTheme {

  static Color get fondo => const Color(0xFFfff3e6);
  static Color get naranja => const Color(0xFFD17102);
  static Color get light_naranja => Color.fromARGB(255, 250, 193, 127);

  static double get textSizeMedium => 20;

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorSchemeSeed: fondo
  );
}