import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.price,
    required super.oldPrice,
    required super.discount,
    required super.image,
    required super.name,
    required super.description,
    required super.images,
    required super.inFavorites,
    required super.inCart,
  });

  factory ProductModel.fromJSON(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: json['price'].toDouble(),
      oldPrice: json['old_price'] == null ? 0 : json['old_price'].toDouble(),
      discount: json['discount'] == null ? 0 : json['discount'].toDouble(),
      image: json['image'],
      name: json['name'],
      description: json['description'],
      images: json['images'] ?? [],
      inFavorites: json['in_favorites'] ?? true,
      inCart: json['in_cart'] ?? false,
    );
  }
}
