import 'package:shop_app_handeling_apis/models/home%20models/product_model.dart';

class DetailsResponse {
  late bool status;
  late String? message;
  late ProductModel? data;
  DetailsResponse.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['status']) {
      data = ProductModel.fromJSON(json['data']);
    }
  }
}
