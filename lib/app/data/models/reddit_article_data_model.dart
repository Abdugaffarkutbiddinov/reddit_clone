import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reddit_clone/app/data/models/reddit_article_model.dart';
import 'package:reddit_clone/app/domain/entities/reddit_article_data.dart';

part 'reddit_article_data_model.g.dart';

@JsonSerializable()
class RedditArticleDataModel extends RedditArticleData {
  const RedditArticleDataModel(super.kind, super.data);

  RedditArticleDataModel copyWith({
    String? kind,
    RedditArticleModel? data,
  }) =>
      RedditArticleDataModel(
        kind ?? this.kind,
        data ?? this.data,
      );

  factory RedditArticleDataModel.fromJson(Map<String, dynamic> json) =>
      _$RedditArticleDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditArticleDataModelToJson(this);
}
