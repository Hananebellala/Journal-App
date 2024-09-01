import 'package:flutter/material.dart';
import 'package:my_journey/features/HomePage/Screens/home.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';

class FinishButton extends StatelessWidget {
  final int userId;
  final String name;
  final String password;
  final String imagePath;

  const FinishButton({
    required this.userId,
    required this.name,
    required this.password,
    required this.imagePath,
    Key? key,
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
        // Update the user's profile

User updatedUser = User(
          id: userId,
          name: name,
          password: password,
          profilePic: imagePath,
        );

        UserDao userDao = UserDao();
        int result = await userDao.updateUser(updatedUser);
        print('User updated: $result'); // Debugging output

        // Navigate to the Home page after updating
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      },
      child: const Text(
        'Finish',
        style: TextStyle(
          fontSize: 30,
          color: Color(0xFFFFFAF3),
          fontWeight: FontWeight.w600,
          fontFamily: 'CormorantUpright',
        ),
      ),
    );
  }
}
