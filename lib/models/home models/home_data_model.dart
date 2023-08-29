import 'package:shop_app_handeling_apis/models/home%20models/banner_model.dart';
import 'package:shop_app_handeling_apis/models/home%20models/product_model.dart';

class HomeDataModel {
  List<BannerModel> banners = [];
  List<ProductModel> products = [];
  late String ad;

  HomeDataModel.fromJSON(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners.add(BannerModel.fromJSON(element));
    });
    json['products'].forEach((element) {
      products.add(ProductModel.fromJSON(element));
    });
    ad = json['ad'];
  }
}
