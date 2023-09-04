import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/cubits/shop_states.dart';
import 'package:shop_app_handeling_apis/models/categories%20models/categories_response.dart';
import 'package:shop_app_handeling_apis/models/home%20models/home_response.dart';
import 'package:shop_app_handeling_apis/models/search%20models/search_response.dart';
import 'package:shop_app_handeling_apis/shared/cached_helper.dart';
import 'package:shop_app_handeling_apis/shared/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(InitialShopState()) {
    fetchHomeData();
  }

  int index = 0;
  bool isLoading = false;
  bool shouldAutoPlay = true;
  bool showActions = false;
  String token = CachedHelper.getData('token');
  HomeResponseModel? homeResponseModel;
  CategoriesResponse? categoriesResponse;
  SearchResponse? searchResponse;
  CancelToken? searchCancelToken;

  static ShopCubit get(contex) => BlocProvider.of(contex);

  void updateIndex(int newIndex) {
    index = newIndex;
    if (newIndex == 1 && categoriesResponse == null) {
      fetchCategories();
    }
    emit(BottomNavUpdateIndexState());
  }

  void updateAutoPlay(bool autoplay) {
    shouldAutoPlay = autoplay;
    emit(AutoplayState());
  }

  void updateActionsVisibility(bool visibility) {
    showActions = visibility;
    emit(ActionsState());
  }

  Future<void> fetchHomeData() async {
    isLoading = true;
    emit(LoadingState());
    try {
      Response<dynamic> response = await DioHelper.get(
        endPoint: 'home',
        lang: 'en',
        token: token,
      );
      homeResponseModel = HomeResponseModel.fromJSON(response.data);
      isLoading = false;
      emit(LoadingState());
      emit(HomeDataFetchingSuccessStae());
    } catch (error) {
      isLoading = false;
      emit(LoadingState());
      emit(HomeDataFetchingErrorStae(error.toString()));
    }
  }

  Future<void> fetchCategories() async {
    isLoading = true;
    emit(LoadingState());
    try {
      Response<dynamic> response = await DioHelper.get(
        endPoint: 'categories',
        lang: 'en',
      );
      categoriesResponse = CategoriesResponse.fromJSON(response.data);
      isLoading = false;
      emit(LoadingState());
      emit(CategoriesFetchingSuccessState());
    } catch (error) {
      isLoading = false;
      emit(LoadingState());
      emit(CategoriesFetchingErrorState(error.toString()));
    }
  }

  Future<void> getSearchMatches({required String input}) async {
    isLoading = true;
    emit(LoadingState());
    
    searchCancelToken?.cancel('Cancelled due to new request');
    searchCancelToken = CancelToken();
    try {
      Response<dynamic> response = await DioHelper.post(
        endPoint: 'products/search',
        data: {'text': input},
        lang: 'en',
        token: token,
        cancelToken: searchCancelToken,
      );
      searchResponse = SearchResponse.fromJSON(response.data);
      isLoading = false;
      emit(LoadingState());
      emit(
        SearchMatchesSuccessState(
          searchResponse!.status,
          searchResponse!.message,
        ),
      );
    } catch (error) {
      if (DioExceptionType.cancel != (error as DioException).type) {
        isLoading = false;
        emit(LoadingState());
        emit(SearchMatchesErrorState(error.toString()));
      }
    }
  }
  @override
  Future<void> close() {
    searchCancelToken?.cancel("Cancelled due to bloc disposal");
    return super.close();
  }
}
