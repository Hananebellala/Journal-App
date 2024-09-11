import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';
import 'package:my_journey/features/HomePage/Screens/home.dart';

class SaveeButton extends StatelessWidget {
  final String category;
  final String? imagePath1;
  final String? imagePath2;
  final String? imagePath3;
  final String? imagePath4;
  final String title;
  final String text;
  final String date; 
  final int userId; 

  const SaveeButton({
    super.key,
    required this.category,
    this.imagePath1,
    this.imagePath2,
    this.imagePath3,
    this.imagePath4,
    required this.title,
    required this.text,
    required this.date,
    required this.userId,
  });

  Future<void> _saveEntry() async {
    final dbHelper = DatabaseHelper();

   
    final pictures = [
      imagePath1,
      imagePath2,
      imagePath3,
      imagePath4
    ].where((path) => path != null).join(',');

    await dbHelper.insertEntry(
      userId,
      date,
      title,
      text,
      pictures.isNotEmpty ? pictures : null,
      category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF7469B6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minimumSize: const Size(300, 57),
      ),
      onPressed: () async {
        await _saveEntry(); // Save the entry to the database
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      },
      child: const Text(
        'Save',
        style: TextStyle(
          fontSize: 30,
          color: const Color(0xFFFFFAF3),
          fontWeight: FontWeight.w600,
          fontFamily: 'CormorantUpright',
        ),
      ),
    );
  }
}

