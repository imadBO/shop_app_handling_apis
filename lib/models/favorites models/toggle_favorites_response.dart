class ToggleFavoriteResponse {
  late bool status;
  late String message;
  ToggleFavoriteResponse.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
