import 'package:shop_app_handeling_apis/features/cart/data/models/cart_item_model.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    required super.cartItems,
    required super.subTotal,
    required super.total,
  });
  factory CartModel.fromJSON(Map<String, dynamic> json) {
    List<CartItemModel> cartItems = [];
    json['cart_items'].forEach(
      (element) {
        cartItems.add(CartItemModel.fromJSON(element));
      },
    );
    return CartModel(
      cartItems: cartItems,
      subTotal: json['sub_total'].toDouble(),
      total: json['total'].toDouble(),
    );
  }
}
