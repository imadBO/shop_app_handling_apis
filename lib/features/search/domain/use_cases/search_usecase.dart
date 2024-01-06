import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/search/domain/entities/search_product_entity.dart';
import 'package:shop_app_handeling_apis/features/search/domain/repository/search_repository.dart';

class SearchUsecase
    implements UseCase<DataState<List<SearchProductEntity>>, Map> {
  final SearchRepository _searchRepository;
  SearchUsecase(this._searchRepository);
  @override
  Future<DataState<List<SearchProductEntity>>> call({params = const {}}) async {
    return _searchRepository.search(
      input: params['input'],
      token: params['token'],
      cancelToken: params['cancelToken'],
    );
  }
}
