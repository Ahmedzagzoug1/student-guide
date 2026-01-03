

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:student_guide/features/auth/view/screens/login_screen.dart';
import 'package:student_guide/features/books/view/screens/classes_screen.dart';

import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:student_guide/features/home/controller/news_providers.dart';


import 'core/resources/theme_manager.dart';
import 'core/services/message_service.dart';
import 'features/auth/view/screens/register_screen.dart';
import 'features/books/view/screens/coursse_detail_screen.dart';
import 'features/home/controller/settings_providers.dart';
import 'features/home/view/screens/home_screen.dart';
import 'firebase_options.dart';
void main() async{
  await dotenv.load();
 await WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
initMessaging();

  runApp(

      EasyLocalization(
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          path: 'assets/translations',
          fallbackLocale: const Locale('en'),
          child:MultiProvider(
    providers: [
      ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider()),
      ChangeNotifierProvider<NewsProvider>(create: (context) => NewsProvider()),
    ],
   child:  MyApp(),

  )));


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     locale: context.locale,
     supportedLocales: context.supportedLocales,
     localizationsDelegates: [
       ...context.localizationDelegates,
       GlobalMaterialLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate,
       GlobalCupertinoLocalizations.delegate,
     ],
       theme: AppTheme.lightTheme,
       darkTheme: AppTheme.darkTheme,
      themeMode: Provider.of<SettingsProvider>(context).mode,
      home: LoginScreen(),
      routes: {
        ClassesScreen.routName: (context) => ClassesScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        CourseDetailScreen.routeName: (context) => CourseDetailScreen(),
      },
    );

  }
}

initMessaging()async{
  await FirebaseMessagingService.init();

  FirebaseMessagingService.onForegroundMessage = (message) {
    print('Foreground: ${message.notification?.title}');
  };

  FirebaseMessagingService.onMessageOpenedApp = (message) {
    print('Opened App: ${message.data}');
  };

  FirebaseMessagingService.onBackgroundMessage = (message) {
    print('Terminated / Background: ${message.data}');
  };

  FirebaseMessagingService.onToken = (token) {
    print('Send token to backend: $token');
  };
}