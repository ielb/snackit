


import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Config {



  // Colors 
  static Color orange = Color(0xffFFC43D);
  static Color black = Color(0xff100D04);
  static Color white = Color(0xffFEFFFB);
  static Color darkGray = Color(0xffC0BCB4);
  static Color gray = Color(0xffF2F1EF);
  static Color red = Color(0xffEF476F);
  static Color green = Color(0xff82EBCC);
  static Color blue = Color(0xff34BEE9);




  //images
  static String sanwidish = "images/sandwish.jpg";
  static String sanwidish1 = "images/sandwish1.jpg";
  static Widget facebook =  SvgPicture.asset("assets/Facebook.svg",height: 60,width: 60,);
  static Widget google = SvgPicture.asset("assets/Google.svg",height: 60,width: 60,);
  



  //Dementions

  static double getHeight(context) => MediaQuery.of(context).size.height;
  static double getWidth(context) => MediaQuery.of(context).size.width;

}