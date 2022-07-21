import 'package:student_guide/models/source.dart';

class Article {
  final Source source;

  //To-do:-
  final String imageurl;
  final String content;
  final String url;

  final DateTime publishedAt;
  final String title;
  Article(this.source, this.title, this.content, this.imageurl, this.url,
      this.publishedAt);
  Article.fromJson(Map<String, Object?> json)
      : this(
            Source.fromJson(json['source'] as Map<String, Object?>),
            json['title']! as String,
            json['content']! as String,
            json['urlToImage']! as String,
            json['url']! as String,
            DateTime.parse(json['publishedAt']! as String));
}
