class LogoutResponseModel {
  late bool status;
  late String message;
  LogoutData? data;
  LogoutResponseModel.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['status']? LogoutData.fromJSON(json['data']): null;
  }
}

class LogoutData {
  late int id;
  late String token;
  LogoutData.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
  }
}
