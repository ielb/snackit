import 'package:flutter/material.dart';
import 'screens.dart';
class SplachPage extends StatelessWidget {
  const SplachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 20,left:20 ),
        height: Config.getHeight(context),
        width: Config.getWidth(context),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.colorBurn),
            image: AssetImage(Config.sanwidish1),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: CircularProgressIndicator(color: Config.orange,),
        ),
      )
    );
  }
}