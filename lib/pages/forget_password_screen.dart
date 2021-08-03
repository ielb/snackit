
import 'package:flutter/material.dart';
import 'package:snackit/pages/screens.dart';
import 'package:snackit/widgets/input_widget.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController?_emailController ;
 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController= TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){ Navigator.pushReplacementNamed(context, "/register");},
          icon:Icon( MyIcons.left,color: Config.black,),
        ),
        elevation: 0,
        title: Text("Password recovery",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Config.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: Config.getHeight(context),
          width: Config.getWidth(context),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding:  EdgeInsets.only(top:Config.getHeight(context)*.05),
                margin:  EdgeInsets.only(left:Config.getHeight(context)*.04),
                child: Text("Please provide a valid email \nto send a verification code"
                  ,style:  TextStyle(color: Config.black,fontSize: 22,fontWeight: FontWeight.w400),
                )
              ),
              Form(
                key: _formKey,
                child:  Padding(
                  padding:  EdgeInsets.only(top:Config.getHeight(context)*.1,bottom: Config.getHeight(context)*.15),
                  child: MyAnimation(Container(
                        margin: EdgeInsets.only(top: Config.getHeight(context)*.01),
                        child: Input(_emailController,"Email", Container(margin:EdgeInsets.only(left: 10,right:10 ),child: Icon(MyIcons.email,size: 18,)), false, null)),
                      ),
                ),
              ),
              MyAnimation(
                Container(
                  height:Config.getHeight(context)*.07 ,
                  width: Config.getWidth(context)*.65,
                  child: ElevatedButton(
                    onPressed:(){
                     // Navigator.pushReplacementNamed(context,"/register");
                      if( _formKey.currentState!.validate()){
                        Navigator.pushNamed(context,"/verify");
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
                    child: Center(child: Text( "Send",style:  TextStyle(color: Config.black,fontSize: 20,fontWeight: FontWeight.w400),)),
                  ),
                )
              ),
            ]
          )
        )
      )
    );
  }

}