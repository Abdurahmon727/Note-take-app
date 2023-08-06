import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PageRouteBuilder fade({
  required Widget page,
}) =>
    PageRouteBuilder<Widget>(
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            1,
            curve: Curves.linear,
          ),
        ),
        child: child,
      ),
      pageBuilder: (context, animation, secondaryAnimation) => page,
    );

CupertinoPageRoute cupertino({
  required Widget page,
}) =>
    CupertinoPageRoute(builder: (context) => page);

MaterialPageRoute material({
  required Widget page,
}) =>
    MaterialPageRoute(builder: (context) => page);
