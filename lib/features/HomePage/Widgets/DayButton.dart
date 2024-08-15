import 'package:flutter/material.dart';

class DaysButton extends StatelessWidget {
  const DaysButton({
    super.key,
    required this.day,
    required this.isSelected,
    required this.onTap,
  });

  final String day;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            isSelected ? const Color(0xFF7469B6) : const Color(0xFFFFFAF3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFF7469B6), width: 2),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minimumSize: const Size(45, 45),
      ),
      onPressed: onTap,
      child: Text(
        day,
        style: TextStyle(
          fontSize: 16,
          color:
              isSelected ? const Color(0xFFFFFAF3) : const Color(0xFF7469B6),
          fontWeight: FontWeight.w600,
          fontFamily: 'CourierPrime',
        ),
      ),
    );
  }
}
