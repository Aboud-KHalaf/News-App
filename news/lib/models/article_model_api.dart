class Article {
  //Source source;
  String author;
  String? title;
  String description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  Article({
    // required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      //  source: Source.fromJson(json['source']),
      author: json['author'] ?? 'unknown',
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No description now',
      url: json['url'] ??
          'https://images.unsplash.com/photo-1658330056737-0fd4bda0e4c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1351&q=80',
      urlToImage: json['urlToImage'] ??
          'https://images.unsplash.com/photo-1658330056737-0fd4bda0e4c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1351&q=80',
      publishedAt: DateTime.parse(json['publishedAt']),
      content: json['content'] ?? 'No Content',
    );
  }
}

class Source {
  String? id;
  String? name;
  Source({this.id, this.name});
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
