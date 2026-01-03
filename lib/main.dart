

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import 'package:provider/provider.dart';
import 'package:student_guide/features/home/controller/news_providers.dart';


import 'core/services/message_service.dart';
import 'features/auth/controller/auth_controller.dart';

import 'features/home/controller/settings_providers.dart';
import 'firebase_options.dart';
import 'my_app/my_app.dart';
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
      ChangeNotifierProvider<AuthController>(
          create: (context) => AuthController()),
      ChangeNotifierProvider<NewsProvider>(create: (context) => NewsProvider()),
    ],
   child:  MyApp(),

  )));


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