import 'package:test_app/core/resources/data_state.dart';
import 'package:test_app/features/news_app/domain/entities/post_entity.dart';
import 'package:test_app/features/news_app/domain/repository/post_repository.dart';
import 'package:test_app/features/news_app/domain/usecases/get_post.dart';

class GetPostUseCase implements UseCase<DataState<List<PostEntity>>,void>{
  final PostRepository _postRepository;

  GetPostUseCase(this._postRepository);

  @override
  Future<DataState<List<PostEntity>>> call({void params}) {
    return _postRepository.getPosts();
  }

}