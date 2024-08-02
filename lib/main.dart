import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:my_journey/features/LoadingPage/Screens/Loading.dart';
import 'package:my_journey/features/GettingStarted/Widgets/Database.dart';

void main()  {
  
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
