import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/constants.dart';
import 'package:shop_app_handeling_apis/core/enums/langs.dart';
import 'package:shop_app_handeling_apis/core/extensions/langs_extensions.dart';
import 'package:shop_app_handeling_apis/core/helpers/dio_helper.dart';

class CartService {
  Future<Response> getCarts({required String token}) async {
    return await DioHelper.get(
      endPoint: AppConstants.cartsEndpoint,
      token: token,
      lang: Langs.english.getString(),
    );
  }

  Future<Response> updateCart({
    required String token,
    required int quantity,
    required int cartId,
  }) async {
    return await DioHelper.put(
      endPoint: '${AppConstants.cartsEndpoint}/$cartId',
      data: {'quantity': quantity},
      token: token,
      lang: Langs.english.getString(),
    );
  }
}
