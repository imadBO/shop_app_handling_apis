import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/repository/cart_repository.dart';

class AddToCartsUsecase implements UseCase<DataState<int>, Map> {
  final CartRepository _cartRepository;
  AddToCartsUsecase(this._cartRepository);
  @override
  Future<DataState<int>> call({params = const {}}) async {
    return _cartRepository.addToCart(
      productId: params['productId'],
      token: params['token'],
    );
  }
}
