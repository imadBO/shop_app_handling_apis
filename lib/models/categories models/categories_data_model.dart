import 'package:shop_app_handeling_apis/models/categories%20models/category_data.dart';

class CategoriesData {
  late int currentPage;
  List<CategoryModel> categories = [];
  late String firstPageUrl;
  late int from;
  late int lastPage;
  late String lastPageUrl;
  late String? nextPageUrl;
  late String path;
  late int perPage;
  late String? prevPageUrl;
  late int to;
  late int total;

  CategoriesData.fromJSON(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((element) {
      categories.add(CategoryModel.fromJSON(element));
    });
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
}
