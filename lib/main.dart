

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:student_guide/views/screens/authentication/login_screen.dart';
import 'package:student_guide/views/screens/authentication/register_screen.dart';
import 'package:student_guide/views/screens/classes_screen.dart';
import 'package:student_guide/views/screens/files_screen.dart';
import 'package:student_guide/views/screens/homescreeen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:student_guide/control/news_providers.dart';
import 'package:student_guide/control/settings_providers.dart';
import 'package:student_guide/views/screens/coursse_detail_screen.dart';
import 'package:student_guide/views/screens/coursse_detail_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider()),
      ChangeNotifierProvider<NewsProvider>(create: (context) => NewsProvider()),
    ],
    child: MyApp(),
  ));


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
      theme: ThemeData(
        //appBarTheme: AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle()),
        primaryColor: Color(0XFF3598DB),
        scaffoldBackgroundColor: Colors.white,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          brightness: Brightness.light,
          secondary: Color(0xFF2872A4),
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: Color(0xFF5D9CEC),
        scaffoldBackgroundColor: Color(0xFF060E1E),
        colorScheme: Theme.of(context).colorScheme.copyWith(
          brightness: Brightness.dark,
          secondary: Color(0xFF2872A4),
        ),
      ),
      themeMode: Provider.of<SettingsProvider>(context).mode,
      home: LoginScreen(),
      routes: {
        ClassesScreen.routName: (cts) => ClassesScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CourseDetailScreen.routeName: (context) => CourseDetailScreen(),
      },
    );

  }
}

