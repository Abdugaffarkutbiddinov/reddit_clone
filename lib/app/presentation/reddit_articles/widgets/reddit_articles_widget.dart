import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reddit_clone/app/presentation/reddit_articles/widgets/reddit_article_container.dart';

import '../../../data/models/reddit_article_data_model.dart';
import '../../../domain/entities/reddit_article_data.dart';

class RedditArticlesWidget extends StatelessWidget {
  const RedditArticlesWidget({
    super.key,
    required this.redditArticles, required this.onRedditArticleTap,
  });

  final List<RedditArticleData> redditArticles;
  final Function(String) onRedditArticleTap;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _buildListView(redditArticles),
      ]).paddingSymmetric(horizontal: 8, vertical: 24),
    );
  }

  ListView _buildListView(List<RedditArticleData> redditArticles) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: redditArticles.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: RedditArticleContainer(
            redditArticle: redditArticles[index], onRedditArticleTap: onRedditArticleTap,
          ),
        );
      },
    );
  }
}
