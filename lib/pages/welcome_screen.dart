import 'package:flutter/material.dart';
import 'screens.dart';



class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String welcome ="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean consequat condimentum euismod.Cras non sagittis mauris. Aenean sit amet dapibus.";

  @override
  Widget build(BuildContext context) {
    return    
    Scaffold(
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
        child: Column(
          children: [
            MyAnimation(Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: Config.getHeight(context)*.06,bottom:  Config.getHeight(context)*.06),
              child: RichText(
                text: TextSpan(
                  text: "Welcome to ",
                  style: TextStyle(color: Config.white,fontSize: 26,fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(
                      text: "Snack It",
                      style: TextStyle(color: Config.white,fontSize: 28,fontWeight: FontWeight.bold)
                    )
                  ]
                )
              )
            )),
            MyAnimation(Container(
              child: Text(
                welcome,
                style:TextStyle(color: Config.white,fontSize: 20,fontWeight: FontWeight.w300)
              )
            )),
            SizedBox(height: Config.getHeight(context)*.04,),
            MyAnimation(Container(
              margin: EdgeInsets.only(top: Config.getHeight(context)*.10,bottom: Config.getHeight(context)*.02),
              height:Config.getHeight(context)*.065 ,
              width: Config.getWidth(context)*.75,
              child: ElevatedButton(
                onPressed:(){
                  Navigator.pushReplacementNamed(context,"/register");
                },
                style:OutlinedButton.styleFrom(
                  backgroundColor:Config.orange,
                  shadowColor: Config.black.withOpacity(0.6),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.0),
                  )
                ),
                child: Center(child: Text( "Create an account",style:  TextStyle(color: Config.black,fontSize: 20,fontWeight: FontWeight.w400),)),
              ),
            )),
            MyAnimation(Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?",style: TextStyle(fontSize: 16,color: Config.white,fontWeight: FontWeight.w300)),
                TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text("Sign In",style: TextStyle(fontSize: 20,color: Config.orange,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),))
              ],
            )),
            SizedBox(height: Config.getHeight(context)*.02,),
            MyAnimation(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Divider(color: Config.white,thickness: 0.5,indent: 20,endIndent: 20,)
                ),       
                Text("OR",style: TextStyle(fontSize: 16,color: Config.white,fontWeight: FontWeight.w400)), 
                Expanded(
                  child:  Divider(color: Config.white,thickness: 0.5,indent: 20,endIndent: 20)
                ),
              ]
            )),
              SizedBox(height: Config.getHeight(context)*.01,),
            MyAnimation(Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context,'/home');
                  },
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Config.black.withOpacity(0.4),
                        spreadRadius: 0.1,
                        blurRadius: 30,
                        offset:  Offset(3,1).scale(5,6)
                      )
                    ]),
                    child: Config.facebook
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context,'/home');
                  },
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Config.black.withOpacity(0.4),
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
    );
  }
}