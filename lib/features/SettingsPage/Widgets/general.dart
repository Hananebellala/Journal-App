import 'package:flutter/material.dart';
import 'package:my_journey/features/SettingsPage/Screens/settings.dart';
import 'package:my_journey/features/SettingsPage/Widgets/customSwitch.dart';
import 'package:my_journey/features/SettingsPage/Widgets/Notifications.dart';

class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'CourierPrime',
                  ),
                ),
                SizedBox(width: 100),
                Container(
                  width: 50, // Width of the switch
                  height: 27, // Height of the switch
                  child: CustomSwitch(
                    isSwitched: _isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'CourierPrime',
                  ),
                ),
                SizedBox(width: 50),
                Container(
                  width: 50, // Width of the switch
                  height: 27, // Height of the switch
                  child: Notifications(
                    isSwitched: _isSwitched,
                    onChanged: (bool value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Language',
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'CourierPrime',
                  ),
                ),
                SizedBox(width: 130),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  child: Image.asset(
                    'assets/arrow.png',
                    fit: BoxFit.cover,
                    width: 38,
                    height: 38,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'Get in touch',
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'CourierPrime',
                  ),
                ),
                SizedBox(width: 80),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  child: Image.asset(
                    'assets/arrow.png',
                    fit: BoxFit.cover,
                    width: 38,
                    height: 38,
                  ),
                )
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  'FAQ',
                  style: TextStyle(
                    fontSize: 20, // Adjust the font size
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'CourierPrime',
                  ),
                ),
                SizedBox(width: 190),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Settings()),
                    );
                  },
                  child: Image.asset(
                    'assets/arrow.png',
                    fit: BoxFit.cover,
                    width: 38,
                    height: 38,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
