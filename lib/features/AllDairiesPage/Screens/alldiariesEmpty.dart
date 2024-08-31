import 'package:flutter/material.dart';

class AlldairiesEmpty extends StatelessWidget {
  const AlldairiesEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 140),
        Center(
            child: Container(
          height: 300,
          width: 300,
          child: Image.asset('assets/Empty.png'),
        )),
        Text(
          'No written dairies',
          style: TextStyle(
            fontSize: 25,
            color: const Color(0xFF1E1077),
            fontWeight: FontWeight.bold,
            fontFamily: 'CormorantUpright',
          ),
        ),
      ],
    );
  }
}
