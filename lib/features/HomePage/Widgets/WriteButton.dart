import 'package:flutter/material.dart';
import 'package:my_journey/features/WritePage/Screens/Write.dart';

class WriteButton extends StatelessWidget {
  const WriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Write()),
        );
      },
      child: Image.asset(
        'assets/edit.png',
        fit: BoxFit.cover,
        width: 80,
        height: 80,
      ),
    );
  }
}
