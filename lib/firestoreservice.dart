import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'article.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Article>> getArticles() async {
    final prefs = await SharedPreferences.getInstance();
    String? cachedData = prefs.getString('cachedArticles');

    if (cachedData != null) {
      // Return cached articles
      List<dynamic> jsonData = json.decode(cachedData);
      return jsonData.map((item) => Article.fromFirestore(item)).toList();
    }

    // If no cache, fetch from Firestore
    final snapshot = await _db.collection('articles').get();
    List<Article> articles = snapshot.docs.map((doc) {
      return Article.fromFirestore(doc.data() as Map<String, dynamic>);
    }).toList();

    // Cache the data
    prefs.setString('cachedArticles', json.encode(articles.map((e) => e.toMap()).toList()));

    return articles;
  }
}
