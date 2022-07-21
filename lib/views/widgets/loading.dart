import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
child: Center(child: CircularProgressIndicator(color: Colors.blue,),),



    );
  }
}
