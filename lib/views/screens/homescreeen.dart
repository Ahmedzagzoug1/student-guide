import 'package:student_guide/models/constants.dart';
import 'package:student_guide/views/screens/course_screen.dart';
import 'package:student_guide/views/screens/news_screen.dart';
import 'package:student_guide/views/screens/setting_screen.dart';
import 'package:student_guide/views/widgets/Category_Item.dart';
import 'package:student_guide/views/widgets/category_screen_title.dart';
import 'package:student_guide/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentScreenIndex = 0;
  List screens = [CourseScreen(), NewsScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Constants.decoration,
      child: Scaffold(
          drawer: MyDrawer(),
          backgroundColor: Colors.transparent,
          /*        appBar: AppBar(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            backgroundColor: Colors.transparent,
            title: Text('Student Guide'),
          ),*/
          body: screens[currentScreenIndex],
          bottomNavigationBar: BottomAppBar(
            clipBehavior: Clip.antiAlias,
            notchMargin: 6,
            shape: CircularNotchedRectangle(),
            color: Theme.of(context).colorScheme.secondary,
            child: BottomNavigationBar(
              onTap: (value) {
                setState(() {});

                currentScreenIndex = value;
              },
              backgroundColor: Theme.of(context).colorScheme.secondary,
              elevation: 0,
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              currentIndex: currentScreenIndex,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.newspaper,
                      color: Colors.white,
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    label: "")
              ],
            ),
          )),
    );
  }
}

class MyDrawer extends Widget{
  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

}
