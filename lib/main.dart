import 'package:flutter/material.dart';

import 'package:my_journey/features/LoadingPage/Screens/Loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isUserLoggedIn() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.containsKey('userId');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool loggedIn = await isUserLoggedIn();

  runApp(MyApp(islogged: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool islogged;
  const MyApp({super.key, required this.islogged});

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'CormorantUpright'),
      home: Loading(islogged: islogged),
    );
  }
}
