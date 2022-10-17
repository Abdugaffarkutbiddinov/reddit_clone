import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reddit_clone/app/data/models/reddit_article_response_model.dart';
import 'package:reddit_clone/app/domain/entities/reddit_articles_response_data.dart';

part 'reddit_articles_response_data_model.g.dart';

@JsonSerializable()
class RedditArticlesResponseDataModel extends RedditArticlesResponseData {
  const RedditArticlesResponseDataModel(super.kind, super.data);

  RedditArticlesResponseDataModel copyWith({
    String? kind,
    RedditArticleResponseModel? data,
  }) =>
      RedditArticlesResponseDataModel(
        kind ?? this.kind,
        data ?? this.data,
      );

  factory RedditArticlesResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$RedditArticlesResponseDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditArticlesResponseDataModelToJson(this);
}
