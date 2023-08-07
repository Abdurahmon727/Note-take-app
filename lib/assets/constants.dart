import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppConstants {
  AppConstants._();
  static List<String> daysOfWeekWords = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];
  static List<Color> todoLightColors = [
    blue,
    orange,
    red,
  ];
  static List<Color> todoDarkColors = [
    darkBlue,
    darkOrange,
    darkRed,
  ];
}
