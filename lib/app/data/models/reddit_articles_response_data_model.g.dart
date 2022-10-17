// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_articles_response_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditArticlesResponseDataModel _$RedditArticlesResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    RedditArticlesResponseDataModel(
      json['kind'] as String,
      RedditArticleResponseModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RedditArticlesResponseDataModelToJson(
        RedditArticlesResponseDataModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
