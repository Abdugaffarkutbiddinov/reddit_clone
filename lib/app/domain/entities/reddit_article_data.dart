import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/reddit_article_model.dart';


class RedditArticleData extends Equatable {
  @JsonKey(name: 'kind')
  final String kind;

  @JsonKey(name: 'data')
  final RedditArticleModel data;

  const RedditArticleData(this.kind, this.data);

  @override
  List<Object?> get props => [kind, data];
}
