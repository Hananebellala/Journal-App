import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Widgets/textContainer.dart';

class Starting extends StatelessWidget {
  const Starting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: Padding(
        padding: const EdgeInsets.only(top: 57.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                'Set your space',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF1E1077),
                    fontFamily: 'CormorantUpright',
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(
                  left: 52.0), // Left padding for 'Your Name:'
              child: const Text(
                'Your Name:',
                style: TextStyle(
                    color: Color(0xFF1E1077),
                    fontFamily: 'CormorantUpright',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(
                  left: 52.0), // Left padding for TextContainer
              child: TextContainer(),
            ),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.only(
                  left: 52.0), // Left padding for 'Secure your journal:'
              child: const Text(
                'Secure your journal:',
                style: TextStyle(
                    color: Color(0xFF1E1077),
                    fontFamily: 'CormorantUpright',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(
                  left: 52.0), // Left padding for TextContainer
              child: TextContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
