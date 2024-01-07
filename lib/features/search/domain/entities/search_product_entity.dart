import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';

class SearchProductEntity extends ProductEntity {
  SearchProductEntity({
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
}
