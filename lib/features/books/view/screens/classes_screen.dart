import 'package:flutter/material.dart';
import 'package:student_guide/views/widgets/constants.dart';
import 'package:student_guide/views/widgets/Category_Item.dart';
import 'package:student_guide/views/widgets/class_card_widget.dart';

class ClassesScreen extends StatelessWidget {
  static const String routName = 'classes  ';
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: Constants.decoration,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            title: Text(''),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {},
                      child: ClassCard("First Year", Color(0XFF2872A4))),
                  ClassCard("sec Year", Color(0XFF3598DB)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClassCard("Third Year", Color(0XFF3598DB)),
                  ClassCard("Forth Year", Color(0XFF2872A4)),
                ],
              )
            ],
          ),
        ));
  }
}
