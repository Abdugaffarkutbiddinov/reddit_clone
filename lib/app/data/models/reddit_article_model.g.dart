// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditArticleModel _$RedditArticleModelFromJson(Map<String, dynamic> json) =>
    RedditArticleModel(
      name: json['name'] as String,
      title: json['title'] as String,
      selftext: json['selftext'] as String,
      thumbnail: json['thumbnail'] as String,
      ups: json['ups'] as int,
    );

Map<String, dynamic> _$RedditArticleModelToJson(RedditArticleModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'selftext': instance.selftext,
      'thumbnail': instance.thumbnail,
      'ups': instance.ups,
    };
