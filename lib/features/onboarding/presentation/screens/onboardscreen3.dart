import 'package:flutter/material.dart';
import 'package:gym_app/features/auth/screens/auth/login_screen.dart';

class OnboardScreen3 extends StatelessWidget {
  const OnboardScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboarding/onboard3.png',
              width: 343,
              height: 460,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 313,
              height: 80,
              child: Text(
                'Connect for Smarter Trackings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Merriweather Sans',
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 313,
              height: 50,
              child: Text(
                'Sync with your health data to get tailored workout and progess insights,',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Merriweather Sans',
                  //fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(height: 20),
            // 1. Pushes the buttons to the bottom of the screen
            const Spacer(),

            // 2. The Bottom Row (Indicators + Next Button)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side: Blue capsule + 2 grey dots
                  Row(
                    children: [
                      // Active Pill (Blue)
                      Container(
                        width: 36,
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E88E5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 6),
                      // Dot 2 (Grey)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      const SizedBox(width: 6),
                      // Dot 3 (Grey)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),

                  // Right side: Next button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E90FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
