import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/movie.dart';
import 'package:getx_pattern_demo/app/data/providers/remote/movie_provider.dart';

class MovieRepository {
  final MovieProvider _provider = Get.find<MovieProvider>();

  Future<List<Movie>> getTopMovie() => _provider.getTopMovies();
}
