import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test_app/features/news_app/data/models/post.dart';

import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
part 'my_api_service.g.dart';

@RestApi(baseUrl:myBaseUrl)
abstract class MyApiService{
  factory MyApiService(Dio dio) = _MyApiService;

  @GET("posts.php")
  Future<HttpResponse<List<PostModel>>> getPosts({
    @Query("page") String? page,
    @Query("catId") String? catId
  });
}