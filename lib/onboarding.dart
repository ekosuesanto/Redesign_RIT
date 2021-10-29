import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helloworld/views/auth/sign_in.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: OnBoardingPage());
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _counter = 0;
  static bool isPortrait = true;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      isPortrait = true;
    } else {
      isPortrait = false;
    }
  }

  void onboardingcounter(int value) {
    int _index = 0;
    if (value < 0) {
      _index *= -1;
    } else {
      _index = value;
    }

    setState(() {
      _counter = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          (_counter == 0)
              ? Container(
                  padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 15.0, bottom: 15.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 100,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image(image: AssetImage('assets/onboarding/First-Day-of-your-new-employee.png')),
                    SizedBox(height: 40.0),
                    Text(
                      "Welcome to Dudu",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: Text(
                        "Register now and enjoy with Dudu",
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ),
                  ]),
                )
              : (_counter == 1)
                  ? Container(
                      padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 15.0, bottom: 15.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 100,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                        Image(
                          image: AssetImage('assets/onboarding/During-the-first-week-of-joining.png'),
                        ),
                        SizedBox(height: 40.0),
                        Text(
                          "Online Ticketing",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text(
                            "Booking your tickets anytime and anywhere is easier with Dudu.",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                      ]),
                    )
                  : Container(
                      padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 15.0, bottom: 15.0),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 100,
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
                        Image(image: AssetImage('assets/onboarding/One-day-before-your-new-hire-s-first-day.png')),
                        SizedBox(height: 40.0),
                        Text(
                          "Facilities and Services",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text(
                            "Enjoy optimal facilities and services from our flight attendants / flight attendants.",
                            style: TextStyle(color: Colors.grey[500]),
                          ),
                        ),
                      ]),
                    ),
          SizedBox(height: 20.0),
          Container(
            height: 80,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 8.0,
                  height: 8.0,
                  color: (_counter == 0) ? Colors.grey[600] : Colors.green[400],
                ),
                SizedBox(width: 12),
                Container(
                  width: 8.0,
                  height: 8.0,
                  color: (_counter == 1) ? Colors.grey[600] : Colors.green[400],
                ),
                SizedBox(width: 12),
                Container(
                  width: 8.0,
                  height: 8.0,
                  color: (_counter == 2) ? Colors.grey[600] : Colors.green[400],
                ),
              ])),
              Container(
                padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 15.0, bottom: 15.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: (_counter == 0)
                        ? [
                            Text(""),
                            GestureDetector(
                              onTap: () => onboardingcounter(1),
                              child: Text(
                                "Next",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[800]),
                              ),
                            ),
                          ]
                        : (_counter == 1)
                            ? [
                                GestureDetector(
                                  onTap: () => onboardingcounter(0),
                                  child: Text(
                                    "Prev",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[400]),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => onboardingcounter(2),
                                  child: Text(
                                    "Next",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[800]),
                                  ),
                                ),
                              ]
                            : [
                                GestureDetector(
                                  onTap: () => onboardingcounter(1),
                                  child: Text(
                                    "Prev",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey[400]),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Route route = MaterialPageRoute(builder: (context) => SignIn());
                                    Navigator.pushReplacement(context, route);
                                  },
                                  child: Text(
                                    "Join Now",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green[500]),
                                  ),
                                ),
                              ]),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
