import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_guide/features/home/controller/news_providers.dart';
import 'package:student_guide/features/home/model/articles.dart';

import '../../model/source.dart';
import '../widgets/news_item.dart';
import '../widgets/news_source_bar.dart';

class NewsScreen extends StatelessWidget {
  bool loadingSources = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Source>?>(
        future: Provider.of<NewsProvider>(context, listen: false)
            .getSources('sports'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (snapshot.data == null) {
            return const Center(
                child: Text('Error Ocuured please try again later '));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                SourceBar(snapshot.data!),
                Expanded(
                    child: FutureBuilder<List<Article>?>(
                  future:
                      Provider.of<NewsProvider>(context).getArticles('sports'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    }
                    if (snapshot.data == null) {
                      return const Center(
                          child: Text('Error ocuured please try again later '));
                    } else {
                      return ListView.builder(
                        itemExtent: MediaQuery.of(context).size.height * 0.35,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsItem(snapshot.data![index]);
                        },
                      );
                    }
                  },
                ))
              ],
            );
          }
        });
  }
}
