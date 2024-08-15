import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_journey/features/GettingStarted/Screens/Profile.dart';
import 'package:my_journey/features/GettingStarted/Widgets/DataBase.dart';

class Start extends StatefulWidget {
  // ignore: avoid_types_as_parameter_names
  const Start(
      {super.key,
      required this.isButtonenabled,
      required this.name,
      required this.password});

  final bool isButtonenabled;
  final String name;
  final String password;

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  final UserDao _userDao = UserDao();
  final JournalDao _journalDao = JournalDao();

  Future<void> _storeUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentUserId', userId);
    print('Stored userId: $userId'); // Debugging output
  }

  Future<void> saveUserSession(int userId) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('userId', userId);
}

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.isButtonenabled
            ? const Color(0xFF7469B6)
            : Color.fromARGB(255, 187, 177, 238),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        minimumSize: const Size(300, 57),
      ),
      onPressed: widget.isButtonenabled
          ? () async {
              User newUser = User(
                  name: widget.name,
                  password: widget.password,
                  profilePic: null);
              int userId = await _userDao.createUser(newUser);
              print('User created with ID: $userId ');
              _storeUserId(userId);
              await saveUserSession(userId);

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Profile(
                        userId: userId,
                        name: widget.name,
                        password: widget.password)),
              );
            }
          : null,
      child: const Text(
        'Next',
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
