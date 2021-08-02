import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snackit/pages/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home" :(context) => HomePage(),
        "/login" :(context) => HomePage(),
        "/register" :(context) => HomePage(),
        "/user" :(context) => HomePage(),
        "/snack" :(context) => HomePage(),
        "/forget_psd" :(context) => HomePage(),
        "/verify" :(context) => HomePage(),
        "/map" :(context) => HomePage(),
        "/setting" :(context) => HomePage(),
      },
      home: WelcomePage() ,
    );
  }
}