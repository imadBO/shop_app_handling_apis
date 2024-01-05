import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/constants.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConstants.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': AppConstants.contentType,
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
    return await dio!.post(endPoint,
        data: data, queryParameters: query, cancelToken: cancelToken);
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
