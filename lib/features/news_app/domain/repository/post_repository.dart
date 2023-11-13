import 'package:test_app/features/news_app/domain/entities/post_entity.dart';

import '../../../../core/resources/data_state.dart';

abstract class PostRepository{
  Future<DataState<List<PostEntity>>> getPosts();
}