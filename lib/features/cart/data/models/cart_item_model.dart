import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_item_entity.dart';
import 'package:shop_app_handeling_apis/features/home/data/models/product_model.dart';

class CartItemModel extends CartItemEntity {
  CartItemModel({
    required super.id,
    required super.quantity,
    required super.product,
  });

  factory CartItemModel.fromJSON(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      quantity: json['quantity'],
      product: ProductModel.fromJSON(json['product']),
    );
  }
}
