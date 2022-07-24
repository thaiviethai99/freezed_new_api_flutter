import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/articles/article.dart';

class ApiService {
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=id&category=sports&apiKey=92e5d8bb0e674175a622e5433406f366";

  Future<List<Article>> getArticle() async {
    var res = await http.get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
