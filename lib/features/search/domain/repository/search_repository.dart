import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/search/domain/entities/search_product_entity.dart';

abstract class SearchRepository {
  Future<DataState<List<SearchProductEntity>>> search({
    required String input,
    required String token,
    required CancelToken cancelToken,
  });
}
