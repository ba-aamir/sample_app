import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/news_app/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:test_app/features/news_app/presentation/bloc/post/remote/remote_post_state.dart';

import '../../../domain/entities/post_entity.dart';
import '../../widgets/post_tile.dart';

class MyNews extends StatelessWidget {
  const MyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'My News',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemotePostsBloc, RemotePostState>(builder: (_, state) {

      if (state is RemotePostLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemotePostError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemotePostDone) {
        return ListView.builder(
            itemBuilder: (context,index){
              return ArticleWidget(
                article: state.posts![index],
                onArticlePressed: (article) => _onArticlePressed(context,article),
              );
            },
          itemCount: state.posts!.length,
        );
      }
      return const SizedBox();
    });
  }

  void _onArticlePressed(BuildContext context, PostEntity article) {
    Navigator.pushNamed(context, '/PostDetails', arguments: article);
  }
}
