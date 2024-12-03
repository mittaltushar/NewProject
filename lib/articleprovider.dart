import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'article.dart';

final articleProvider = FutureProvider<List<Article>>((ref) async {
  final snapshot = await FirebaseFirestore.instance.collection('articles').get();
  return snapshot.docs.map((doc) => Article.fromFirestore(doc.data() as Map<String, dynamic>)).toList();
});
