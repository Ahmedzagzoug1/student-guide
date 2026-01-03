
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '../core/resources/theme_manager.dart';
import '../features/auth/controller/auth_controller.dart';
import '../features/auth/view/screens/login_screen.dart';
import '../features/auth/view/screens/register_screen.dart';
import '../features/books/view/screens/classes_screen.dart';
import '../features/books/view/screens/coursse_detail_screen.dart';
import '../features/home/controller/settings_providers.dart';
import '../features/home/view/screens/home_screen.dart';

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
      home: Consumer<AuthController>(
        builder: (context, auth, child) {
          if (auth.status == Status.loading) {
            return CircularProgressIndicator();
          } else if (auth.status == Status.success && auth.currentUser != null) {
            return HomeScreen();
          } else {
            return RegisterScreen();
          }
        },
      ),
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
