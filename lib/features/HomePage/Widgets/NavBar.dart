import 'package:flutter/material.dart';
import 'package:my_journey/features/HomePage/Screens/Home.dart';
import 'package:my_journey/features/WritePage/Screens/Write.dart';
import 'package:my_journey/features/SettingsPage/Screens/settings.dart';
import 'package:my_journey/features/AllDairiesPage/Screens/alldiaries.dart';

class NavBar extends StatelessWidget {
  final int currentIndex;
  const NavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        if (currentIndex != 0) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Home()));
        }
        break;
      case 1:
        if (currentIndex != 1) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Write()));
        }
        break;
      case 2:
        if (currentIndex != 2) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Alldiaries()));
        }
        break;
      case 3:
        if (currentIndex != 3) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Settings()));
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      decoration: const BoxDecoration(
        color: Color(0xFF7469B6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10), // Add padding from the top
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          onTap: (index) => _onItemTapped(context, index),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 0
                    ? 'assets/Home_on.png'
                    : 'assets/home_off.png',
                width: currentIndex == 0 ? 34.44 : 30.0,
                height: currentIndex == 0 ? 34.44 : 30.0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 1
                    ? 'assets/Edit_on.png'
                    : 'assets/Edit_off.png',
                width: currentIndex == 1 ? 40 : 30.0,
                height: currentIndex == 1 ? 40 : 30.0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 2
                    ? 'assets/Gallery_on.png'
                    : 'assets/Gallery_off.png',
                width: currentIndex == 2 ? 34.44 : 30.0,
                height: currentIndex == 2 ? 34.44 : 30.0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                currentIndex == 3
                    ? 'assets/Settings_on.png'
                    : 'assets/Settings_off.png',
                width: currentIndex == 3 ? 34.44 : 30.0,
                height: currentIndex == 3 ? 34.44 : 30.0,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
