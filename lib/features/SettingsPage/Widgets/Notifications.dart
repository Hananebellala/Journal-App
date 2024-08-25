import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final bool isSwitched;
  final ValueChanged<bool> onChanged;

  const Notifications({
    required this.isSwitched,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: onChanged,
      activeColor: const Color(0xFF7469B6), // Color when ON
      inactiveThumbColor: const Color(0xFF7469B6), // Circle color when OFF
      inactiveTrackColor: const Color(0xFFFFF6E9), // Track color when OFF
      // Customize border of the switch
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
