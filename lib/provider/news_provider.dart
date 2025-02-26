import 'package:flutter/material.dart';

import 'package:elkaweer/models/news_models.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsArticle> _news = [];
  bool _isLoading = true;

  List<NewsArticle> get news => _news;
  bool get isLoading => _isLoading;

  Future<void> fetchNews() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _news = [
      NewsArticle(
        title: "Barcelona Wins Against Real Madrid",
        description: "Barcelona secures a 2-1 victory in El Clásico.",
        imageUrl:
            "https://th.bing.com/th/id/OIP.nR-LrwC3OqMUM_OEPzhRxQHaH6?rs=1&pid=ImgDetMain",
        source: "ESPN",
        publishedAt: "2025-02-25",
      ),
      NewsArticle(
        title: "Premier League Title Race Heats Up",
        description: "Liverpool and Man City battle for the top spot.",
        imageUrl:
            "https://th.bing.com/th/id/OIP.gTgxJRCZTOm6wCYhA8IepgHaEK?rs=1&pid=ImgDetMain",
        source: "BBC Sport",
        publishedAt: "2025-02-26",
      ),
    ];

    _isLoading = false;
    notifyListeners();
  }
}
