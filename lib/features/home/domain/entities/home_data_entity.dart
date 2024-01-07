import 'package:shop_app_handeling_apis/features/home/domain/entities/banner_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';

class HomeDataEntity {
  List<BannerEntity> banners;
  List<ProductEntity> products;
  String ad;

  HomeDataEntity({
    required this.banners,
    required this.products,
    required this.ad,
  });
}
