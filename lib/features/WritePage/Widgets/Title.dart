import 'package:flutter/material.dart';

class TitleContainer extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final bool number;

  const TitleContainer({
    required this.controller,
    required this.obscureText,
    required this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF3), // Background color
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: number ? TextInputType.number : TextInputType.text,
        textAlign: TextAlign.center, // Center the text horizontally
        textAlignVertical:
            TextAlignVertical.center, // Center the text vertically
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.zero, // Remove padding for perfect alignment
          hintText: 'Give it a name',
          hintStyle: const TextStyle(
            fontSize: 25.0,
            color: Color(0xFF1E1E1E), // Style for hint text
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontFamily: 'CormorantUpright', // Additional styling
          ),
          border: InputBorder.none, // Invisible border
        ),
        style: const TextStyle(
          fontSize: 23.0,
          fontFamily: 'CormorantUpright', // Font family for input text
          color: Color(0xFF1E1E1E),
        ),
      ),
    );
  }
}
