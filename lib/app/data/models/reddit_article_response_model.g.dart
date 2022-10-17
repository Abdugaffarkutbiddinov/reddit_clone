// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_article_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditArticleResponseModel _$RedditArticleResponseModelFromJson(
        Map<String, dynamic> json) =>
    RedditArticleResponseModel(
      json['after'] as String,
      (json['children'] as List<dynamic>)
          .map(
              (e) => RedditArticleDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RedditArticleResponseModelToJson(
        RedditArticleResponseModel instance) =>
    <String, dynamic>{
      'after': instance.after,
      'children': instance.children,
    };
