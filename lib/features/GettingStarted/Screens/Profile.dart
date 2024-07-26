import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Skip.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Finish.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 57.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Set your space',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF1E1077),
                    fontFamily: 'CormorantUpright',
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            const SizedBox(height: 106),
            Column(
              children: [
                Center(
                    child: Text(
                  'Profile Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF1E1077),
                      fontFamily: 'CormorantUpright',
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )),
                const SizedBox(height: 80),
                Center(child: Image.asset('assets/Profilepic.png')),
                //Center(child: )
              ],
            )

            //Center(child: Start())
          ],
        ),
      ),
    );
  }
}
