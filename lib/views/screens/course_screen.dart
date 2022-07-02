import 'package:student_guide/views/widgets/Category_Item.dart';
import 'package:student_guide/views/widgets/category_screen_title.dart';
import 'package:student_guide/views/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  static const routeName = 'news';
  //final String title;
  CourseScreen({Key? key}) : super(key: key);
  bool loadingSources = true;
  late String title;

  @override
  Widget build(BuildContext context) {
    //title = ModalRoute.of(context)!.settings.arguments as String;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: CategoryScreenTitle(),
          ),
          Expanded(
              child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              CategoryItem.left(
                'assets/images/science.png',
                'Programing',
              ),
              CategoryItem.Right(
                'assets/images/science.png',
                'Electroncis',
              ),
              CategoryItem.left(
                'assets/images/science.png',
                'Health',
              ),
              CategoryItem.Right(
                'assets/images/science.png',
                "Circits",
              ),
              CategoryItem.left(
                'assets/images/science.png',
                'Maths',
              ),
              CategoryItem.Right(
                'assets/images/science.png',
                'Labs',
              ),
            ],
          ))
        ],
      ),
    );
  }
}
