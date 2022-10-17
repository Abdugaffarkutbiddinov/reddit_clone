import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reddit_clone/app/data/models/reddit_article_response_model.dart';


class RedditArticlesResponseData extends Equatable {
  @JsonKey(name: 'kind')
  final String kind;

  @JsonKey(name: 'reddit_article_response')
  final RedditArticleResponseModel data;

  const RedditArticlesResponseData(this.kind, this.data);

  @override
  List<Object?> get props => [kind, data];
}
