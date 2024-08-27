import 'package:flutter/material.dart';

class DairyController extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final bool number;

  const DairyController({
    required this.controller,
    required this.obscureText,
    required this.number,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // Adjusts the layout for the keyboard
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 12, right: 12),
          child: Container(
            width: 320,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFFFFFAF3),
              border: Border.all(
                color: Color(0xFF7469B6),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextField(
              obscureText: obscureText,
              controller: controller,
              keyboardType:
                  number ? TextInputType.number : TextInputType.multiline,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                hintText:
                    '.  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .  .\n' *
                        12,
                hintStyle: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xFF1E1E1E),
                  fontStyle: FontStyle.normal,
                  fontFamily: 'CormorantUpright',
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'CourierPrime',
                color: Color(0xFF1E1E1E),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
