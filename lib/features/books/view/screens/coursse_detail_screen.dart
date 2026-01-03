import 'package:flutter/material.dart';

class CourseDetailScreen extends StatelessWidget {
  static const routeName = 'courseDetailScreen';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
