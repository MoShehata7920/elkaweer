class Article {
  final String title;
  final String description;
  final String urlToImage;
  final String url;
  final String source;
  final String publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
    required this.source,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      urlToImage: json['urlToImage'] ?? "",
      url: json['url'] ?? "",
      source: json['source']['name'] ?? 'Unknown Source',
      publishedAt: json['publishedAt']?.substring(0, 10) ?? 'Unknown Date',
    );
  }
}
