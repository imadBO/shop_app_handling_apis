class SearchResponse {
  late bool status;
  late String? message;
  late List<SearchData> data = [];

  SearchResponse.fromJSON(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['status']) {
      json['data']['data'].forEach((element) {
        data.add(SearchData.fromJSON(element));
      });
    }
  }
}

class SearchData {
  late int id;
  late double price;
  late String image;
  late String name;
  late String description;
  late List<dynamic> images;
  late bool inFavorites;
  late bool inCart;

  SearchData.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'].toDouble();
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
