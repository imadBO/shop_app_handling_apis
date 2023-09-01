class CategoryModel {
  late int id;
  late String name;
  late String image;

  CategoryModel.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
