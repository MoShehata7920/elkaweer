import 'package:flutter/material.dart';

class NewsProvider with ChangeNotifier {
  final List<Map<String, String>> _news = [
    {
      "title": "Big Match Tonight!",
      "subtitle": "Exciting clash between top teams.",
      "image":
          "https://th.bing.com/th/id/OIP.4_sC631TM9L_9ziXpRKcUAHaD5?rs=1&pid=ImgDetMain"
    },
    {
      "title": "Transfer Updates",
      "subtitle": "Star player signs a new deal!",
      "image":
          "https://th.bing.com/th/id/OIP.gTgxJRCZTOm6wCYhA8IepgHaEK?rs=1&pid=ImgDetMain"
    },
    {
      "title": "Champions League Results",
      "subtitle": "Round-up of last night’s games.",
      "image":
          "https://th.bing.com/th/id/OIP.fxuJufhV35OG7HyYBYX6aQHaEK?rs=1&pid=ImgDetMain"
    }
  ];

  List<Map<String, String>> get news => _news;

  Future<void> refreshNews() async {
    await Future.delayed(const Duration(seconds: 2));
    notifyListeners();
  }
}
