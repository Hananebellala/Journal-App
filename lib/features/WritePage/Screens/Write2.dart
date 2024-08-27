import 'package:flutter/material.dart';
import 'package:my_journey/features/HomePage/Widgets/NavBar.dart';
import 'package:my_journey/features/WritePage/Widgets/SaveeButton.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';

class Write2 extends StatefulWidget {
  const Write2({super.key});

  @override
  State<Write2> createState() => _Write2State();
}

class _Write2State extends State<Write2> {
  String formattedDate = '';

  File? _image;
  File? _image1;
  File? _image2;
  File? _image3;

  final picker = ImagePicker();

  Future<void> getImageFromGallery(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        switch (index) {
          case 0:
            _image = File(pickedFile.path);
            break;
          case 1:
            _image1 = File(pickedFile.path);
            break;
          case 2:
            _image2 = File(pickedFile.path);
            break;
          case 3:
            _image3 = File(pickedFile.path);
            break;
        }
      });
    }
  }

  Future<void> getImageFromCamera(int index) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        switch (index) {
          case 0:
            _image = File(pickedFile.path);
            break;
          case 1:
            _image1 = File(pickedFile.path);
            break;
          case 2:
            _image2 = File(pickedFile.path);
            break;
          case 3:
            _image3 = File(pickedFile.path);
            break;
        }
      });
    }
  }

  Future<void> showOptions(int index) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery(index);
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromCamera(index);
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _setFormattedDate();
  }

  void _setFormattedDate() {
    try {
      final now = DateTime.now();
      final formatter = DateFormat('EEE, MMM d, yyyy');
      setState(() {
        formattedDate = formatter.format(now);
      });
    } catch (e) {
      print('Error formatting date: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 20),
            child: Stack(
              children: [
                Text(
                  'Write about today',
                  style: TextStyle(
                    fontSize: 33,
                    color: const Color(0xFF1E1077),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CormorantUpright',
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 250,
                    color: const Color(0xFF1E1077),
                    height: 3.0,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 140, right: 20),
            child: Text(
              formattedDate.isNotEmpty ? formattedDate : 'Date not available',
              style: TextStyle(
                fontSize: 33,
                color: const Color(0xFF1E1077),
                fontWeight: FontWeight.bold,
                fontFamily: 'CormorantUpright',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 4, left: 10, right: 10),
              height: 50,
              width: 280,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0XFF7469B6),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                'Give it a name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color(0xFF1E1E1E),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CormorantUpright',
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Row(
              children: [
                Text(
                  'Category :',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'CourierPrime',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 20),
            child: Text(
              'Add pictures describing today',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontFamily: 'CourierPrime',
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 55, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => showOptions(0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _image != null
                            ? Image.file(
                                _image!,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/Frame 14.png',
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(width: 18),
                    GestureDetector(
                      onTap: () => showOptions(1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _image1 != null
                            ? Image.file(
                                _image1!,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/Frame 14.png',
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => showOptions(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _image2 != null
                            ? Image.file(
                                _image2!,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/Frame 14.png',
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(width: 18),
                    GestureDetector(
                      onTap: () => showOptions(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _image3 != null
                            ? Image.file(
                                _image3!,
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                'assets/Frame 14.png',
                                width: 140,
                                height: 140,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 22),
          Center(child: SaveeButton()),
        ],
      ),
      bottomNavigationBar: NavBar(currentIndex: 1),
    );
  }
}
