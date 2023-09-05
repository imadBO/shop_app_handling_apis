class ProductModel {
  late int id;
  late double price;
  late double oldPrice;
  late double discount;
  late String image;
  late String name;
  late String description;
  late List<dynamic> images;
  late bool inFavorites;
  late bool inCart;

  ProductModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'].toDouble();
    oldPrice = json['old_price'] == null ? 0 : json['old_price'].toDouble();
    discount = json['discount'] == null ? 0 : json['discount'].toDouble();
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
