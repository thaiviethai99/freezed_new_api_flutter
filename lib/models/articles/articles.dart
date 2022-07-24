import 'package:freezed_annotation/freezed_annotation.dart';

import 'article.dart';

part 'articles.freezed.dart';
part 'articles.g.dart';

@freezed
class Articles with _$Articles {
  factory Articles({
    List<Article>? articles,
  }) = _Articles;

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);
}
