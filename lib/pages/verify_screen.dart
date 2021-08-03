
import 'package:flutter/material.dart';
import 'package:snackit/pages/screens.dart';

class VerifyPage extends StatefulWidget {
  VerifyPage({Key? key}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
 TextEditingController?_codeController ;
 
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _codeController= TextEditingController();
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
        title: Text("Verification Code",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: Config.black),),
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
                child: Text(
                  "Please provide a verification code \nthat we sent your email"
                ,style:  TextStyle(color: Config.black,fontSize: 22,fontWeight: FontWeight.w400),)
              ),
              Form(
                key: _formKey,
                child:  Padding(
                  padding:  EdgeInsets.only(top:Config.getHeight(context)*.1,bottom: Config.getHeight(context)*.15),
                  child: MyAnimation(
                    Container(
                      height:65,
                      width: Config.getWidth(context)*.8,
                      child: TextFormField(
                        controller: _codeController,
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
                          hintText: "Verification code",
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
                        )
                      ),
                    )
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
                    child: Center(child: Text( "Confirm",style:  TextStyle(color: Config.black,fontSize: 20,fontWeight: FontWeight.w400),)),
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