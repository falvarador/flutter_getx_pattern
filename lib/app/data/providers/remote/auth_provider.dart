import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;
import 'package:getx_pattern_demo/app/data/models/request_token.dart';
import 'package:getx_pattern_demo/app/utils/constants.dart';

class AuthProvider {
  final Dio _http = Get.find<Dio>();

  Future<RequestToken> newRequestToken() async {
    final Response response = await _http.get(
      '/authentication/token/new',
      queryParameters: {
        "api_key": Constant.MOVIE_DB_API_KEY,
      },
    );
    return RequestToken.fromJson(response.data);
  }

  Future<RequestToken> validateWithLogin(
      {@required String username,
      @required String password,
      @required String requestToken}) async {
    final Response response = await _http
        .post('/authentication/token/validate_with_login', queryParameters: {
      "api_key": Constant.MOVIE_DB_API_KEY,
    }, data: {
      "username": username,
      "password": password,
      "request_token": requestToken
    });
    return RequestToken.fromJson(response.data);
  }
}
