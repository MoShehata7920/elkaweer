import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:elkaweer/models/news_models.dart';
import 'package:elkaweer/provider/news_provider.dart';
import 'package:elkaweer/resources/strings_manager.dart';
import 'package:elkaweer/screens/news/news_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider()..fetchNews(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.footballNews),
          centerTitle: true,
        ),
        body: Consumer<NewsProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: provider.news.length,
              itemBuilder: (context, index) {
                final NewsArticle article = provider.news[index];
                return NewsCard(
                  title: article.title,
                  source: article.source,
                  imageUrl: article.imageUrl,
                  publishedAt: article.publishedAt,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
