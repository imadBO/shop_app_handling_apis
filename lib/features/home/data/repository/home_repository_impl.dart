import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/home/data/data_sources/remote/home_service.dart';
import 'package:shop_app_handeling_apis/features/home/data/models/home_data_model.dart';
import 'package:shop_app_handeling_apis/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeService _homeService;
  HomeRepositoryImpl(this._homeService);
  @override
  Future<DataState<HomeDataModel>> fetchHomeData(
      {required String token}) async {
    try {
      final response = await _homeService.fetchHomeData(token: token);
      if (response.data['status'] == true) {
        return DataSuccess(HomeDataModel.fromJSON(response.data['data']));
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      if (error is DioException) {
        return DataFailureDio(error);
      }
      return DataFailure(error.toString());
    }
  }

  @override
  Future<DataState<bool>> toggleFavorite({
    required int productId,
    required String token,
  }) async {
    try {
      final response =
          await _homeService.toggleFavorite(productId: productId, token: token);
      if (response.data['status'] == true) {
        return const DataSuccess(true);
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      if (error is DioException) {
        return DataFailureDio(error);
      }
      return DataFailure(error.toString());
    }
  }
}
