// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void _configureCore() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => Connectivity())
      ..registerSingleton<NetworkInfo>(
          (c) => NetworkInfoImpl(c<Connectivity>()));
  }

  @override
  void _configureFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<RedditArticleRemoteDataSource>(
          (c) => RedditArticleRemoteDataSourceImpl(c<RestClient>()))
      ..registerFactory((c) => GetRedditArticles(c<RedditArticleRepository>()))
      ..registerFactory<RedditArticleRepository>((c) =>
          RedditArticleRepositoryImpl(c<RedditArticleRemoteDataSource>()))
      ..registerFactory(
          (c) => RedditArticlesCubit(c<NetworkInfo>(), c<GetRedditArticles>()))
      ..registerFactory((c) =>
          RedditArticleDetailsCubit(c<NetworkInfo>(), c<GetRedditArticles>()));
  }

  @override
  void _configureApiFeatureModuleFactories() {}
}
