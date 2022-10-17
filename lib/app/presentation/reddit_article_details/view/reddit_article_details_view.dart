import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/app/presentation/reddit_article_details/widgets/reddit_article_details_widget.dart';

import '../../../../di/injector.dart';
import '../../../core/widgets/index.dart' as core_widgets;
import '../controller/index.dart';



class RedditArticleDetailsView extends StatelessWidget {
  const RedditArticleDetailsView({Key? key}) : super(key: key);


  Widget _buildBody(BuildContext context) {
    return BlocBuilder<RedditArticleDetailsCubit, RedditArticleDetailsState>(
      builder: (context, state) {
        return state.when(
          initial: () => core_widgets.LoadingWidget(),
          error: (failure) => core_widgets.ErrorWidget(failure.message),
          empty: () => const core_widgets.EmptyWidget(),
          loading: () => core_widgets.LoadingWidget(),
          success: (redditArticle) => RedditArticleDetailsWidget(
            redditArticle: redditArticle,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      Injector.resolve<RedditArticleDetailsCubit>()..init(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: const Text('Reddit Article Details', style: TextStyle(color: Colors.white),),
          ),
          body: _buildBody(context)),
    );
  }
}

