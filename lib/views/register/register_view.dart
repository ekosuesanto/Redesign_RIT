
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_wizard/multi_wizard.dart';
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
  final _formKey = GlobalKey<FormState>();
  
  String? _nameCtrl;
  final TextEditingController _emailCtrl = TextEditingController();

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
                      Center(
                        child : SizedBox( 
                          width: 500,
          height: 300, 
                          child : MultiWizard(
                             steps: [ 
                                 WizardStep(
                showPrevious: false, // Removes the previous button
                nextFunction: () => print('You pressed the next button'),
                child: Container(
                  height: double.infinity,
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Welcome to the most amazing app ever!",
                      ),
                      Text("Created By josat799"),
                    ],
                  ),
                ),
              ),
                                 WizardStep(
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      decoration: InputDecoration(hintText: 'Your name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'You must have a name!';
                        } else if (value.length < 2) {
                          return 'Your name must be atleast 2 charachters long!';
                        }
                      },
                      onSaved: (value) {
                        _nameCtrl = value!;
                      },
                    ),
                  ),
                ),
              ), 
                             ], 
                             finishFunction: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Welcome $_nameCtrl!'),
                  duration: Duration(seconds: 5),
                ));
              }
            },
                          ),
                      ) , 
                          ), 
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