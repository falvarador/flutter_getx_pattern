import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/providers/auth_provider.dart';
import 'package:getx_pattern_demo/app/data/repositories/auth_repository.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';

// class MockAuthProvider implements AuthProvider {
//   @override
//   Future<RequestToken> getNewRequestToken() {}
// }

class DependencyInjection {
  static void init() {
    Get.lazyPut<Dio>(
      () => Dio(BaseOptions(baseUrl: Constant.MOVIE_DB_BASE_URL)),
    );
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
  }
}
