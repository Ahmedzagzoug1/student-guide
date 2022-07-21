import 'package:flutter/material.dart';
import 'package:student_guide/models/source.dart';
import 'package:student_guide/views/widgets/news_source_item.dart';

class SourceBar extends StatelessWidget {
  const SourceBar(this.sources, {Key? key}) : super(key: key);
  final List<Source> sources;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .07,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sources.length,
        itemBuilder: (context, index) {
          return SourceItem(sources[index]);
        },
      ),
    );
  }
}
