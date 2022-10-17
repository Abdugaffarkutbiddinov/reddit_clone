import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/reddit_article_data_model.dart';
import '../../../domain/entities/reddit_article_data.dart';


class RedditArticleContainer extends StatelessWidget {
  const RedditArticleContainer({
    Key? key, required this.redditArticle, required this.onRedditArticleTap,

  }) : super(key: key);

  final RedditArticleData redditArticle;
  final Function(String) onRedditArticleTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onRedditArticleTap(redditArticle.data.name),
      child: SizedBox(
        height: 120,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if(redditArticle.data.thumbnail.isNotEmpty && redditArticle.data.thumbnail != 'default' && redditArticle.data.thumbnail != 'self')
               SizedBox(
                  width: 100,
                  height: 120,
                  child: Image(
                    image: NetworkImage(redditArticle.data.thumbnail),
                  ),
                ),
              const SizedBox(width: 8,),
              Expanded(
                child: Text(
                  redditArticle.data.title,
                  style: const TextStyle(
                      fontSize: 15.0,
                      color: Color(0xFF2D2D2D),
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
