class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String content;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content,
  });

  factory Article.fromFirestore(Map<String, dynamic> data) {
    return Article(
      title: data['title'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      content: data['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'content': content,
    };
  }
}
