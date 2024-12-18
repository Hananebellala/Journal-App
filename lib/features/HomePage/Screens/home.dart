import 'package:flutter/material.dart';
import 'dart:io';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';
import 'package:my_journey/features/HomePage/Widgets/DayButton.dart';
import 'package:my_journey/features/HomePage/Widgets/NavBar.dart';
import 'package:my_journey/features/HomePage/Widgets/Empty.dart';
import 'package:my_journey/features/HomePage/Widgets/Content.dart';
import 'package:my_journey/features/HomePage/Widgets/WriteButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = '';
  File? _image;
  String selectedDay = '';

  Future<int?> getCurrentUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('currentUserId');
    return userId;
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
    _loadProfilePicture();
    _setInitialDay();
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
        }
      }
    }
  }

  Future<void> _loadUsername() async {
    try {
      int? userId = await getCurrentUserId();
      if (userId != null) {
        UserDao userDao = UserDao();
        User? user = await userDao.getUser(userId);

        if (user != null) {
          setState(() {
            username = user.name ?? 'Guest';
          });
        }
      }
    } catch (e) {
      print('Error loading username: $e');
    }
  }

  void _setInitialDay() {
    final now = DateTime.now();
    final weekday = now.weekday;
    setState(() {
      selectedDay = _mapWeekdayToDay(weekday);
    });
  }

  String _mapWeekdayToDay(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'MON';
      case DateTime.tuesday:
        return 'TUE';
      case DateTime.wednesday:
        return 'WED';
      case DateTime.thursday:
        return 'THU';
      case DateTime.friday:
        return 'FRI';
      case DateTime.saturday:
        return 'SAT';
      case DateTime.sunday:
        return 'SUN';
      default:
        return 'MON';
    }
  }

  void _onDaySelected(String day) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Welcome,\n$username',
                        style: TextStyle(
                          fontSize: screenWidth * 0.08,
                          color: const Color(0xFF1E1077),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CormorantUpright',
                        ),
                      ),
                    ),
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
                    children: [
                      DaysButton(
                        day: 'MON',
                        isSelected: selectedDay == 'MON',
                        onTap: () => _onDaySelected('MON'),
                      ),
                      const SizedBox(width: 4.5),
                      DaysButton(
                        day: 'TUE',
                        isSelected: selectedDay == 'TUE',
                        onTap: () => _onDaySelected('TUE'),
                      ),
                      const SizedBox(width: 4.5),
                      DaysButton(
                        day: 'WED',
                        isSelected: selectedDay == 'WED',
                        onTap: () => _onDaySelected('WED'),
                      ),
                      const SizedBox(width: 4.5),
                      DaysButton(
                        day: 'THU',
                        isSelected: selectedDay == 'THU',
                        onTap: () => _onDaySelected('THU'),
                      ),
                      const SizedBox(width: 4.5),
                      DaysButton(
                        day: 'FRI',
                        isSelected: selectedDay == 'FRI',
                        onTap: () => _onDaySelected('FRI'),
                      ),
                      const SizedBox(width: 4.5),
                      DaysButton(
                        day: 'SAT',
                        isSelected: selectedDay == 'SAT',
                        onTap: () => _onDaySelected('SAT'),
                      ),
                      const SizedBox(width: 4.5),
                      DaysButton(
                        day: 'SUN',
                        isSelected: selectedDay == 'SUN',
                        onTap: () => _onDaySelected('SUN'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                const Content(
                    category: 'daily',
                    title: 'First Dairy',
                    cover: 'assets/Profilepic.png'),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 15,
            child: WriteButton(),
          ),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 0),
    );
  }
}
