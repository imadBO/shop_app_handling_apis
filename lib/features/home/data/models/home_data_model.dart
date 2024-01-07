import 'package:shop_app_handeling_apis/features/home/data/models/banner_model.dart';
import 'package:shop_app_handeling_apis/features/home/data/models/product_model.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/home_data_entity.dart';

class HomeDataModel extends HomeDataEntity {
  HomeDataModel({
    required super.banners,
    required super.products,
    required super.ad,
  });

  factory HomeDataModel.fromJSON(Map<String, dynamic> json) {
    final banners = <BannerModel>[];
    final products = <ProductModel>[];
    json['banners'].forEach((element) {
      banners.add(BannerModel.fromJSON(element));
    });
    json['products'].forEach((element) {
      products.add(ProductModel.fromJSON(element));
    });
    return HomeDataModel(
      banners: banners,
      products: products,
      ad: json['ad'],
    );
  }
}
