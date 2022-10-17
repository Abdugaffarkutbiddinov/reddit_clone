
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/errors/failure.dart';
import '../../../data/models/reddit_article_data_model.dart';
import '../../../domain/entities/reddit_article_data.dart';

part 'state.freezed.dart';

@freezed
abstract class RedditArticleDetailsState with _$RedditArticleDetailsState {
  const factory RedditArticleDetailsState.initial() = Initial;

  const factory RedditArticleDetailsState.loading() = Loading;

  const factory RedditArticleDetailsState.empty() = Empty;

  const factory RedditArticleDetailsState.success(RedditArticleData redditArticles,
      ) = Success;

  const factory RedditArticleDetailsState.error(Failure failure) = Error;
}
