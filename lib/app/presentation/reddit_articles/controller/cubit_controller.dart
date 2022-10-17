import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:reddit_clone/app/domain/entities/reddit_article_response.dart';
import 'package:reddit_clone/app/domain/usecases/get_reddit_articles.dart';

import '../../../core/errors/failure.dart';
import '../../../core/network/network_info.dart';
import '../../../core/usecases/usecase.dart';
import '../../../data/models/reddit_articles_response_data_model.dart';
import '../../../domain/entities/reddit_articles_response_data.dart';
import '../../../routes/app_pages.dart';
import 'index.dart';

const CLASS_TAG = "[REDDIT_ARTICLES_CUBIT]";

class RedditArticlesCubit extends Cubit<RedditArticlesState> {
  RedditArticlesCubit(this.network, this.getRedditArticles)
      : super(const Initial());

  final NetworkInfo network;
  final GetRedditArticles getRedditArticles;

  bool _isNetworkEnable = true;

  Future<void> init() async {
    emit(const Loading());

    _isNetworkEnable = await network.isApiConnected();
    if (_isNetworkEnable) {
      _loadRedditArticles();
    } else {
      Get.snackbar(
        'Внимание!',
        'Пожалуйста проверьте соединение сети!',
        duration: const Duration(seconds: 4),
      );
      emit(const Empty());
    }
  }

  Future<void> _loadRedditArticles() async {
    final Either<Failure, RedditArticlesResponseData>
        failureOrLoadRemoteRites = await getRedditArticles.call(NoParams());
    failureOrLoadRemoteRites.fold(
      (failure) => Logger().e(failure),
      (redditArticleResponse) =>
          emit(Success(redditArticleResponse.data.children)),
    );
  }

  Future<void> onRedditDetailsTap(String redditArticleIdentifier) async {
    Get.toNamed('${Routes.REDDIT_ARTICLE_DETAILS}/$redditArticleIdentifier');
  }

  @override
  Future<void> close() async {
    Logger().i('$CLASS_TAG has been disposed');

    return super.close();
  }
}
