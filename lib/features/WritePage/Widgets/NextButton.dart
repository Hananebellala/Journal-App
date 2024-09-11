import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';
import 'package:my_journey/features/WritePage/Screens/Write2.dart';

class NextButton extends StatelessWidget {
  final TextEditingController title;
  final TextEditingController dairy;
  final String fDate;

  const NextButton({
    Key? key,
    required this.title,
    required this.dairy,
    required this.fDate,
  }) : super(key: key);

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
  
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Write2(
                    titleController: title.text,
                    dairyController: dairy.text,
                    formattedDate: fDate,
                  )),
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
