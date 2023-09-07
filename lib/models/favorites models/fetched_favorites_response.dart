import 'package:shop_app_handeling_apis/models/home%20models/product_model.dart';

class FetchedFavoritesResponse {
  late bool status;
  late String? message;
  List<FavoritesResponseData> data = [];

  FetchedFavoritesResponse.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    json['data']['data'].forEach((element) {
      data.add(FavoritesResponseData.fromJSON(element));
    });
  }
}

class FavoritesResponseData {
  late int id;
  late ProductModel data;
  FavoritesResponseData.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    data = ProductModel.fromJSON(json['product']);
  }
}
