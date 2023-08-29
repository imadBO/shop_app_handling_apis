import 'package:shop_app_handeling_apis/models/home%20models/home_data_model.dart';

class HomeResponseModel{
  late bool status;
  String? message; 
  late HomeDataModel data;
  HomeResponseModel.fromJSON(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = HomeDataModel.fromJSON(json['data']);
  }
}