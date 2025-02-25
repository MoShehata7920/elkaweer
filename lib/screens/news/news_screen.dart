import 'package:elkaweer/resources/strings_manager.dart';
import 'package:elkaweer/screens/news/news_list.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.footballNews),
        centerTitle: true,
      ),
      body: const NewsList(),
    );
  }
}
