import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthPage());
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late Future<int> _isSignIn;
  late Future<String?> _authToken;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: _isSignIn,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return (snapshot.data == 0)
                    ? Scaffold(body: Container(child: Text("Login")))
                    : Scaffold(body: Container(child: Text("Main Page")));
              }
          }
        });
  }
}
