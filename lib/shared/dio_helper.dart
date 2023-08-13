import 'package:dio/dio.dart';

// Base url : https://newsapi.org/
// Path : v2/top-headlines
// Query : ?country=us&apiKey=
// Key : d4b900204cdf42b38f0e5c30b8ac8303
class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getNews(Map<String, dynamic> query) async {
    return await dio!.get('v2/top-headlines', queryParameters: query);
  }
  static Future<Response> searchNews(Map<String, dynamic> query) async {
    return await dio!.get('v2/everything', queryParameters: query);
  }
}
