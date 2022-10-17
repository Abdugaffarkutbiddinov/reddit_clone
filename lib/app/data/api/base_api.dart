import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../core/config/api_config.dart';
import '../models/reddit_articles_response_data_model.dart';

part 'base_api.g.dart';

@RestApi(baseUrl: ApiConfig.BASE_API_URL)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/r/FlutterDev/new.json")
  Future<RedditArticlesResponseDataModel> getRedditArticles();
}
