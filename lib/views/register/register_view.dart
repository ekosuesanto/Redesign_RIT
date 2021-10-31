
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
  
  final TextEditingController _nameCtrl = TextEditingController();
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
                      Container( 
                          child : MultiWizard(
                             steps: [ 
                                 WizardStep(
                showPrevious: false, // Removes the previous button
                nextFunction: () => print('You pressed the next button'),
                child: Container(
                  height: double.infinity,
                  child: Wrap(
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ClipRect(
                        child: Image.network(
                            "https://i0.wp.com/www.logoworks.com/blog/wp-content/uploads/2014/03/fruit-vegetable-logos-templates-logo-designs-037.png?w=325&ssl=1"),
                      ),
                      SizedBox(
                        height: 10,
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
                        his._nameCtrl = value!;
                      },
                    ),
                  ),
                ),
              ), 
                             ], 
                             finishFunction: () {
              if (_key.currentState!.validate()) {
                _key.currentState!.save();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Welcome $name!'),
                  duration: Duration(seconds: 5),
                ));
              }
            },
                          ),
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