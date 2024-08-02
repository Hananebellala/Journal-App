import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final bool number;

  const TextContainer(
      {required this.controller, required this.obscureText, required this.number, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      padding: EdgeInsets.symmetric(
          horizontal: 12.0), // Adjust padding for better alignment
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        keyboardType: number ? TextInputType.number : TextInputType.text,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: 15.0), // Adjust padding for text alignment
          hintText:
              '. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .',
          hintStyle: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF1E1E1E), // Style for hint text
            fontStyle: FontStyle.normal,
            fontFamily: 'CormorantUpright', // Additional styling
          ),
          border: InputBorder.none, // Invisible border
        ),
        style: TextStyle(
          fontSize: 23.0,
          fontFamily: 'CormorantUpright', // Font family for input text
          color: Color(0xFF1E1E1E),
        ),
      ),
    );
  }
}
