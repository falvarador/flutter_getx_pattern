import 'package:get/get.dart';
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/data/providers/local/local_auth_provider.dart';

class LocalAuthRepository {
  final LocalAuthProvider _localAuthProvider = Get.find<LocalAuthProvider>();

  Future<void> clearSession() => _localAuthProvider.clearSession();

  Future<RequestToken> getSession() => _localAuthProvider.getSession();

  Future<void> setSession(RequestToken requestToken) =>
      _localAuthProvider.setSession(requestToken);
}
