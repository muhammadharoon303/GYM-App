import 'package:flutter/material.dart';
import 'package:gym_app/features/onboarding/presentation/screens/onboardscreen2.dart';

class OnboardScreen1 extends StatelessWidget {
  const OnboardScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/onboarding/onboard1.png',
              width: 343,
              height: 460,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 313,
              height: 80,
              child: Text(
                'Welcome to PureMove Fitness App',
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
            Container(
              width: 313,
              height: 50,
              child: Text(
                'Discover a personlaized path to a healthier,stronger you-- anything , anywhere, anytime',
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
                        MaterialPageRoute(builder: (_) => OnboardScreen2()),
                      );
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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
