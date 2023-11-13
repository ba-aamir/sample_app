import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/theme/app_themes.dart';
import 'package:test_app/features/news_app/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:test_app/features/news_app/presentation/bloc/post/remote/remote_post_event.dart';
import 'package:test_app/injuction_container.dart';

import 'config/routes/routes.dart';
import 'features/news_app/presentation/pages/home/home_screen.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemotePostsBloc>(
      create: (context) => s1()..add(const GetPosts()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const MyNews()
      ),
    );
  }
}