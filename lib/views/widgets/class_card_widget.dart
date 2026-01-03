import 'package:flutter/material.dart';

import '../../features/home/view/screens/home_screen.dart';

class ClassCard extends StatelessWidget {
  String className;
  Color color;

  ClassCard(this.className, this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      child: Card(
        color: Colors.transparent,
        elevation: 6,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: color),
          width: 150,
          height: 150,
          child: Center(
            child: Text(className,
                style: TextStyle(fontSize: 30, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
