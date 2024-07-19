import 'package:flutter/material.dart';
import 'package:my_journey/features/LoadingPage/Screens/Loading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'CormorantUpright'),
      home: Loading(),
    );
  }
}
