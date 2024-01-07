class ProductEntity {
  int id;
  double price;
  double oldPrice;
  double discount;
  String image;
  String name;
  String description;
  List<dynamic> images;
  bool inFavorites;
  bool inCart;

  ProductEntity({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
    required this.name,
    required this.description,
    required this.images,
    required this.inFavorites,
    required this.inCart,
  });
}