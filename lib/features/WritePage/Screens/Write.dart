import 'package:flutter/material.dart';
import 'package:my_journey/features/HomePage/Widgets/NavBar.dart';
import 'package:intl/intl.dart';

class Write extends StatefulWidget {
  const Write({super.key});

  @override
  State<Write> createState() => _WriteState();
}

class _WriteState extends State<Write> {
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    _setFormattedDate();
  }

  void _setFormattedDate() {
    try {
      final now = DateTime.now();
      final formatter = DateFormat('EEE, MMM d, yyyy');
      setState(() {
        formattedDate = formatter.format(now);
      });
    } catch (e) {
      print('Error formatting date: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 20),
            child: Stack(
              children: [
                Text(
                  'Write about today',
                  style: TextStyle(
                    fontSize: 33,
                    color: const Color(0xFF1E1077),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CormorantUpright',
                  ),
                ),
                Positioned(
                  bottom: 0, // Adjust the distance between text and underline
                  left: 0,
                  child: Container(
                    width: 250, // Width of the underline, adjust as needed
                    color: const Color(0xFF1E1077),
                    height: 3.0, // Thickness of the underline
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 140, right: 20),
            child: Text(
              formattedDate.isNotEmpty ? formattedDate : 'Date not available',
              style: TextStyle(
                fontSize: 33,
                color: const Color(0xFF1E1077),
                fontWeight: FontWeight.bold,
                fontFamily: 'CormorantUpright',
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}
