// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Articles _$$_ArticlesFromJson(Map<String, dynamic> json) => _$_Articles(
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ArticlesToJson(_$_Articles instance) =>
    <String, dynamic>{
      'articles': instance.articles,
    };
