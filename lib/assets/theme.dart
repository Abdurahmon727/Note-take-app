import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Poppins',
        primaryColor: blue,
        colorScheme: const ColorScheme.light().copyWith(primary: blue),
        useMaterial3: true,
      );
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        primaryColor: blue,
        colorScheme: const ColorScheme.dark().copyWith(primary: blue),
      );
}
