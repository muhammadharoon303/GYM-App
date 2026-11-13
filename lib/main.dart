import 'package:flutter/material.dart';
import 'package:gym_app/features/splash/screens/splash_screen.dart';

void main() {
  runApp(const GYMApp());
}

class GYMApp extends StatelessWidget {
  const GYMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
