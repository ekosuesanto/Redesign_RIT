import  'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
    Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar( 
              leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: () { Scaffold.of(context); },
        
      );
    },
  ),
              title: Text("Register") 
          ), 
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
      return Container ( 
          child: Text("Sign Up Form"), 
      ) ;
  }
}