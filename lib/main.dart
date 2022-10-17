import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/data/models/reddit_articles_response_data_model.dart';
import 'app/routes/app_pages.dart';
import 'di/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.setup();

  runZonedGuarded(
    () => runApp(const RedditCloneApp()),
    (Object object, StackTrace stackTrace) => dev.log(
      object.toString(),
      error: object,
      stackTrace: stackTrace,
    ),
  );
}

class RedditCloneApp extends StatelessWidget {
  const RedditCloneApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.topLevel,
      title: "RedditClone",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
