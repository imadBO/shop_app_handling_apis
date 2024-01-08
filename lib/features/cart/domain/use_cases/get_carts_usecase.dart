import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/repository/cart_repository.dart';

class GetCartsUsecase implements UseCase<DataState<CartEntity>, String> {
  final CartRepository _cartRepository;
  GetCartsUsecase(this._cartRepository);
  @override
  Future<DataState<CartEntity>> call({params = ""}) async {
    return _cartRepository.getCarts(token: params);
  }
}
