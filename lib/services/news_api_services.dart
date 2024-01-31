import 'dart:convert';

import 'package:http/http.dart' as http;

class NewsApiServices {
  ///api key
  final apiKey = "c69173d515324c06b071c9cad44d0233";

  Future<Map<String, dynamic>> topHeadline() async {
    final url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey";
    try {
      //get request
      final res = await http.get(Uri.parse(url));

      ///parse result dan return
      print(res.body);
      return jsonDecode(res.body);
    } catch (e) {
      return {"error": "${e}"};
    }
  }
}
