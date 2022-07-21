import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_guide/control/news_providers.dart';
import 'package:student_guide/models/news_api_manger.dart';
import 'package:student_guide/models/source.dart';
class SourceItem extends StatelessWidget {
  final Source source;
  const SourceItem(this.source, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected =
        source.name == Provider.of<NewsProvider>(context).selectedSource!.name;
    return Container(
      margin: EdgeInsets.all(10),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: isSelected ? Colors.white : Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.white))),
        onPressed: () {
          Provider.of<NewsProvider>(context, listen: false)
              .changeSelectedSource(source);
        },
        child: FittedBox(
          child: Text(
            source.name,
            style: TextStyle(
              color: isSelected ? Theme.of(context).primaryColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
