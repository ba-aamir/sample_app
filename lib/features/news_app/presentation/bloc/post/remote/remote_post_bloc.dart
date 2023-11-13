import 'package:test_app/core/resources/data_state.dart';
import 'package:test_app/core/usecases/usecase.dart';
import 'package:test_app/features/news_app/presentation/bloc/post/remote/remote_post_event.dart';
import 'package:test_app/features/news_app/presentation/bloc/post/remote/remote_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemotePostsBloc extends Bloc<RemotePostEvent, RemotePostState> {
  final GetPostUseCase _getArticleUseCase;

  RemotePostsBloc(this._getArticleUseCase) : super(const RemotePostLoading()){
    on <GetPosts> (onGetPosts);
  }


  void onGetPosts(GetPosts event, Emitter < RemotePostState > emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
          RemotePostDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
          RemotePostError(dataState.error!)
      );
    }
  }
}
