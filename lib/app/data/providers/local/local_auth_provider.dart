import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';

class LocalAuthProvider {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> clearSession() async {
    await _storage.delete(key: Constant.SESSION_KEY);
  }

  Future<void> setSession(RequestToken requestToken) async {
    await _storage.write(
        key: Constant.SESSION_KEY, value: json.encode(requestToken..toJson()));
  }

  Future<RequestToken> getSession() async {
    final sessionData = await _storage.read(key: Constant.SESSION_KEY);

    if (sessionData != null) {
      final RequestToken requestToken =
          RequestToken.fromJson(json.decode(sessionData));

      if (DateTime.now().isBefore(requestToken.expiresAt)) {
        return requestToken;
      }

      return null;
    }

    return null;
  }
}
