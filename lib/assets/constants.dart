import 'package:flutter/material.dart';

import 'colors.dart';

abstract class AppConstants {
  AppConstants._();
  static List<String> daysOfWeekWords = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  static List<Color> todoColors = [
    blue,
    orange,
    red,
  ];
}
