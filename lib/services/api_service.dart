import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

import '../models/articles/article.dart';

class ApiService {
  final endPointUrl =
      "http://newsapi.org/v2/top-headlines?country=id&category=business&apiKey=92e5d8bb0e674175a622e5433406f366";

  // Future<List<Article>> getArticle() async {
  //   var res = await http.get(Uri.parse(endPointUrl));
  //   if (res.statusCode == 200) {
  //     Map<String, dynamic> json = jsonDecode(res.body);

  //     List<dynamic> body = json['articles'];
  //     List<Article> articles =
  //         body.map((dynamic item) => Article.fromJson(item)).toList();
  //     return articles;
  //   } else {
  //     throw ("Can't get the Articles");
  //   }
  // }

  Future<List<Article>> getArticle() async {
    List<Article> articleList = [];
    var response;
    try {
      response = await http.get(Uri.parse(endPointUrl));
    } catch (e) {
      print(e.toString());
    }
    // Decode response body
    var jsonBody = convert.jsonDecode(response.body);
    //Log().printJson(json: jsonBody);

    if (response.statusCode == 200) {
      List jsonList = jsonBody['articles'];

      for (var jsonVideo in jsonList) {
        Article article = Article.fromJson(jsonVideo);
        articleList.add(article);
      }
    }

    return articleList;
  }
}
