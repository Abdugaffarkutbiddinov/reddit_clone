import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reddit_clone/app/data/models/reddit_article_data_model.dart';
import 'package:reddit_clone/app/domain/entities/reddit_article_response.dart';

part 'reddit_article_response_model.g.dart';

@JsonSerializable()
class RedditArticleResponseModel extends RedditArticleResponse {
  const RedditArticleResponseModel(super.after, super.children);

  RedditArticleResponseModel copyWith({
    String? after,
    List<RedditArticleDataModel>? children,
  }) =>
      RedditArticleResponseModel(
        after ?? this.after,
        children ?? this.children,
      );

  factory RedditArticleResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RedditArticleResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditArticleResponseModelToJson(this);
}
