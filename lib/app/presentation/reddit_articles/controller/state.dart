

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/errors/failure.dart';
import '../../../data/models/reddit_article_data_model.dart';
import '../../../domain/entities/reddit_article_data.dart';

part 'state.freezed.dart';

@freezed
abstract class RedditArticlesState with _$RedditArticlesState {
  const factory RedditArticlesState.initial() = Initial;

  const factory RedditArticlesState.loading() = Loading;

  const factory RedditArticlesState.empty() = Empty;

  const factory RedditArticlesState.success(List<RedditArticleData> redditArticles,
      ) = Success;

  const factory RedditArticlesState.error(Failure failure) = Error;
}
