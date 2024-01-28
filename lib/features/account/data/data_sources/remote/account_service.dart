import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/constants.dart';
import 'package:shop_app_handeling_apis/core/enums/langs.dart';
import 'package:shop_app_handeling_apis/core/extensions/langs_extensions.dart';
import 'package:shop_app_handeling_apis/core/helpers/dio_helper.dart';

class AccountService {
  Future<Response> getProfile({required String token}) {
    return DioHelper.get(
      endPoint: AppConstants.profileEndpoint,
      lang: Langs.english.getString(),
      token: token,
    );
  }

  Future<Response> changePassword({
    required String token,
    required Map<String, String> pwds,
  }) {
    return DioHelper.post(
      endPoint: AppConstants.changePasswordEndpoint,
      token: token,
      data: pwds,
    );
  }
}
