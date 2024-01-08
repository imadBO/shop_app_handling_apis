import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  List<CartItemEntity> cartItems = [];
  double subTotal;
  double total;
  CartEntity({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });
}
