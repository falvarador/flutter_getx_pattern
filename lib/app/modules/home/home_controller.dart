import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/data/repositories/auth_repository.dart';
import 'package:getx_pattern_demo/app/global_widgets%20/error_alert_dialog.dart';

class HomeController extends GetxController {
  final AuthRepository _repository = Get.find<AuthRepository>();

  String _username = '', _password = '';

  void onUserNameChanged(String value) {
    _username = value;
  }

  void onUserPasswordChanged(String value) {
    _password = value;
  }

  Future<void> submit() async {
    try {
      RequestToken requestToken = await _repository.newRequestToken();

      final RequestToken authRequestToken = await _repository.validateWithLogin(
          username: _username,
          password: _password,
          requestToken: requestToken.requestToken);

      print("login ok");
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
