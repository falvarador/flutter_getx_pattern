import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/data/providers/remote/auth_provider.dart';

class AuthRepository {
  final AuthProvider _provider = Get.find<AuthProvider>();

  Future<RequestToken> newRequestToken() => _provider.newRequestToken();
  Future<RequestToken> validateWithLogin(
          {@required String username,
          @required String password,
          @required String requestToken}) =>
      _provider.validateWithLogin(
          username: username, password: password, requestToken: requestToken);
}
