import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/gubits/shop_states.dart';
import 'package:shop_app_handeling_apis/models/categories%20models/categories_response.dart';
import 'package:shop_app_handeling_apis/models/favorites%20models/fetched_favorites_response.dart';
import 'package:shop_app_handeling_apis/models/favorites%20models/toggle_favorites_response.dart';
import 'package:shop_app_handeling_apis/models/home%20models/home_response.dart';
import 'package:shop_app_handeling_apis/models/home%20models/product_model.dart';
import 'package:shop_app_handeling_apis/models/product_details_models/product_details_response.dart';
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
  ToggleFavoriteResponse? toggleFavResponse;
  FetchedFavoritesResponse? fetchedFavResponse;
  ToggleFavoriteResponse? deletedFavResponse;
  DetailsResponse? productDetailsResponse;
  CancelToken? searchCancelToken;

  static ShopCubit get(contex) => BlocProvider.of(contex);

  void updateIndex(int newIndex) {
    index = newIndex;
    if (newIndex == 1 && categoriesResponse == null) {
      fetchCategories();
    }
    if (newIndex == 2 && fetchedFavResponse == null) {
      fetchUserFavorites();
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

  Future<void> fetchProductDetails({required int productId}) async {
    isLoading = true;
    emit(LoadingState());
    try {
      Response<dynamic> response = await DioHelper.get(
        endPoint: 'products/$productId',
        lang: 'en',
        token: token,
      );
      productDetailsResponse = DetailsResponse.fromJSON(response.data);
      isLoading = false;
      emit(LoadingState());
      emit(FetchDetailsSuccessState());
    } catch (error) {
      isLoading = false;
      emit(LoadingState());
      emit(FetchDetailsErrorState());
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

  Future<void> toggleFavorite({required ProductModel product}) async {
    product.inFavorites = !product.inFavorites;
    emit(RealTimeToggleFavoriteSuccessState());
    try {
      Response<dynamic> response = await DioHelper.post(
        endPoint: 'favorites',
        data: {'product_id': product.id},
        lang: 'en',
        token: token,
      );
      toggleFavResponse = ToggleFavoriteResponse.fromJSON(response.data);
      if (toggleFavResponse!.status == false) {
        product.inFavorites = !product.inFavorites;
        emit(RealTimeToggleFavoriteErrorState());
      }
      emit(ToggleFavoriteSuccessState(
        toggleFavResponse!.status,
        toggleFavResponse!.message,
      ));
    } catch (error) {
      product.inFavorites = !product.inFavorites;
      emit(RealTimeToggleFavoriteErrorState());
      emit(ToggleFavoriteErrorState(error.toString()));
    }
  }

  Future<void> fetchUserFavorites() async {
    isLoading = true;
    emit(LoadingState());
    try {
      Response<dynamic> response = await DioHelper.get(
        endPoint: 'favorites',
        lang: 'en',
        token: token,
      );
      fetchedFavResponse = FetchedFavoritesResponse.fromJSON(response.data);
      isLoading = false;
      emit(LoadingState());
      emit(FetchFavoritesSuccessState(
        toggleFavResponse!.status,
        toggleFavResponse!.message,
      ));
    } catch (error) {
      isLoading = false;
      emit(LoadingState());
      emit(FetchFavoritesErrorState(error.toString()));
    }
  }

  Future<void> removeFromFavorites({
    required FavoritesResponseData favItem,
  }) async {
    if (homeResponseModel != null) {
      homeResponseModel!.data.products
          .firstWhere(
            (element) => element.id == favItem.data.id,
          )
          .inFavorites = false;
    }
    int itemIndex = fetchedFavResponse!.data.indexOf(favItem);
    fetchedFavResponse!.data.remove(favItem);
    emit(RealTimeDeleteFavoriteSuccessState());
    try {
      Response<dynamic> response = await DioHelper.delete(
        endPoint: 'favorites/${favItem.id}',
        lang: 'en',
        token: token,
      );
      deletedFavResponse = ToggleFavoriteResponse.fromJSON(response.data);
      if (deletedFavResponse!.status == false) {
        undoDeletingFaveorite(itemIndex, favItem);
      }
      emit(DeleteFavoriteSuccessState(
        deletedFavResponse!.status,
        deletedFavResponse!.message,
      ));
    } catch (error) {
      undoDeletingFaveorite(itemIndex, favItem);
      emit(DeleteFavoriteErrorState(error.toString()));
    }
  }

  void undoDeletingFaveorite(int index, FavoritesResponseData item) {
    if (homeResponseModel != null) {
      homeResponseModel!.data.products
          .firstWhere(
            (element) => element.id == item.data.id,
          )
          .inFavorites = true;
    }
    fetchedFavResponse!.data.insert(index, item);
    emit(RealTimeDeleteFavoriteErrorState());
  }

  @override
  Future<void> close() {
    searchCancelToken?.cancel("Cancelled due to bloc disposal");
    return super.close();
  }
}
