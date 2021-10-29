import 'package:flutter/material.dart';

class SignIn extends StatelessWidget{
    Widget build(BuildContext context) {
        return MaterialApp( 
            debugShowCheckedModeBanner:false, 
            home: Scaffold( 
                body: SignInForm() 
            ), 
        );
    }
}

class SignInForm extends StatefulWidget{
    const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}
class _SignInFormState extends State<SignInForm>{
  @override

  Widget build(BuildContext context) {
      return Container( 
          padding:EdgeInsets.only(
             left:24.0, 
             right:24.0, 
             top:15.0, 
             bottom:15.0
          ), 
          width:
MediaQuery.of(context).size.width, 
          height: MediaQuery.of(context).size.height, 
          child:Column( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              crossAxisAlignment: CrossAxisAlignment.start, 
              children: [ 
                  Text("logo"), 
                  Text("signin"),
                  Text("signin in sosmed"),
              ]
          ) 
      ) ;
  }
}