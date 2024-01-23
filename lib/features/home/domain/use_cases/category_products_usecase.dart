import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/repository/home_repository.dart';

class FetchCategoryProductsUsecase
    implements UseCase<DataState<List<ProductEntity>>, Map> {
  final HomeRepository _homeRepository;
  FetchCategoryProductsUsecase(this._homeRepository);
  @override
  Future<DataState<List<ProductEntity>>> call({params = const {}}) {
    return _homeRepository.fetchCategoryProducts(
      token: params['token'],
      categoryId: params['categoryId'],
    );
  }
}
