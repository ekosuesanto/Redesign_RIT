import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:helloworld/onboarding.dart';
import 'package:helloworld/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _newinstaller;

  @override
  void initState() {
    super.initState();
    _newinstaller = _prefs.then((SharedPreferences prefs) {
      return (prefs.getBool('new_installer') ?? true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _newinstaller,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return (snapshot.data == true) ? OnBoarding() : MainPage();
              }
          }
        });
  }
}
