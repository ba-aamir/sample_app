import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:test_app/core/usecases/usecase.dart';
import 'package:test_app/features/news_app/data/data_sources/remote/my_api_service.dart';
import 'package:test_app/features/news_app/data/repository/post_repository_impl.dart';
import 'package:test_app/features/news_app/domain/repository/post_repository.dart';
import 'package:test_app/features/news_app/presentation/bloc/post/remote/remote_post_bloc.dart';

final s1=GetIt.instance;
Future<void> initializeDependencies() async{
  var dio=Dio();
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  s1.registerSingleton<Dio>(dio);

  s1.registerSingleton<MyApiService>(MyApiService(s1()));

  s1.registerSingleton<PostRepository>(
    PostRepositoryImpl(s1())
  );


  s1.registerSingleton<GetPostUseCase>(
    GetPostUseCase(s1())
  );


  s1.registerFactory<RemotePostsBloc>(
      ()=> RemotePostsBloc(s1())
  );
}