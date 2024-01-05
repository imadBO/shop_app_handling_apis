import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/constants.dart';
import 'package:shop_app_handeling_apis/core/enums/langs.dart';
import 'package:shop_app_handeling_apis/core/extensions/langs_extensions.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/helpers/dio_helper.dart';

class AuthService {
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    Response<dynamic> response = await DioHelper.post(
      endPoint: AppConstants.loginEndpoint,
      data: {'email': email, 'password': password},
      lang: Langs.english.getString(),
    );
    return response;
  }

  Future<Response> register({required Map userData}) async {
    Response<dynamic> response = await DioHelper.post(
      endPoint: AppConstants.registerEndpoint,
      data: userData,
      lang: Langs.english.getString(),
    );
    return response;
  }

  Future<Response> logout({required String token}) async {
    Response<dynamic> response = await DioHelper.post(
      endPoint: AppConstants.logoutEndpoint,
      data: {"fcm_token": token},
      lang: Langs.english.getString(),
      token: token,
    );
    await CachedHelper.deleteData('token');
    return response;
  }
}
