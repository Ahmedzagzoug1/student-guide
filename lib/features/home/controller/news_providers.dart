import 'package:flutter/material.dart';
import 'package:student_guide/features/home/model/articles.dart';

import '../model/news_api_manger.dart';
import '../model/source.dart';

class NewsProvider with ChangeNotifier {
  Source? selectedSource;
  Future<List<Source>?> getSources(String category) async {
    try {
      List<Source> sources = [];
      final sourceAsJson = await NewsApiManger.getSources(category);
      sources = sourceAsJson.map((e) => Source.fromJson(e)).toList();
      selectedSource = sources[0];
      notifyListeners();
      return sources;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<List<Article>?> getArticles(String category) async {
    try {
      List<Article> articles = [];
      final articlesAsJson = await NewsApiManger.getArticles(category);
      articlesAsJson.forEach((element) {

        if (element['discription'] != null && element['urlToImage'] != null) {
          articles.add(Article.fromJson(element));
        }
      });

      articles = articlesAsJson.map((e) {
        print(e['content']);
        return Article.fromJson(e);
      }).toList();

      List<Article> filteredArticles =
          articles.where((element) => true).toList();

      return filteredArticles;
    } catch (error) {
      print(error);
      return null;
    }
  }

  void changeSelectedSource(Source source) {
    this.selectedSource = source;
    notifyListeners();
  }
}
