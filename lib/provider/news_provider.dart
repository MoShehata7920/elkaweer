import 'package:flutter/material.dart';

import 'package:elkaweer/api/news_api_service.dart';
import 'package:elkaweer/models/news_models.dart';

class NewsProvider extends ChangeNotifier {
  List<Article> _articles = [];
  bool _isLoading = false;

  List<Article> get articles => _articles;
  bool get isLoading => _isLoading;

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();

    try {
      _articles = await NewsApiService.fetchNews();
    } catch (e) {
      debugPrint("Error fetching news: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
