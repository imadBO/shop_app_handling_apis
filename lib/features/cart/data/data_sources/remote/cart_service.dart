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

  Future<Response> addOrRemoveCart({
    required int productId,
    required String token,
  }) async {
    return await DioHelper.post(
      endPoint: AppConstants.cartsEndpoint,
      token: token,
      data: {'product_id': productId},
      lang: Langs.english.getString(),
    );
  }

  Future<Response> removeCart({
    required int cartId,
    required String token,
  }) async {
    return await DioHelper.delete(
      endPoint: '${AppConstants.cartsEndpoint}/$cartId',
      token: token,
      lang: Langs.english.toString(),
    );
  }
}
