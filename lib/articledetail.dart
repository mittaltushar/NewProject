import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'article.dart';

class NewsDetailPage extends StatelessWidget {
  final Article article;

  const NewsDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article.imageUrl),
            SizedBox(height: 16),
            Text(article.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(article.description),
          ],
        ),
      ),
    );
  }
}
