import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Widgets/StartButton2.dart';

class Capture extends StatelessWidget {
  const Capture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Bullet journal-bro 1.png'),
            const SizedBox(height: 20),
            Text(
              'Capture\nthe moment',
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'CormorantUpright',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF7469B6)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Save the moment,',
                  style: TextStyle(fontSize: 20, fontFamily: 'CourierPrime', fontWeight:FontWeight.w400),
                ),
              ),
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'reflect on your experiences,',
                  style: TextStyle(fontSize: 20 ,fontFamily: 'CourierPrime', fontWeight:FontWeight.w400),
                ),
              ),
            ),
            const SizedBox(height: 45),
            Flexible(
              child: Image.asset('assets/Frame 1 (2).png'),
            ),
            const SizedBox(height: 30),
            Flexible(
              child: StartButton2(),
            ),
          ],
        ),
      ),
    );
  }
}
