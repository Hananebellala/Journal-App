import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Screens/Capture.dart';
import 'package:my_journey/features/HomePage/Screens/Home.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key, required this.islogged});

  final bool islogged;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFFFF8DB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minimumSize: const Size(300, 57),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => islogged ? const Home() : const Capture(),
          ),
        );
      },
      child: const Text(
        'Start',
        style: TextStyle(
          fontSize: 30,
          color: const Color(0xFF7469B6),
          fontWeight: FontWeight.w600,
          fontFamily: 'CormorantUpright',
        ),
      ),
    );
  }
}
