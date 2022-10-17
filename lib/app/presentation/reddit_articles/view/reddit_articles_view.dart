import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/injector.dart';
import '../../../core/widgets/index.dart' as core_widgets;
import '../controller/index.dart';
import '../widgets/reddit_articles_widget.dart';


class RedditArticlesView extends StatelessWidget {
  const RedditArticlesView({Key? key}) : super(key: key);


  Widget _buildBody(BuildContext context) {
    return BlocBuilder<RedditArticlesCubit, RedditArticlesState>(
      builder: (context, state) {
        return state.when(
          initial: () => core_widgets.LoadingWidget(),
          error: (failure) => core_widgets.ErrorWidget(failure.message),
          empty: () => const core_widgets.EmptyWidget(),
          loading: () => core_widgets.LoadingWidget(),
          success: (redditArticles) => RedditArticlesWidget(
            redditArticles: redditArticles, onRedditArticleTap:  (redditArticleIdentifier) =>
              BlocProvider.of<RedditArticlesCubit>(context)
                  .onRedditDetailsTap(redditArticleIdentifier),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      Injector.resolve<RedditArticlesCubit>()..init(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text('Reddit Articles', style: TextStyle(color: Colors.white),),
          ),
          body: _buildBody(context)),
    );
  }
}

