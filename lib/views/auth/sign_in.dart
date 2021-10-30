import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:helloworld/views/register/register_view.dart';

class SignIn extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: SignInForm()),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late final EdgeInsetsGeometry padding;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  child: Image(
                      image: AssetImage(
                          'assets/onboarding/one-week-before-your-employee-s-first-day.png')),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 15.0, bottom: 15.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        alignment: Alignment.centerLeft,
                      ),
                      SizedBox(height: 5), 
                      Container(child: Row( mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,children: [ 
                          Text("Already account? Please",style:TextStyle(fontSize:12,color:Colors.grey[600])),
                  SizedBox(width:2), 
                          Text("Sign In.",style:TextStyle(fontSize:12,color:Colors.grey[600], fontWeight: FontWeight.bold),)
                      ]),alignment: Alignment.centerLeft),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black54,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:Colors.grey,
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0))),
                            filled: true,
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          autovalidateMode: AutovalidateMode.always,
                          obscureText: true,
                          cursorColor: Colors.black54,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 20, right: 20),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2.0,
                                    style: BorderStyle.solid),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0))),
                            filled: true,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ) , 
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot credential?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800] ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () { Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration( milliseconds: 1500),
                        reverseDuration: Duration(milliseconds: 1500),
                    type: PageTransitionType.rightToLeft,
                    child: RegisterView(),
                  ),
                );
                              },
                              style: ButtonStyle(
                                side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide(
                                      color: Colors.grey.shade800,
                                      width: 2,
                                      style: BorderStyle.solid),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(
                                        color: Colors.grey.shade800,
                                        width: 2,
                                        style: BorderStyle.solid),
                                  ),
                                ),
                              ),
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 80,
                                padding: EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 15.0,
                                    bottom: 15.0),
                                child: Text(
                                  "Sign Up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          side: BorderSide(
                                              color: Colors.white)))),
                              onPressed: () {},
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 60,
                                padding: EdgeInsets.only(
                                    left: 15.0,
                                    right: 15.0,
                                    top: 15.0,
                                    bottom: 15.0),
                                child: Text(
                                  "Sign In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 20.0, bottom: 20.0),
                  child: Column(
                    children: [
                      Text(
                        "or connected with:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black54),
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/facebook.svg',
                            height: 55,
                            width: 55,
                          ),
                          SizedBox(width: 20.0),
                          SvgPicture.asset(
                            'assets/svg/instagram.svg',
                            height: 55,
                            width: 55,
                          ),
                          SizedBox(width: 20.0),
                          SvgPicture.asset(
                            'assets/svg/twitter.svg',
                            height: 55,
                            width: 55,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
