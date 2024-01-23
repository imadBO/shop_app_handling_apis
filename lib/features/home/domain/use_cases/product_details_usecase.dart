import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/repository/home_repository.dart';

class ProductDetailsUsecase implements UseCase<DataState<ProductEntity>, Map> {
  final HomeRepository _homeRepository;
  ProductDetailsUsecase(this._homeRepository);
  @override
  Future<DataState<ProductEntity>> call({params = const {}}) {
    return _homeRepository.fetchProductDetails(
      token: params['token'],
      productId: params['productId'],
    );
  }
}
