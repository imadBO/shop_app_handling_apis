import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/constants.dart';
import 'package:shop_app_handeling_apis/core/enums/langs.dart';
import 'package:shop_app_handeling_apis/core/extensions/langs_extensions.dart';
import 'package:shop_app_handeling_apis/core/helpers/dio_helper.dart';

class SearchService {
  Future<Response> getSearchMatches({
    required String input,
    required String token,
    required CancelToken cancelToken,
  }) async {
    Response<dynamic> response = await DioHelper.post(
      endPoint: AppConstants.searchEndpoint,
      data: {'text': input},
      lang: Langs.english.getString(),
      token: token,
      cancelToken: cancelToken,
    );
    return response;
  }
}
