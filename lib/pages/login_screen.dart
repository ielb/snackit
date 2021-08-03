import 'package:flutter/material.dart';
import 'package:snackit/widgets/input_widget.dart';
import 'screens.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? _emailController,_passwordController;
  bool _showPassword =true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
  void initState() {
    _emailController= TextEditingController();
    _passwordController= TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){ Navigator.pop(context);},
          icon:Icon( MyIcons.left,color: Config.black,),
        ),
        elevation: 0,
        title: Text("Welcome Back !",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Config.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: Config.getHeight(context)*.1),
          height: Config.getHeight(context),
          width: Config.getWidth(context),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(children: [
                  MyAnimation(Container(
                        margin: EdgeInsets.only(top: Config.getHeight(context)*.01),
                        child: Input(_emailController,"Email", Container(margin:EdgeInsets.only(left: 10,right:10 ),child: Icon(MyIcons.email,size: 18,)), false, null)),
                      ),
                  MyAnimation(
                        Container(
                        child: Input(_passwordController,"Password", Container(margin:EdgeInsets.only(left: 10,right:10 ),child: Icon(MyIcons.lock,size: 18,)), _showPassword, GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          child: Icon(
                            _showPassword ? Icons.visibility : Icons.visibility_off,color: Config.darkGray,
                          ),
                        ),)),
                      ),
                ],) 
              ),
      
              Container(
                margin: EdgeInsets.only(bottom: Config.getHeight(context)*.07),
                padding: EdgeInsets.only(right: 30),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/forget_password");
                  },
                  child: Text("Forget your password ?",style: TextStyle(color: Config.orange,fontSize: 18,fontWeight: FontWeight.w400,decoration: TextDecoration.underline),))),
              MyAnimation(
                Container(
                  height:Config.getHeight(context)*.07 ,
                  width: Config.getWidth(context)*.65,
                  child: ElevatedButton(
                    onPressed:(){
                     // Navigator.pushReplacementNamed(context,"/register");
                      if( _formKey.currentState!.validate()){
                        
                      }
                    },
                    style:OutlinedButton.styleFrom(
                      backgroundColor:Config.orange,
                      shadowColor: Config.black.withOpacity(0.6),
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      )
                    ),
                    child: Center(child: Text( "Login",style:  TextStyle(color: Config.black,fontSize: 20,fontWeight: FontWeight.w400),)),
                  ),
                )
              ),
            MyAnimation(Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w300)),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Text("Sign Up!",style: TextStyle(fontSize: 20,color: Config.orange,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),))
              ],
            )),
            MyAnimation(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Divider(color: Config.darkGray,thickness: 0.5,indent: 60,endIndent: 10,)
                ),       
                Text("OR",style: TextStyle(fontSize: 16,color: Config.darkGray,fontWeight: FontWeight.w400)), 
                Expanded(
                  child:  Divider(color: Config.darkGray,thickness: 0.5,indent: 10,endIndent: 60)
                ),
              ]
            )),
            MyAnimation(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Config.black.withOpacity(0.2),
                        spreadRadius: 0.1,
                        blurRadius: 30,
                        offset:  Offset(3,1).scale(5,6)
                      )
                    ]),
                    child: Config.facebook
                  ),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Config.black.withOpacity(0.2),
                        spreadRadius: 0.1,
                        blurRadius: 30,
                        offset:  Offset(3,1).scale(5,6)
                      )
                    ]),
                    child: Config.google),
                ),
              ]
            )),
            ], 
          ),
        ),
      )
    );
  }
}