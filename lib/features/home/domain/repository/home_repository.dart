import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/category_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/home_data_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';

abstract class HomeRepository {
  Future<DataState<HomeDataEntity>> fetchHomeData({required String token});
  Future<DataState<bool>> toggleFavorite({
    required int productId,
    required String token,
  });
  Future<DataState<List<CategoryEntity>>> fetchCategories();
  Future<DataState<List<ProductEntity>>> fetchFavorites({
    required String token,
  });
}
