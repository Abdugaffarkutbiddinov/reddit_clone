import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:reddit_clone/app/data/models/reddit_article_response_model.dart';
import 'package:dio/dio.dart';
import '../../../core/errors/failure.dart';
import '../../api/base_api.dart';
import '../../models/reddit_articles_response_data_model.dart';

abstract class RedditArticleRemoteDataSource {
  Future<Either<Failure, RedditArticlesResponseDataModel>> getRedditArticles();
}

const ERROR_MESSAGE = '[REDDIT_ARTICLE_REMOTE_DATA_SOURCE]';

class RedditArticleRemoteDataSourceImpl
    implements RedditArticleRemoteDataSource {
  final RestClient apiClient;

  RedditArticleRemoteDataSourceImpl(this.apiClient);

  @override
  Future<Either<Failure, RedditArticlesResponseDataModel>>
      getRedditArticles() async {
    try {
      final redditArticles = await apiClient.getRedditArticles();

      return Right(redditArticles);
    } on DioError catch (error) {
      Logger().e('$ERROR_MESSAGE ${error.type}: ${error.message}');

      return Left(Failure(error.message));
    } on Exception catch (_) {
      return const Left(Failure('$ERROR_MESSAGE get reddit articles'));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
