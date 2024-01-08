import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/repository/cart_repository.dart';

class AddRemoveCartsUsecase implements UseCase<DataState<int>, Map> {
  final CartRepository _cartRepository;
  AddRemoveCartsUsecase(this._cartRepository);
  @override
  Future<DataState<int>> call({params = const {}}) async {
    return _cartRepository.addOrRemoveCart(
      productId: params['productId'],
      token: params['token'],
    );
  }
}
