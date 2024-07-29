import 'package:flutter/material.dart';
import 'dart:io';
import 'package:my_journey/features/GettingStarted/Widgets/Skip.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Finish.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? _image;
  final picker = ImagePicker();

  // Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  // Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
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
                const SizedBox(height: 80),
                Center(child: _image == null ? SkipButton() : FinishButton())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
