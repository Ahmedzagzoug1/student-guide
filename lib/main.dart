

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_guide/views/screens/authentication/login_screen.dart';
import 'package:student_guide/views/screens/authentication/register_screen.dart';
import 'package:student_guide/views/screens/homescreeen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();




  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
      home: LoginScreen(),
      routes: {
        LoginScreen.routeName :(context)=>LoginScreen(),
        RegisterScreen.routeName : (context)=>RegisterScreen() ,
        HomeScreen.routeName : (context) =>HomeScreen()
      },
    );
  }
}

