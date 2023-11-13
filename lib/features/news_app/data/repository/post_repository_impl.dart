import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_app/core/resources/data_state.dart';
import 'package:test_app/features/news_app/data/data_sources/remote/my_api_service.dart';
import 'package:test_app/features/news_app/data/models/post.dart';
import 'package:test_app/features/news_app/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository{
  final MyApiService _apiService;
  PostRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<PostModel>>> getPosts() async {
    try {
      final httpResponse = await _apiService.getPosts(page: "1", catId: "1");

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
            DioError(
                error: httpResponse.response.statusMessage,
                response: httpResponse.response,
                type: DioErrorType.badResponse,
                requestOptions: httpResponse.response.requestOptions
            )
        );
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

}