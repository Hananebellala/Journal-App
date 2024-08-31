import 'package:flutter/material.dart';
import 'package:my_journey/features/LoadingPage/Widgets/StartButton.dart';
import 'package:shimmer/shimmer.dart';

class Passwordd extends StatelessWidget {
  const Passwordd({super.key});

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
                  baseColor: const Color(0xFFF19ED2),
                  highlightColor: const Color(0xFFFFF8DB),
                  child: const Text(
                    'Open my Journal',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'CormorantUpright',
                    ),
                  )),
              const SizedBox(height: 42),
              Container(
                height: 70,
                width: 60,
                child: Image.asset('assets/Lock.png'),
              ),
              const SizedBox(height: 10),
              Container(
                height: 90,
                width: 90,
                child: Image.asset('assets/Points.png'),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (1).png'),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (2).png'),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (3).png'),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 56),
              Row(
                children: [
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (4).png'),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (5).png'),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (6).png'),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 56),
              Row(
                children: [
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (7).png'),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (8).png'),
                    ),
                  ),
                  const SizedBox(width: 18),
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (9).png'),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 56),
              Row(
                children: [
                  SizedBox(width: 90),
                  GestureDetector(
                    //onTap: ,
                    child: Container(
                      height: 68,
                      width: 68,
                      child: Image.asset('assets/Button (10).png'),
                    ),
                  )
                ],
              )
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
