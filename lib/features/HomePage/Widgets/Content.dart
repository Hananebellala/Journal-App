import 'package:flutter/material.dart';

class Content extends StatefulWidget {
  final String category;
  final String title;
  final String cover;
  const Content({
    super.key,
    required this.category,
    required this.title,
    required this.cover,
  });

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns the text to the left
          children: [
            Text(
              widget.category,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'CourierPrime',
              ),
            ),
            const SizedBox(height: 26),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'CormorantUpright',
              ),
            ),
          ],
        ),
        const SizedBox(width: 77),
        SizedBox(
          height: 120,
          width: 120,
          child: Image.asset(
            widget.cover,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
