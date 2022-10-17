// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_article_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditArticleDataModel _$RedditArticleDataModelFromJson(
        Map<String, dynamic> json) =>
    RedditArticleDataModel(
      json['kind'] as String,
      RedditArticleModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RedditArticleDataModelToJson(
        RedditArticleDataModel instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
