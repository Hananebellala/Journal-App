import 'package:flutter/material.dart';

class Alldiaries extends StatelessWidget {
  const Alldiaries({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 110),
        Center(
            child: Container(
          height: 300,
          width: 300,
          child: Image.asset('assets/Empty.png'),
        ))
      ],
    );
  }
}
