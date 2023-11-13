import 'package:equatable/equatable.dart';
import 'package:test_app/features/news_app/domain/entities/post_entity.dart';
import 'package:dio/dio.dart';

abstract class RemotePostState extends Equatable{
  final List<PostEntity>? posts;
  final DioError? error;
  const RemotePostState({this.posts,this.error});

  @override
  List<Object> get props => [posts!,error!];
}
class RemotePostLoading extends RemotePostState{
  const RemotePostLoading();
}
class RemotePostDone extends RemotePostState{
  const RemotePostDone(List<PostEntity> post) : super(posts: post);
}
class RemotePostError extends RemotePostState{
  const RemotePostError(DioError error) : super(error: error);
}