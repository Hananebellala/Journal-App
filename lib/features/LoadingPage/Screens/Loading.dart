import 'package:flutter/material.dart';
import 'package:my_journey/features/LoadingPage/Widgets/StartButton.dart';
import 'package:shimmer/shimmer.dart';

class Loading extends StatefulWidget {
  final bool islogged;
  const Loading({super.key, required this.islogged});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Loadingg(islogged: widget.islogged)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 151, 139, 223),
              Color.fromARGB(255, 61, 50, 128),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                  baseColor: Color(0xFFF19ED2),
                  highlightColor: Color(0xFFFFF8DB),
                  child: Text(
                    'My Journey',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CormorantUpright',
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Loadingg extends StatelessWidget {
  final bool islogged;
  const Loadingg({super.key, required this.islogged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 151, 139, 223),
              Color.fromARGB(255, 61, 50, 128)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                  baseColor: Color(0xFFF19ED2),
                  highlightColor: Color(0xFFFFF8DB),
                  child: Text(
                    'My Journey',
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CormorantUpright',
                    ),
                  )),
              SizedBox(
                  height: 100), // Add some spacing between the text and button
              StartButton(islogged: islogged),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    Key? key,
    required this.gradient,
    this.style,
  }) : super(key: key);

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
