
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cool_stepper/cool_stepper.dart';
import 'package:helloworld/views/auth/sign_in.dart';

class RegisterView extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
    ).copyWith(
      secondary: Colors.green,
    ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold( 
          appBar : AppBar( 
              backgroundColor : Colors.transparent, 
              elevation:0 , 
              leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.chevron_left,color:Color(0xFF000000)),
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),
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
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: Image(
                      image: AssetImage( 'assets/onboarding/handing-out-offer-letter.png')),
                      ),
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