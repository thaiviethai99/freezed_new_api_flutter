import 'package:flutter/material.dart';
import 'package:freezed_new_api/services/api_service.dart';
import 'components/customListTile.dart';
import 'models/articles/article.dart';

class Sports extends StatefulWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Sports> {
  //ApiService client = ApiService();

  Future<List<Article>>? futureArticleList;

  loadVideoList() {
    futureArticleList = ApiService().getArticle();
    //print(futureArticleList);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVideoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sports", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Article>>(
        future: futureArticleList,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(' LOI ne' + snapshot.error.toString()),
            );
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data!;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
