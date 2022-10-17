import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reddit_clone/app/domain/entities/reddit_article.dart';

part 'reddit_article_model.g.dart';

@JsonSerializable()
class RedditArticleModel extends RedditArticle {
  const RedditArticleModel(
      {required super.name,
      required super.title,
      required super.selftext,
      required super.thumbnail,
      required super.ups,
      });

  RedditArticleModel copyWith({
    String? name,
    String? title,
    String? selftext,
    String? thumbnail,
    int? ups,
  }) =>
      RedditArticleModel(
          name: name ?? this.name,
          title: title ?? this.title,
          selftext: selftext ?? this.selftext,
          thumbnail: thumbnail ?? this.thumbnail,
          ups: ups ?? this.ups);

  factory RedditArticleModel.fromJson(Map<String, dynamic> json) =>
      _$RedditArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditArticleModelToJson(this);
}
