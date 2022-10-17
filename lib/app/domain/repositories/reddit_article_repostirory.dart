
import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/reddit_articles_response_data.dart';

abstract class RedditArticleRepository {
  Future<Either<Failure, RedditArticlesResponseData>> getRedditArticles();
}