import 'package:flutter/material.dart';
import 'package:student_guide/features/home/model/articles.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Article articles;
  const NewsItem(this.articles, {key}) : super(key: key);
  //final secenderyTextStyle = const TextStyle(color: Color(0xFF79828B));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.red,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(articles.imageurl),
                      fit: BoxFit.cover)),
            ),
          ),
          Column(
            children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    articles.source.name + '*',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    timeago.format(articles.publishedAt),
                    style: TextStyle(color: Colors.black),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
