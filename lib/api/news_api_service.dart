import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:elkaweer/models/news_models.dart';
import 'package:elkaweer/resources/consts_manager.dart';

class NewsApiService {
  static Future<List<Article>> fetchNews() async {
    const String url =
        "${ApiConstants.newsApiBaseUrl}?q=football&apiKey=${ApiConstants.newsApiKey}";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Article> articles = (data['articles'] as List)
            .map((json) => Article.fromJson(json))
            .toList();
        return articles;
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      throw Exception("Error fetching news: $e");
    }
  }
}
