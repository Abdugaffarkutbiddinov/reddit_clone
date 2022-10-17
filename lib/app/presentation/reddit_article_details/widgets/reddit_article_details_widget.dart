import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/reddit_article_data.dart';

class RedditArticleDetailsWidget extends StatelessWidget {
  const RedditArticleDetailsWidget({Key? key, required this.redditArticle})
      : super(key: key);
  final RedditArticleData redditArticle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 28),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: 24,
                    ),
                    Text(
                      redditArticle.data.ups.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2D2D2D),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 36,),
                Text(redditArticle.data.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2D2D2D))),
                const SizedBox(height: 16),
                Text(
                  redditArticle.data.selftext,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2D2D2D),
                  ),
                ),
              ],
            )
                .paddingOnly(
                  top: 0,
                  bottom: 16,
                  left: 4,
                  right: 4,
                )
                .paddingSymmetric(horizontal: 16, vertical: 24),
          ),
        ],
      ).paddingSymmetric(horizontal: 4),
    );
  }
}
