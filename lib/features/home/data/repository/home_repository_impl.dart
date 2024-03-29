import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/home/data/data_sources/remote/home_service.dart';
import 'package:shop_app_handeling_apis/features/home/data/models/category_model.dart';
import 'package:shop_app_handeling_apis/features/home/data/models/home_data_model.dart';
import 'package:shop_app_handeling_apis/features/home/data/models/product_model.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/category_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
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

  @override
  Future<DataState<List<CategoryEntity>>> fetchCategories() async {
    try {
      final categories = <CategoryModel>[];
      final response = await _homeService.fetchCategories();
      if (response.data['status'] == true) {
        response.data['data']['data'].forEach((element) {
          categories.add(CategoryModel.fromJSON(element));
        });
        return DataSuccess(categories);
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
  Future<DataState<List<ProductEntity>>> fetchFavorites({
    required String token,
  }) async {
    try {
      final favorites = <ProductModel>[];
      final response = await _homeService.fetchFavorites(token: token);
      if (response.data['status'] == true) {
        response.data['data']['data'].forEach((element) {
          favorites.add(ProductModel.fromJSON(element['product']));
        });
        return DataSuccess(favorites);
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
  Future<DataState<ProductEntity>> fetchProductDetails(
      {required String token, required int productId}) async {
    try {
      final response = await _homeService.fetchProductDetails(
        token: token,
        productId: productId,
      );
      if (response.data['status'] == true) {
        return DataSuccess(ProductModel.fromJSON(response.data['data']));
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
  Future<DataState<List<ProductEntity>>> fetchCategoryProducts({
    required String token,
    required int categoryId,
  }) async {
    try {
      final categoryProducts = <ProductModel>[];
      final response = await _homeService.fetchCategoryProducts(
        token: token,
        categoryId: categoryId,
      );
      if (response.data['status'] == true) {
        response.data['data']['data'].forEach((element) {
          categoryProducts.add(ProductModel.fromJSON(element));
        });
        return DataSuccess(categoryProducts);
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
