import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:getx_pattern_demo/app/data/providers/local/local_auth_provider.dart';
import 'package:getx_pattern_demo/app/data/providers/remote/auth_provider.dart';
import 'package:getx_pattern_demo/app/data/providers/remote/movie_provider.dart';
import 'package:getx_pattern_demo/app/data/repositories/local/local_auth_repository.dart';
import 'package:getx_pattern_demo/app/data/repositories/remote/auth_repository.dart';
import 'package:getx_pattern_demo/app/data/repositories/remote/movie_repository.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';

// class MockAuthProvider implements AuthProvider {
//   @override
//   Future<RequestToken> getNewRequestToken() {}
// }

class DependencyInjection {
  static void init() {
    // Commons
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(),
        fenix: true);
    Get.lazyPut<Dio>(
        () => Dio(BaseOptions(baseUrl: Constant.MOVIE_DB_BASE_URL)),
        fenix: true);

    // Providers
    Get.lazyPut<AuthProvider>(() => AuthProvider(), fenix: true);
    Get.lazyPut<LocalAuthProvider>(() => LocalAuthProvider(), fenix: true);
    Get.lazyPut<MovieProvider>(() => MovieProvider(), fenix: true);

    // Repositories
    Get.lazyPut<AuthRepository>(() => AuthRepository(), fenix: true);
    Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository(), fenix: true);
    Get.lazyPut<MovieRepository>(() => MovieRepository(), fenix: true);
  }
}
