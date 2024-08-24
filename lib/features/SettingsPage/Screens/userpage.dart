import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_journey/features/HomePage/Widgets/NavBar.dart';
import 'dart:io';
import 'package:my_journey/features/SettingsPage/Screens/settings.dart';
import 'package:my_journey/features/SettingsPage/Widgets/SaveButton.dart';
import 'package:my_journey/features/SettingsPage/Widgets/ResetButton.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';
import 'package:image_picker/image_picker.dart';
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
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    _namecontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
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

    if (pickedFile != null &&
        userId != null &&
        username != null &&
        password != null) {
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

  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  // Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null &&
        userId != null &&
        username != null &&
        password != null) {
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
      body: Column(children: [
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
            ])),
        const SizedBox(height: 47),
        Column(children: [
          Center(
              child: GestureDetector(
            onTap: showOptions,
            child: ClipOval(
              child: _image != null
                  ? Image.file(
                      _image!,
                      width: 146,
                      height: 146,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/Profilepic.png',
                      width: 146,
                      height: 146,
                      fit: BoxFit.cover,
                    ),
            ),
          )),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'User name',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'CourierPrime',
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.only(right: 25.0),
              child: Container(
                width: 340, // Set the width of the TextField
                height: 62, // Set the height of the TextField
                child: TextField(
                  controller: _namecontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFAF3),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Color(0xFF7469B6), // Border color
                        width: 3.0, // Border width
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Color(0xFF7469B6), // Border color when enabled
                        width: 3.0, // Border width when enabled
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Color(0xFFAD88C6), // Border color when focused
                        width: 3.0, // Border width when focused
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20.0, // Text size
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'CourierPrime', // Text color
                  ),
                ),
              )),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Password',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF000000),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'CourierPrime',
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
              padding: EdgeInsets.only(right: 25.0),
              child: Container(
                width: 340, // Set the width of the TextField
                height: 62, // Set the height of the TextField
                child: TextField(
                  controller: _passwordcontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFFFFAF3),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Color(0xFF7469B6), // Border color
                        width: 3.0, // Border width
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Color(0xFF7469B6), // Border color when enabled
                        width: 3.0, // Border width when enabled
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                      borderSide: BorderSide(
                        color: Color(0xFFAD88C6), // Border color when focused
                        width: 3.0, // Border width when focused
                      ),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20.0, // Text size
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'CourierPrime', // Text color
                  ),
                ),
              )),
        ]),
      ]),
      bottomNavigationBar: NavBar(currentIndex: 3),
    );
  }
}
