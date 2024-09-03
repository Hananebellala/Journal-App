import 'package:flutter/material.dart';
import 'package:my_journey/features/DairyPage/Widgets/photos.dart';
import 'package:my_journey/features/SettingsPage/Screens/userpage.dart';

class Dairy extends StatefulWidget {
  const Dairy({
    super.key,
  });

  @override
  State<Dairy> createState() => _DairyState();
}

class _DairyState extends State<Dairy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              bottom: 20.0), // Adds 20 pixels at the bottom
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 25, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserPage()),
                        );
                      },
                      child: Image.asset(
                        'assets/Back.png',
                        fit: BoxFit.cover,
                        width: 38,
                        height: 38,
                      ),
                    ),
                    const SizedBox(width: 285),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserPage()),
                        );
                      },
                      child: Image.asset(
                        'assets/menu.png',
                        fit: BoxFit.cover,
                        width: 38,
                        height: 38,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Photos(
                  image1: 'assets/Bullet journal-bro 1.png',
                  image2: 'assets/Bibliophile-bro 1.png',
                  image3: 'assets/Bullet journal-bro 1.png',
                  image4: 'assets/Bibliophile-bro 1.png'),
              const SizedBox(height: 30),
              Padding(
                padding:
                    const EdgeInsets.only(left: 25), // Align to match padding
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CourierPrime',
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Dairy Title',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'CormorantUpright',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Fri, Jul 5, 2024',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0XFF1E1077),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CourierPrime',
                      ),
                    ),
                    SizedBox(height: 18),
                    Text(
                      'Lorem ipsum dolor sit amet consectetur. Metus quam tellus dignissim ut eget aliquam consectetur.Euismod nec scelerisque vitae ut ultrices arcu accumsan. Duis nisi sem egestas aliquet sed nisi dui. Dictum urna tristique porttitor lectus eget at. Lorem ipsum dolor.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'CourierPrime',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Ensures the bottom padding
            ],
          ),
        ),
      ),
    );
  }
}
