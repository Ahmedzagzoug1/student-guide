// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:student_guide/services/auth.dart';
import 'package:student_guide/services/database.dart';
import 'package:student_guide/views/widgets/Category_Item.dart';
import 'package:student_guide/views/widgets/category_screen_title.dart';
import 'package:student_guide/features/home/view/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../../../../views/widgets/loading.dart';

class CourseScreen extends StatefulWidget {
  static const routeName = 'news';

  @override
  State<StatefulWidget> createState() => CourseScreenState();

}

class CourseScreenState extends State{


  //final String title;
  bool loadingSources = true;
  late String title;
  var yearnum="0";


  getYear() async {
    var uid = AuthServices().auth.currentUser!.uid;

    var databaseService = DatabaseService(uid);
    await databaseService.usersReference.doc(uid).get()
        .then((value) {
      yearnum = value.get('year').toString();
      print(value.get('year').toString());
    });
    Future.delayed(const Duration(seconds: 10),);
    setState(() {
      loadingSources=false;

    });
  }

  @override
  void initState() {
    loadingSources =true;
    getYear();


    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    //title = ModalRoute.of(context)!.settings.arguments as String;
    return  (loadingSources) ? Loading ():
    Padding(
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
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[0],
              ),
              CategoryItem.Right(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[1],
              ),
              CategoryItem.left(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[2],
              ),
              CategoryItem.Right(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[3],
              ),
              CategoryItem.left(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[4],
              ),
              CategoryItem.Right(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[5],
              ),
              CategoryItem.left(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[6],
              ),
              CategoryItem.Right(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[7],
              ),
              CategoryItem.left(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[8],
              ),
              CategoryItem.Right(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[9],
              ),
              CategoryItem.left(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[10],
              ),
              CategoryItem.Right(
                'assets/images/ic_facebook.jpg',
                getSubjects(yearnum)[11],
              ),
            ],

          ))
        ],
      ),
    );
  }
getSubjects (String year ){
    List<String> subjects =[] ;
    switch(year){
      case "1":
        subjects.addAll(["Maths 1" , 'Circuits','Programing','Measure Devices','Labs','Electroncis',
          "Fields","Logic 1", "Electroncis Circuits" , "Math 2" , "Sayraa" , "Data Structure"
        ]);
        break;
      case "2" :
        subjects.addAll(["Maths 3" , 'OOP','IC','signle','Math 4','Machine',
          "Tafsyer", "Probabality" , "Logic Circuits " ,"Logic 2" ,"LAB" , "Converts"
        ]);

        break;
      case "3":
        subjects.addAll(["Queue" , 'Control','Communications','Database','OS','Sensors',
        'Hadith','LAB', 'PM' ,'circuits','Automata','MicroProcessors']);
        break;
      case "4" :

        subjects.addAll(["Computer Architecture" , 'CAD','Software Engineering','Embedded System','Interfaces',
          'AI', "Compiler" ,"Security","Advenced Programing","Digital Communication", "Networks" ,"LAB"]);

        break;
    }
    return subjects;
}


}


