import 'package:flutter/material.dart';
import 'package:snackit/pages/screens.dart';

class Input extends StatelessWidget {
  Input(this.hint,this.icon,this.obscure,this.prefixIcon);

  final String hint;
  final Widget icon;
  final Widget? prefixIcon;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: Config.getWidth(context)*.8,
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          hoverColor: Config.gray,
          fillColor: Config.gray,
          errorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ), 
          hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,color: Config.darkGray),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Config.gray,
              width: 1.5,
            ),
          ) ,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Config.orange,
              width: 1.5,
            ),
          ),
          suffixIcon: prefixIcon,
          prefixIcon: Padding(
            child: IconTheme(
              data: IconThemeData(color: Config.darkGray),
              child: icon,
            ),
            padding: EdgeInsets.only(left: 10, right: 10),
          ),
        )
      ),
    );
  }
}