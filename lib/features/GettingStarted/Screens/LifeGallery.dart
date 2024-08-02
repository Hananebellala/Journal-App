import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Widgets/NextButton2.dart';

class LifeGallery extends StatelessWidget {
  const LifeGallery({super.key});
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Image.asset('assets/Online gallery-bro 1.png'),
            const SizedBox(height: 20),
            Text(
              'Life Gallery',
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
                  'Experience your journey\nthrough a gallery of\ncherished moments',
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
              child: Image.asset('assets/Frame 1 (3).png'),
            ),
            const SizedBox(height: 30),
            Flexible(
              child: NextButton2(),
            ),
          ],
        ),
      ),
    );
  }
}
