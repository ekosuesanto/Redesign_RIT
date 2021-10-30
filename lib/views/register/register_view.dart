import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helloworld/views/auth/sign_in.dart';

class RegisterView extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold( 
          body: SignUpForm() 
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
      return LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
        physics: ScrollPhysics(),
        reverse: false,
        primary:true, 
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: constraint.maxHeight,
          ),
          child: IntrinsicHeight( 
              child : Column ( 
                  children : [ 
                      Container( 
                          child : Text("Column 1") 
                      ) , 
                      Container( 
                          child : Text("Column 2") 
                      ) , 
                      Container( 
                          child : Text("Column 3") 
                      ) , 
                  ]
              ) 
          ) 
        ), 
      ) ;
      
     });
  }
}