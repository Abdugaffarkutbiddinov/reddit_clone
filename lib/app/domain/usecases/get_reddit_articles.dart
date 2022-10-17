import 'package:dartz/dartz.dart';
import 'package:reddit_clone/app/domain/repositories/reddit_article_repostirory.dart';

import '../../core/errors/failure.dart';
import '../../core/usecases/usecase.dart';
import '../entities/reddit_articles_response_data.dart';

class GetRedditArticles implements UseCase<RedditArticlesResponseData, NoParams> {
  final RedditArticleRepository repository;

  GetRedditArticles(this.repository);

  @override
  Future<Either<Failure, RedditArticlesResponseData>> call(NoParams params) async {
    try {
      return repository.getRedditArticles();
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
