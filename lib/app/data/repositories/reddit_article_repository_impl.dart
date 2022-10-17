import 'package:dartz/dartz.dart';
import 'package:reddit_clone/app/core/errors/failure.dart';
import 'package:reddit_clone/app/domain/entities/reddit_article_response.dart';
import 'package:reddit_clone/app/domain/repositories/reddit_article_repostirory.dart';

import '../datasources/remote/reddit_article_remote_data_source.dart';
import '../models/reddit_articles_response_data_model.dart';

const REDDIT_ARTICLE_REPOSITORY = "[REDDIT_ARTICLE_REPOSITORY]";

class RedditArticleRepositoryImpl implements RedditArticleRepository {
  final RedditArticleRemoteDataSource remoteDatasource;

  RedditArticleRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, RedditArticlesResponseDataModel>> getRedditArticles() async {
    try {
      final Either<Failure, RedditArticlesResponseDataModel> response =
      await remoteDatasource.getRedditArticles();
      return response.fold(
            (failure) => Left(failure),
            (result) => Right(result),
      );
    } on Exception catch (_) {
      return const Left(Failure('$REDDIT_ARTICLE_REPOSITORY Something went wrong'));
    }
  }

}