import 'package:flutter/material.dart';
import 'package:my_journey/features/GettingStarted/Widgets/textContainer.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Start.dart';

class Starting extends StatefulWidget {
  const Starting({super.key});

  @override
  State<Starting> createState() => _StartingState();
}

class _StartingState extends State<Starting> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isfilled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkfields);
    _passwordController.addListener(_checkfields);
  }

  void _checkfields() {
    setState(() {
      isfilled = _nameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
            const SizedBox(height: 20),
            const Padding(
              padding:
                  EdgeInsets.only(left: 52.0), // Left padding for 'Your Name:'
              child: Text(
                'Your Name:',
                style: TextStyle(
                    color: Color(0xFF1E1077),
                    fontFamily: 'CormorantUpright',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(
                  left: 52.0), // Left padding for TextContainer
              child: TextContainer(controller: _nameController),
            ),
            const SizedBox(height: 27),
            const Padding(
              padding: EdgeInsets.only(
                  left: 52.0), // Left padding for 'Secure your journal:'
              child: Text(
                'Secure your journal:',
                style: TextStyle(
                    color: Color(0xFF1E1077),
                    fontFamily: 'CormorantUpright',
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(
                  left: 52.0), // Left padding for TextContainer
              child: TextContainer(controller: _passwordController),
            ),
            const SizedBox(height: 40),
            Center(child: Image.asset('assets/Personal settings-bro 1.png')),
            const SizedBox(height: 54),
            Center(child: Start())
          ],
        ),
      ),
    );
  }
}
