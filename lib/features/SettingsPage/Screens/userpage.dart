import 'package:flutter/material.dart';
import 'dart:io';
import 'package:my_journey/features/SettingsPage/Screens/settings.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  File? _image;
  final picker = ImagePicker();
  int? userId;
  String? username;
  String? password;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('currentUserId');
      username = prefs.getString('username') ?? 'Default Username';
      password = prefs.getString('password') ?? 'Default Password';
    });
  }

  // Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null && userId != null && username != null && password != null) {
      String filePath = pickedFile.path;
      print('Picked file path: $filePath'); // Debugging output

      User updatedUser = User(
          id: userId!,
          name: username!,
          password: password!,
          profilePic: filePath);
      UserDao userDao = UserDao();
      int result = await userDao.updateUser(updatedUser);
      print('User updated: $result'); // Debugging output

      setState(() {
        _image = File(filePath);
      });
    } else {
      // Handle the null case, perhaps by showing an error message
      print("User data is missing.");
    }
  }

  // Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null && userId != null && username != null && password != null) {
      String filePath = pickedFile.path;
      print('Picked file path: $filePath'); // Debugging output

      User updatedUser = User(
          id: userId!,
          name: username!,
          password: password!,
          profilePic: filePath);
      UserDao userDao = UserDao();
      int result = await userDao.updateUser(updatedUser);
      print('User updated: $result'); // Debugging output

      setState(() {
        _image = File(filePath);
      });
    } else {
      // Handle the null case, perhaps by showing an error message
      print("User data is missing.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF3),
      body: Stack(children: [
        Padding(
            padding: EdgeInsets.only(top: 60, left: 30, right: 20),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  );
                },
                child: Image.asset(
                  'assets/Back.png',
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(width: 55),
              Text(
                'Edit Profile',
                style: TextStyle(
                  fontSize: 28, // Adjust the font size
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CourierPrime',
                ),
              ),
            ]))
      ]),
    );
  }
}
