import 'package:shop_app_handeling_apis/models/categories%20models/categories_data_model.dart';

class CategoriesResponse {
  late bool status;
  late String? message;
  late CategoriesData? data;

  CategoriesResponse.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CategoriesData.fromJSON(json['data']) : null;
  }
}
