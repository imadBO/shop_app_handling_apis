import 'package:shop_app_handeling_apis/models/user_model.dart';

class LoginModel {
  bool status = false;
  String message = 'Something went wrong!';
  UserModel? data;

  LoginModel.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] == null ? null : UserModel.fromJSON(json['data']);
  }
}
