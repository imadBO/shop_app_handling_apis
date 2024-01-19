import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/update_cart_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/repository/cart_repository.dart';

class DeleteFromCartsUsecase implements UseCase<DataState<UpdateCartEntity>, Map> {
  final CartRepository _cartRepository;
  DeleteFromCartsUsecase(this._cartRepository);
  @override
  Future<DataState<UpdateCartEntity>> call({params = const {}}) async {
    return _cartRepository.removeFromCart(
      token: params['token'],
      cartId: params['cartId'],
    );
  }
}
