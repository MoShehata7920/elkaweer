import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:elkaweer/screens/news/news_card.dart';
import 'package:elkaweer/provider/news_provider.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return RefreshIndicator(
      onRefresh: newsProvider.refreshNews,
      child: ListView.builder(
        itemCount: newsProvider.news.length,
        itemBuilder: (context, index) {
          final newsItem = newsProvider.news[index];
          return NewsCard(
            title: newsItem["title"]!,
            subtitle: newsItem["subtitle"]!,
            imageUrl: newsItem["image"]!,
          );
        },
      ),
    );
  }
}
