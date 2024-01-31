import 'package:flutter/material.dart';
import 'package:third_party_integration/services/news_api_services.dart';

class ListNewsPage extends StatelessWidget {
  const ListNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "List Pages News",
            style: TextStyle(color: Colors.white),
          )),
      body: FutureBuilder(
        future: NewsApiServices().topHeadline(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data?['articles'] as List<dynamic>? ?? [];
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ListTile(
                    leading: Container(
                        width: 100,
                        decoration: item['urlToImage'] != null
                            ? BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        NetworkImage("$item['urlToImage']}")))
                            : BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10))),
                    title: Text(
                      "${item['title']}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      "${item['description']}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
