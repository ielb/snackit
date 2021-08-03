import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snackit/pages/screens.dart';
import 'package:snackit/pages/splach_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   Widget? widgett;
  @override
  void initState() { 
    super.initState();
    widgett=Image.asset( Config.sanwidish);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home" :(context) => HomePage(),
        "/login" :(context) => HomePage(),
        "/register" :(context) => RegisterPage(),
        "/user" :(context) => HomePage(),
        "/snack" :(context) => HomePage(),
        "/forget_psd" :(context) => HomePage(),
        "/verify" :(context) => HomePage(),
        "/map" :(context) => HomePage(),
        "/setting" :(context) => HomePage(),
        "/welcome" :(context) =>WelcomePage()
      },
      home:  FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
        builder: (context,snap){
          if(snap.connectionState ==ConnectionState.waiting){
            return SplachPage();
          }else
            return WelcomePage();
      },),
    );
  }
}