import 'package:easy_localization/easy_localization.dart';
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
    final newsProvider = Provider.of<NewsProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title:  const Text(AppStrings.footballNews).tr(),
        centerTitle: true,
      ),
      body: newsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: newsProvider.news.length,
              itemBuilder: (context, index) {
                final NewsArticle article = newsProvider.news[index];
                return NewsCard(
                  title: article.title,
                  source: article.source,
                  imageUrl: article.imageUrl,
                  publishedAt: article.publishedAt,
                );
              },
            ),
    );
  }
}
