import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';

class CartItemEntity {
  final int id;
  int quantity;
  ProductEntity product;
  CartItemEntity({
    required this.id,
    required this.quantity,
    required this.product,
  });
}
