import 'package:flutter/material.dart';

class DaysButton extends StatefulWidget {
  const DaysButton({super.key, required this.day});
  final String day;

  @override
  State<DaysButton> createState() => _DaysButtonState();
}

class _DaysButtonState extends State<DaysButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            _isSelected ? const Color(0xFF1E1077) : const Color(0xFFFFFAF3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Color(0xFF1E1077), width: 2),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minimumSize: const Size(45, 45),
      ),
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Text(
        widget.day,
        style: TextStyle(
          fontSize: 16,
          color:
              _isSelected ? const Color(0xFFFFFAF3) : const Color(0xFF1E1077),
          fontWeight: FontWeight.w600,
          fontFamily: 'CourierPrime',
        ),
      ),
    );
  }
}
