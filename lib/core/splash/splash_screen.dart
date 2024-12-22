import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static Route route() => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CupertinoActivityIndicator()));
  }
}
