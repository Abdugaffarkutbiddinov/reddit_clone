import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:kiwi/kiwi.dart';
import 'package:reddit_clone/app/data/repositories/reddit_article_repository_impl.dart';
import 'package:reddit_clone/app/domain/repositories/reddit_article_repostirory.dart';
import 'package:reddit_clone/app/domain/usecases/get_reddit_articles.dart';

import '../app/core/config/api_config.dart';
import '../app/core/network/network_info.dart';
import '../app/data/api/base_api.dart';
import '../app/data/datasources/remote/reddit_article_remote_data_source.dart';
import '../app/presentation/reddit_article_details/controller/cubit_controller.dart';
import '../app/presentation/reddit_articles/controller/cubit_controller.dart';
part 'injector.g.dart';

abstract class Injector {
  static late KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static final resolve = container.resolve;

  void _configure() {
    _configureCore();
    _configureFeatureModuleFactories();
    _configureCacheFeatureModule();
  }

  void _configureApiFeatureModuleInstances() {
    final dio = Dio(BaseOptions(contentType: "application/json"));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    container.registerInstance(
      RestClient(
        dio..interceptors.add(dioLoggerInterceptor),
        baseUrl: ApiConfig.BASE_API_URL,
      ),
    );
  }

  void _configureCacheFeatureModule() {
    _configureApiFeatureModuleInstances();
    _configureApiFeatureModuleFactories();
  }

  // Core module
  @Register.singleton(Connectivity)
  @Register.singleton(NetworkInfo, from: NetworkInfoImpl)
  void _configureCore();

  // Datasources
  @Register.factory(RedditArticleRemoteDataSource, from: RedditArticleRemoteDataSourceImpl)
  // Use cases
  @Register.factory(GetRedditArticles)
  // Repos
  @Register.factory(RedditArticleRepository, from: RedditArticleRepositoryImpl)
  // Cubits
  @Register.factory(RedditArticlesCubit)
  @Register.factory(RedditArticleDetailsCubit)
  void _configureFeatureModuleFactories();

  void _configureApiFeatureModuleFactories();
}
