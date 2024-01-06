import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/search/domain/entities/search_product_entity.dart';
import 'package:shop_app_handeling_apis/features/search/domain/use_cases/search_usecase.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/cubits/search_states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this._searchUsecase) : super(SearchInitialState());
  final SearchUsecase _searchUsecase;
  final String _token = CachedHelper.getData('token');
  bool isLoading = false;
  CancelToken? _searchCancelToken;
  List<SearchProductEntity> searchResult = [];

  static SearchCubit get(context) => BlocProvider.of(context);

  Future<void> search({required String input}) async {
    isLoading = true;
    emit(LoadingState());

    _searchCancelToken?.cancel('Cancelled due to new request');
    _searchCancelToken = CancelToken();

    final response = await _searchUsecase.call(params: {
      'token': _token,
      'cancelToken': _searchCancelToken,
      'input': input,
    });
    if (response is DataSuccess) {
      searchResult = response.data!;
      emit(SearchMatchesSuccessState());
    } else {
      if ((response is DataFailure) ||
          (response is DataFailureDio &&
              (DioExceptionType.cancel !=
                  (response.error as DioException).type))) {
        emit(
          SearchMatchesErrorState(
              response.error ?? StringsManager.defaultError),
        );
      }
    }
    isLoading = false;
    emit(LoadingState());
  }
}
