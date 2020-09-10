import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/movie.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';

class MovieProvider {
  final Dio _http = Get.find<Dio>();

  Future<List<Movie>> getTopMovies() async {
    final Response response = await _http.get("/movie/top_rated",
        queryParameters: {
          "api_key": Constant.MOVIE_DB_API_KEY,
          "languaje": "es"
        });

    return (response.data["results"] as List)
        .map<Movie>((e) => Movie.fromJson(e))
        .toList();
  }
}
