import 'package:dio/dio.dart';
import 'package:student_guide/models/source.dart';

class NewsApiManger {
  static const String _apiKey = '4562a9fcacfc4c2ea55f1b39a204282c';
  static const _apiUrl = 'https://newsapi.org/v2/';

  static Future<List<dynamic>> getSources(String category) async {
    String url = _apiUrl + 'top-headlines/sources';
    Dio dio = Dio();
    Map<String, String> parms = {
      'apiKey': _apiKey,
      'category': category,
    };
    Response response = await dio.get(url, queryParameters: parms);
    return (response.data['sources']);
  }

  static Future<List<dynamic>> getArticles(String category) async {
    String url = _apiUrl + 'top-headlines';
    Dio dio = Dio();
    Map<String, String> parms = {
      'apiKey': _apiKey,
      'category': category,
      // 'sources': source.name
    };
    Response response = await dio.get(url, queryParameters: parms);

    print(response.data['articles']);
    return response.data['articles'];
  }
}
