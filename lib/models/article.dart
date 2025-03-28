class Article {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Article({required this.userId, required this.id, required this.title, required this.body});

  factory Article.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {'userId': int userId, 'id': int id, 'title': String title, 'body': String body} => Article(
        userId: userId,
        id: id,
        title: title,
        body: body
      ),
      _ => throw const FormatException('Failed to load article.'),
    };
  }
}