import 'package:student_guide/features/home/view/screens/course_screen.dart';
import 'package:flutter/material.dart';
import 'package:student_guide/views/screens/files_screen.dart';

class CategoryItem extends StatelessWidget {
  final String image, title;

  final double subtractFormRight, subtractFormLeft;

  const CategoryItem.left(this.image, this.title, {key})
      : subtractFormLeft = 0,
        subtractFormRight = 20,
        super(key: key);

  const CategoryItem.Right(this.image, this.title, {key})
      : subtractFormLeft = 20,
        subtractFormRight = 0,
        super(key: key);

  @override
  Widget build(BuildContext context ) {
    return InkWell(
      onTap: () {
       /* Navigator.of(context)
            .pushReplacementNamed(FilesScreen.routeName, arguments: title);

        */
     Navigator.push(context, MaterialPageRoute(builder: (context)=>FilesScreen(title : title,)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(53, 152, 219, 50),
            borderRadius: BorderRadius.circular(20).subtract(BorderRadius.only(
                bottomRight: Radius.circular(subtractFormRight),
                bottomLeft: Radius.circular(subtractFormLeft)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                )),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
