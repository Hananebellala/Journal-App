import 'package:flutter/material.dart';
import 'dart:io';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';
import 'package:my_journey/features/HomePage/Widgets/DayButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Username text
                Expanded(
                  child: Text(
                    'Welcome,\n$username',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08, // Adjust the font size
                      color: Color(0xFF1E1077),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CormorantUpright',
                    ),
                  ),
                ),
                // Profile picture
                ClipOval(
                  child: _image != null
                      ? Image.file(
                          _image!,
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.25,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/Profilepic.png',
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.25,
                          fit: BoxFit.cover,
                        ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  DaysButton(day: 'MON'),
                  SizedBox(width: 4.5),
                  DaysButton(day: 'TUE'),
                  SizedBox(width: 4.5),
                  DaysButton(day: 'WED'),
                  SizedBox(width: 4.5),
                  DaysButton(day: 'THU'),
                  SizedBox(width: 4.5),
                  DaysButton(day: 'FRI'),
                  SizedBox(width: 4.5),
                  DaysButton(day: 'SAT'),
                  SizedBox(width: 4.5),
                  DaysButton(day: 'SUN'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
