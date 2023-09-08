import 'package:dio/dio.dart';

// Base url : https://student.valuxapps.com/api/
// Path : login
// Query : ?country=us&apiKey=
// Key : d4b900204cdf42b38f0e5c30b8ac8303
class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> post({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
    CancelToken? cancelToken,
  }) async {
    dio!.options.headers.addEntries(
      {
        'lang': lang,
        'Authorization': token,
      }.entries,
    );
    return await dio!.post(endPoint, data: data, queryParameters: query, cancelToken: cancelToken);
  }

  static Future<Response> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers.addEntries(
      {
        'lang': lang,
        'Authorization': token,
      }.entries,
    );
    return await dio!.get(endPoint, data: data, queryParameters: query);
  }

  static Future<Response> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? query,
    String? lang,
    String? token,
  }) async {
    dio!.options.headers.addEntries(
      {
        'lang': lang,
        'Authorization': token,
      }.entries,
    );
    return await dio!.delete(endPoint, data: data, queryParameters: query);
  }
}
