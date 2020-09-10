import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_pattern_demo/app/data/models/movie.dart';
import 'package:getx_pattern_demo/app/data/repositories/local/local_auth_repository.dart';
import 'package:getx_pattern_demo/app/data/repositories/remote/movie_repository.dart';
import 'package:getx_pattern_demo/app/routes/app_routes.dart';

class HomeController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  final MovieRepository _movieRepository = Get.find<MovieRepository>();

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  Future<void> logOut() async {
    await _localAuthRepository.clearSession();

    Get.offNamedUntil(AppRoutes.LOGIN, (route) => false);
  }

  Future<void> _loadTopMovies() async {
    try {
      _movies = await _movieRepository.getTopMovie();
      print("Total de películas: ${_movies.length}");

      update();
    } catch (e) {
      print(e);
    }
  }

  @override
  void onReady() {
    _loadTopMovies();
  }
}
