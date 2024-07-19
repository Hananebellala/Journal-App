import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Widgets/StartButton.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Bibliophile-bro 1.png'),
            const SizedBox(height: 20),
            Text(
              'The Book of\nLife',
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
                  'Save your journey as a book',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'CourierPrime',
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 45),
            Flexible(
              child: Image.asset('assets/Frame 1 (4).png'),
            ),
            const SizedBox(height: 30),
            Flexible(
              child: StartButton(),
            ),
          ],
        ),
      ),
    );
  }
}
