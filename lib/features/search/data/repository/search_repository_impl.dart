import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/search/data/data_sources/remote/search_service.dart';
import 'package:shop_app_handeling_apis/features/search/data/models/search_product_model.dart';
import 'package:shop_app_handeling_apis/features/search/domain/entities/search_product_entity.dart';
import 'package:shop_app_handeling_apis/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchService _searchService;
  SearchRepositoryImpl(this._searchService);
  @override
  Future<DataState<List<SearchProductEntity>>> search({
    required String input,
    required String token,
    required CancelToken cancelToken,
  }) async {
    try {
      final response = await _searchService.getSearchMatches(
        input: input,
        token: token,
        cancelToken: cancelToken,
      );
      if (response.data['status'] == true) {
        final products = <SearchProductModel>[];
        for (Map<String, dynamic> elt in response.data['data']['data']) {
          products.add(SearchProductModel.fromJSON(elt));
        }
        return DataSuccess(products);
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      if (error is DioException) {
        return DataFailureDio(error);
      }
      return DataFailure(error.toString());
    }
  }
}
