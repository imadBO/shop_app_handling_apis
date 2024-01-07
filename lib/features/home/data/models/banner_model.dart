import 'package:shop_app_handeling_apis/features/home/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity {
  BannerModel({
    required super.id,
    required super.image,
    required super.category,
    required super.product,
  });
  factory BannerModel.fromJSON(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image']??"",
      category: json['category']??"",
      product: json['product']??"",
    );
  }
}
