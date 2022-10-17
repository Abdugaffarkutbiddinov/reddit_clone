import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:reddit_clone/app/domain/usecases/get_reddit_articles.dart';

import '../../../core/errors/failure.dart';
import '../../../core/network/network_info.dart';
import '../../../core/usecases/usecase.dart';
import '../../../domain/entities/reddit_article_data.dart';
import '../../../domain/entities/reddit_articles_response_data.dart';
import 'index.dart';

const CLASS_TAG = "[REDDIT_ARTICLES_CUBIT]";

class RedditArticleDetailsCubit extends Cubit<RedditArticleDetailsState> {
  RedditArticleDetailsCubit(this.network, this.getRedditArticles)
      : super(const Initial());

  final NetworkInfo network;
  final GetRedditArticles getRedditArticles;
  bool _isNetworkEnable = true;
  late String _redditArticleIdentifier;
  RedditArticleData? _redditArticle;

  Future<void> init() async {
    emit(const Loading());

    _redditArticleIdentifier = Get.parameters['redditArticleIdentifier'] as String;
    _isNetworkEnable = await network.isApiConnected();
    if (_isNetworkEnable) {
      _loadRedditArticle();
    } else {
      Get.snackbar(
        'Внимание!',
        'Пожалуйста проверьте соединение сети!',
        duration: const Duration(seconds: 4),
      );
      emit(const Empty());
    }
  }

  Future<void> _loadRedditArticle() async {
    final Either<Failure, RedditArticlesResponseData>
        failureOrLoadRemoteRites = await getRedditArticles.call(NoParams());
    failureOrLoadRemoteRites.fold(
      (failure) => Logger().e(failure),
      (redditArticleResponse) {
        _redditArticle = redditArticleResponse.data.children.firstWhereOrNull(
          (e) => e.data.name == _redditArticleIdentifier,
        );
        if (_redditArticle != null) {
          emit(Success(_redditArticle!));
        } else {
          emit(const Empty());
        }
      },
    );
  }

  @override
  Future<void> close() async {
    Logger().i('$CLASS_TAG has been disposed');

    return super.close();
  }
}
