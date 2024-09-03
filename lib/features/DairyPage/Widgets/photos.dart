import 'package:flutter/material.dart';

class Photos extends StatefulWidget {
  final String image1;
  final String image2;
  final String image3;
  final String image4;

  const Photos({
    super.key,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.image4,
  });

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  // Initialize _selectedImage with widget.image1
  late String _selectedImage = widget.image1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Image.asset(
            _selectedImage, // Display the selected image
            fit: BoxFit.cover,
            width: 320,
            height: 200,
          ),
        ),
        const SizedBox(height: 25),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                _updateSelectedImage(widget.image1); // Update large image on tap
              },
              child: Image.asset(
                widget.image1,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                _updateSelectedImage(widget.image2); // Update large image on tap
              },
              child: Image.asset(
                widget.image2,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                _updateSelectedImage(widget.image3); // Update large image on tap
              },
              child: Image.asset(
                widget.image3,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(width: 30),
            GestureDetector(
              onTap: () {
                _updateSelectedImage(widget.image4); // Update large image on tap
              },
              child: Image.asset(
                widget.image4,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
            ),
          ]),
        ),
      ],
    );
  }

  void _updateSelectedImage(String image) {
    setState(() {
      _selectedImage = image;
    });
  }
}
