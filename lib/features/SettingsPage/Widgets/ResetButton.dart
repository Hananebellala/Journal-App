import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
    required this.username,
    required this.password,
    this.profilePicPath,
  });

  final TextEditingController username;
  final TextEditingController password;
  final String? profilePicPath;

  Future<int?> _getCurrentUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('currentUserId');
  }

  Future<void> _updateUser(BuildContext context) async {
    final userId = await _getCurrentUserId();
    if (userId != null) {
      User updatedUser = User(
        id: userId,
        name: username.text,
        password: password.text,
        profilePic: profilePicPath,
      );
      UserDao userDao = UserDao();
      int result = await userDao.updateUser(updatedUser);

      print('User update result: $result'); // Debugging output

      // Update SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username.text ?? '');
      print('Username: $username');
      print('Password: $password');
      print('Profile Pic Path: $profilePicPath');
      print('User ID: $userId');

      // Fetch and log updated data
      User? user = await userDao.getUser(userId);
      print('Updated username in database: ${user?.name}');
      print(
          'Updated password in database: ${user?.password}'); // Debugging output

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User ID not found!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFF7469B6), // Border color
          width: 3.0, // Border width
        ),
        borderRadius: BorderRadius.circular(18), // Same radius as the button
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFFFAF3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          minimumSize: const Size(280, 50),
        ),
        onPressed: () => _updateUser(context),
        child: const Text(
          'Reset My diary',
          style: TextStyle(
            fontSize: 30,
            color: Color(0xFF7469B6),
            fontWeight: FontWeight.w600,
            fontFamily: 'CormorantUpright',
          ),
        ),
      ),
    );
  }
}
