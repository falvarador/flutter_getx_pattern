import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_pattern_demo/app/data/repositories/local/local_auth_repository.dart';
import 'package:getx_pattern_demo/app/routes/app_routes.dart';

class SplashController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    _init();
  }

  _init() async {
    try {
      final requestToken = await _localAuthRepository.getSession();

      Get.offNamed(requestToken != null ? AppRoutes.HOME : AppRoutes.LOGIN);
    } catch (e) {
      print(e);
    }
  }
}
