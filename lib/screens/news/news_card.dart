import 'package:elkaweer/resources/icons_manager.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String source;
  final String imageUrl;
  final String publishedAt;

  const NewsCard({
    super.key,
    required this.title,
    required this.source,
    required this.imageUrl,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            imageUrl,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(AppIcons.imageNotSupported),
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("$source | $publishedAt"),
        onTap: () {
          // TODO: Handle news tap
        },
      ),
    );
  }
}
