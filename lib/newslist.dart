import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'articledetail.dart';
import 'articleprovider.dart';
import 'connecitivity.dart';  // Import the connectivity utils

class NewsListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<bool>(
      future: ConnectivityUtils.isConnected(), // Check connectivity
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Show loading indicator while checking
        }

        if (!snapshot.hasData || !snapshot.data!) {
          return Center(child: Text("No internet connection!")); // Display message if no connection
        }

        final articles = ref.watch(articleProvider); // Proceed if connected

        return Scaffold(
          appBar: AppBar(title: Text('News Articles')),
          body: articles.when(
            data: (articles) => ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsDetailPage(article: article),
                    ),
                  ),
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: article.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 4),
                              Text(
                                article.description,
                                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            loading: () => Center(child: CircularProgressIndicator()),
            error: (error, stack) => Center(child: Text('Error: $error')),
          ),
        );
      },
    );
  }
}
