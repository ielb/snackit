import 'package:flutter/material.dart';
import 'package:snackit/pages/screens.dart';

class Input extends StatelessWidget {
  Input(this.controller,this.hint,this.icon,this.obscure,this.prefixIcon);

  final String hint;
  final Widget icon;
  final Widget? prefixIcon;
  final bool obscure;
  final  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: Config.getWidth(context)*.8,
      child: TextFormField(
        validator: (v){
          if(v!.isEmpty){
            switch (hint){
              case 'Email':
                return "Email is required";
              case 'Password':
                return "Password is required";
              case 'Confirme password':
                return "Confirme Password is required";
            }
          }else{
            switch (hint){
              case 'Email':
              if(!Config.isEmail(controller!.text))            
                return "Incorrect email format";
                break;
              case 'Password':
              if(!Config.pwdValidator(v))
                return "Password is short";
              break;
              case 'Confirme password':
              if(!Config.pwdValidator(v))
                return "Confirme Password is short";
            }
          }
        },
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          filled: true,
          hoverColor: Config.gray,
          fillColor: Config.gray,
          errorBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Colors.red.withOpacity(0.5),
              width: 1.5,
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