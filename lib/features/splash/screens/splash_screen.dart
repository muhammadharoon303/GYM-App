import 'package:flutter/material.dart';
import 'package:gym_app/features/onboarding/presentation/screens/onboardscreeen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => OnboardScreen1()),
        (value) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'LOGO',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: 'Merriweather Sans',
                fontSize: 56,
                fontWeight: FontWeight.bold,
                color: Color(0xff1E90FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
