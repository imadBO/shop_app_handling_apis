import 'package:shop_app_handeling_apis/models/home%20models/product_model.dart';

class SearchResponse {
  late bool status;
  late String? message;
  late List<ProductModel> data = [];

  SearchResponse.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['status']) {
      json['data']['data'].forEach((element) {
        data.add(ProductModel.fromJSON(element));
      });
    }
  }
}
