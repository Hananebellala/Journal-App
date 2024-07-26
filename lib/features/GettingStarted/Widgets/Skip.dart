import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Screens/Starting.dart';

class SkipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7469B6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minimumSize: const Size(300, 57),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Starting()),
        );
      },
      child: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 30,
          color: const Color(0xFFFFFAF3),
          fontWeight: FontWeight.w600,
          fontFamily: 'CormorantUpright',
        ),
      ),
    );
  }
}
