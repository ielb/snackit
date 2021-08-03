import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snackit/widgets/input_widget.dart';
import 'screens.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
TextEditingController? _phoneNumberController,_emailController,_passwordController,_confirmePasswrodController ;
  bool _showPassword =true;
  bool _showPassword2 =true;
  bool ontap = false;
  String text = ""; 
  int maxLength = 10;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    _emailController= TextEditingController();
    _passwordController= TextEditingController();
    _confirmePasswrodController= TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){ Navigator.pushReplacementNamed(context, "/welcome");},
          icon:Icon( MyIcons.left,color: Config.black,),
        ),
        elevation: 0,
        title: Text("Create an account",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Config.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Config.getHeight(context),
          width: Config.getWidth(context),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children:[
                      MyAnimation(Container(
                        margin: EdgeInsets.only(top: Config.getHeight(context)*.01),
                        child: Input(_emailController,"Email", Container(margin:EdgeInsets.only(left: 10,right:10 ),child: Icon(MyIcons.email,size: 18,)), false, null)),
                      ),
                      MyAnimation(
                        GestureDetector(
                          onTap: (){
                            setState(() {
                                ontap = !ontap;
                              });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: Config.getHeight(context)*.005),
                            height: 60,
                            width: Config.getWidth(context)*.8,
                            decoration: BoxDecoration(
                              color: Config.gray,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: ontap ? Config.orange : Config.gray,
                                width: 1.5
                              )
                            ), 
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.only(left: 15,right: 10),
                                        child: Image.asset("assets/flags/ma.png",fit: BoxFit.contain,),
                                ),
                                Text("+212",style: TextStyle(color: Config.darkGray,fontSize: 15,fontWeight: FontWeight.w400),),
                                Container(
                                  height: 60,
                                  width:   Config.getWidth(context)*.5,
                                  child: TextFormField(
                                    controller: _phoneNumberController,
                                    onChanged: (String newVal) {
                                      if(newVal.length <= maxLength){
                                        text = newVal;
                                      }else{
                                        _phoneNumberController!.value = new TextEditingValue(
                                          text: text,
                                          selection: new TextSelection(
                                            baseOffset: maxLength,
                                            extentOffset: maxLength,
                                            affinity: TextAffinity.downstream,
                                            isDirectional: false
                                          ),
                                          composing: new TextRange(
                                            start: 0, end: maxLength
                                          )
                                        );
                                        _phoneNumberController!.text = text;
                                      } 
                                    },
                                    validator: (s){
                                      if(s!.isEmpty){
                                        return 'Phone number is required';
                                      }
                                      else{
                                        if(s.length<10){
                                          return "Please provide a correct number";
                                        }else{
                                          if(!Config.isNumber(_phoneNumberController!.text)){
                                            return "Incorrect number format";
                                          }
                                        }
                                      }
                                    },
                                    onFieldSubmitted: (v){
                                      setState(() {
                                        ontap = !ontap;
                                      });
                                    },
                                    onTap: (){
                                      setState(() {
                                        ontap = !ontap;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration:  InputDecoration(
                                      filled: true,
                                      hoverColor: Config.gray,
                                      fillColor: Config.gray,
                                      errorBorder:OutlineInputBorder(
                                        gapPadding: 1,
                                        borderRadius: BorderRadius.circular(16),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                          width: 1.5,
                                        ),
                                      ), 
                                      hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,color: Config.darkGray),
                                      hintText: 'Phone number',
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
                                          color: Config.gray,
                                          width: 1.5,
                                        ),
                                      ),
                                    ) ,
                                  ),
                                )
                              ],
                            )
                          ),
                        )),
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
                    MyAnimation(
                      Container(
                        margin: EdgeInsets.only(bottom: Config.getHeight(context)*.015),
                        child: Input(_confirmePasswrodController,"Confirme password", Container(margin:EdgeInsets.only(left: 10,right:10 ),child: Icon(MyIcons.lock,size: 18,)), _showPassword2, GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword2 = !_showPassword2;
                              });
                            },
                          child: Icon(
                            _showPassword ? Icons.visibility : Icons.visibility_off,color: Config.darkGray,
                          ),))),
                    ),
                    
                  ]
                ),
              ),
              
                  MyAnimation(Container(
                    height:Config.getHeight(context)*.07 ,
                    width: Config.getWidth(context)*.65,
                    child: ElevatedButton(
                    onPressed:(){
                     // Navigator.pushReplacementNamed(context,"/register");
                      if( _formKey.currentState!.validate()){
                        // if(_passwordController!.value!= _confirmePasswrodController!.value||!Config.pwdValidator(_passwordController!.text)||!Config.pwdValidator(_confirmePasswrodController!.text)){
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //     content: Text("Password doesn't match or is short "),
                        //   ));
                        // }
                        
                        Navigator.pushNamed(context,'/verify');
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
                  child: Center(child: Text( "Sign Up",style:  TextStyle(color: Config.black,fontSize: 20,fontWeight: FontWeight.w400),)),
                ),
                )),      
            MyAnimation(Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w300)),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text("Sign In",style: TextStyle(fontSize: 20,color: Config.orange,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),))
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
      ),
    );
  }
}