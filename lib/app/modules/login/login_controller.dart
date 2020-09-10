import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/data/repositories/local/local_auth_repository.dart';
import 'package:getx_pattern_demo/app/data/repositories/remote/auth_repository.dart';
import 'package:getx_pattern_demo/app/global_widgets%20/error_alert_dialog.dart';
import 'package:getx_pattern_demo/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  String _username = '', _password = '';

  void onUserNameChanged(String value) {
    _username = value;
  }

  void onUserPasswordChanged(String value) {
    _password = value;
  }

  Future<void> submit() async {
    try {
      RequestToken requestToken = await _authRepository.newRequestToken();

      final RequestToken authRequestToken =
          await _authRepository.validateWithLogin(
              username: _username,
              password: _password,
              requestToken: requestToken.requestToken);

      await _localAuthRepository.setSession(authRequestToken);

      Get.offNamed(AppRoutes.HOME);
    } catch (e) {
      String message = "";

      if (e is DioError) {
        if (e.response != null) {
          message = e.response.statusMessage;
        } else {
          message = e.message;
        }
      }
      Get.dialog(ErrorAlertDialog(message: message));
    }
  }
}
