class BannerModel {
  late int? id;
  late String? image;
  late String? category;
  late String? product;

  BannerModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    category = json['category'];
    product = json['product'];
  }
}
