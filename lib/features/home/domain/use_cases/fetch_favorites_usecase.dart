import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/repository/home_repository.dart';

class FetchFavoritesUsecase
    implements UseCase<DataState<List<ProductEntity>>, String> {
  final HomeRepository _homeRepository;
  FetchFavoritesUsecase(this._homeRepository);
  @override
  Future<DataState<List<ProductEntity>>> call({String params = ""}) {
    return _homeRepository.fetchFavorites(token: params);
  }
}
