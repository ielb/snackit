import 'package:flutter/material.dart';
import 'package:snackit/pages/screens.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: Config.getHeight(context)*.1),
          height: Config.getHeight(context),
          width: Config.getWidth(context),
          child: Column()
        )
      )
    );
  }
}