import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/update_cart_entity.dart';

abstract class CartRepository {
  Future<DataState<CartEntity>> getCarts({required String token});
  Future<DataState<UpdateCartEntity>> updateCart({
    required String token,
    required int quantity,
    required int cartId,
  });
  Future<DataState<int>> addOrRemoveCart({
    required int productId,
    required String token,
  });
}
