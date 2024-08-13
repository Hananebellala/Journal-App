import 'package:flutter/material.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 308,
      width: 320,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF3),
        border: Border.all(
          color: const Color(0xFF7469B6), // Border color
          width: 3, // Border width (optional)
        ),
        borderRadius: BorderRadius.circular(20), // Border radius
      ),
    );
  }
}
