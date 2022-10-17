import 'package:get/get.dart';
import 'package:reddit_clone/app/presentation/reddit_article_details/view/reddit_article_details_view.dart';

import '../presentation/reddit_articles/view/reddit_articles_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.REDDIT_ARTICLES;

  static final routes = [
    GetPage(
      name: Routes.REDDIT_ARTICLES,
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      page: () => const RedditArticlesView(),
    ),

    GetPage(
      name: '${Routes.REDDIT_ARTICLE_DETAILS}/:redditArticleIdentifier',
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      page: () => const RedditArticleDetailsView(),
    ),
  ];
}
