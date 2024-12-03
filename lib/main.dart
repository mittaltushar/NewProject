import 'dart:convert';

import 'package:feedthenews/newslist.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'article.dart';


final articleCacheProvider = FutureProvider<List<Article>>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  final cachedData = prefs.getString('articles');
  if (cachedData != null) {
    return List<Article>.from(jsonDecode(cachedData).map((x) => Article.fromJson(x)));
  }
  final snapshot = await FirebaseFirestore.instance.collection('articles').get();
  final articles = snapshot.docs.map((doc) => Article.fromFirestore(doc)).toList();
  prefs.setString('articles', jsonEncode(articles.map((e) => e.toJson()).toList()));
  return articles;
});


final articleProvider = FutureProvider<List<Article>>((ref) async {
  final snapshot = await FirebaseFirestore.instance.collection('articles').get();
  return snapshot.docs.map((doc) => Article.fromFirestore(doc)).toList();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsListPage(), // Your homepage widget
    );
  }
}
