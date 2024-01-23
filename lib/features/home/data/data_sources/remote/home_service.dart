import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/constants.dart';
import 'package:shop_app_handeling_apis/core/enums/langs.dart';
import 'package:shop_app_handeling_apis/core/extensions/langs_extensions.dart';
import 'package:shop_app_handeling_apis/core/helpers/dio_helper.dart';

class HomeService {
  Future<Response> fetchHomeData({required String token}) async {
    return await DioHelper.get(
      endPoint: AppConstants.homeDataEndpoint,
      lang: Langs.english.getString(),
      token: token,
    );
  }

  Future<Response> toggleFavorite({
    required int productId,
    required String token,
  }) async {
    return await DioHelper.post(
      endPoint: AppConstants.favoritesEndpoint,
      data: {'product_id': productId},
      lang: Langs.english.getString(),
      token: token,
    );
  }

  Future<Response> fetchCategories() async {
    return await DioHelper.get(
      endPoint: AppConstants.categoriesEndpoint,
      lang: Langs.english.getString(),
    );
  }

  Future<Response> fetchFavorites({required String token}) async {
    return await DioHelper.get(
      endPoint: AppConstants.favoritesEndpoint,
      lang: Langs.english.getString(),
      token: token,
    );
  }

  Future<Response> fetchProductDetails(
      {required String token, required int productId}) async {
    return await DioHelper.get(
      endPoint: '${AppConstants.productDetailsEndpoint}/$productId',
      token: token,
      lang: Langs.english.getString(),
    );
  }

  Future<Response> fetchCategoryProducts(
      {required token, required categoryId}) async {
    return await DioHelper.get(
      endPoint: '${AppConstants.categoriesEndpoint}/$categoryId',
      token: token,
      lang: Langs.english.getString(),
    );
  }
}
