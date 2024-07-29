import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Screens/Profile.dart';

class Start extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names
  const Start({super.key, required this.isButtonenabled});

  final bool isButtonenabled ;

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.isButtonenabled ? const Color(0xFF7469B6): Color.fromARGB(255, 187, 177, 238),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minimumSize: const Size(300, 57),
      ),
      onPressed: widget.isButtonenabled ? () {
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Profile()),
        );
      }: null,
      child: const Text(
        'Next',
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
