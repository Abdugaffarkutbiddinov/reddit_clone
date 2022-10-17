import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/reddit_article_data_model.dart';


class RedditArticleResponse extends Equatable {
  @JsonKey(name: 'after')
  final String after;

  @JsonKey(name: 'children')
  final List<RedditArticleDataModel> children;

  const RedditArticleResponse(this.after, this.children);

  @override
  List<Object?> get props => [after, children];
}
