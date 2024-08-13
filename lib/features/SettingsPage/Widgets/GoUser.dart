import 'package:flutter/material.dart';
import 'dart:io';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoUser extends StatefulWidget {
  const GoUser({super.key});

  @override
  State<GoUser> createState() => _GoUserState();
}

class _GoUserState extends State<GoUser> {
  String username = '';
  File? _image;

  Future<int?> getCurrentUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('currentUserId');
    print('Fetched userId: $userId'); // Debugging output
    return userId;
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _loadProfilePicture(); // Load the profile picture as well
  }

  Future<void> _loadProfilePicture() async {
    int? userId = await getCurrentUserId();
    if (userId != null) {
      UserDao userDao = UserDao();
      User? user = await userDao.getUser(userId);

      if (user != null &&
          user.profilePic != null &&
          user.profilePic!.isNotEmpty) {
        if (File(user.profilePic!).existsSync()) {
          setState(() {
            _image = File(user.profilePic!);
          });
        } else {
          print('Profile picture file does not exist'); // Debugging output
        }
      } else {
        print('No profile picture found'); // Debugging output
      }
    }
  }

  Future<void> _loadUsername() async {
    try {
      int? userId = await getCurrentUserId();
      if (userId != null) {
        UserDao userDao = UserDao();
        User? user = await userDao.getUser(userId);
        print('Fetched user: ${user?.name}'); // Debugging output

        if (user != null) {
          setState(() {
            username = user.name ?? 'Guest';
            print('Username set: $username'); // Debugging output
          });
        } else {
          print('User not found'); // Debugging output
        }
      } else {
        print('UserId is null'); // Debugging output
      }
    } catch (e) {
      print('Error loading username: $e'); // Catch and print any exceptions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 320,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFAF3),
        border: Border.all(
          color: const Color(0xFF7469B6), // Border color
          width: 3, // Border width (optional)
        ),
        borderRadius: BorderRadius.circular(20), // Border radius
      ),
      child: Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: Row(
            children: [
              const SizedBox(width: 12),
              ClipOval(
                child: _image != null
                    ? Image.file(
                        _image!,
                        width: 58,
                        height: 58,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/Profilepic.png',
                        width: 58,
                        height: 58,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(width: 26),
              Text(
                '$username',
                style: TextStyle(
                  fontSize: 20, // Adjust the font size
                  color: Color(0xFF1E1077),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CourierPrime',
                ),
              ),
              const SizedBox(width: 69),
              Image.asset(
                'assets/arrow.png',
                width: 38,
                height: 38,
              )
            ],
          )),
    );
  }
}
