import 'package:flutter/material.dart';
import 'package:freezed_new_api/services/api_service.dart';
import 'components/customListTile.dart';
import 'models/articles/article.dart';

class Business extends StatefulWidget {
  const Business({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Business> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Business", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
