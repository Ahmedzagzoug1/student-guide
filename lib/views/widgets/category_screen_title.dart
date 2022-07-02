import 'package:flutter/material.dart';

class CategoryScreenTitle extends StatelessWidget {
  const CategoryScreenTitle({Key? key}) : super(key: key);
  final TextStyle textStyle = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFFFFFFFF));
  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick up your Category ',
          style: textStyle,
        ),
        Text(
          'of intersts ',
          style: textStyle,
        ),
      ],
    );
  }
}
