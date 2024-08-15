import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

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
