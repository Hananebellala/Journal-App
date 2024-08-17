import 'package:flutter/material.dart';
import 'package:my_journey/features/HomePage/Widgets/NavBar.dart';
import 'package:my_journey/features/SettingsPage/Widgets/GoUser.dart';
import 'package:my_journey/features/SettingsPage/Widgets/general.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFFAF3),
      body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 30, // Adjust the font size
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CourierPrime',
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Center(child: GoUser()),
              const SizedBox(height: 40),
              Center(child: General())
            ],
          )),
      bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }
}
