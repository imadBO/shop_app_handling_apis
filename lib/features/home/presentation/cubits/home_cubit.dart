import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/banner_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/category_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/home_data_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/categories_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/fetch_favorites_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/home_data_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/toggle_favorite_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(
    this._homeDataUsecase,
    this._toggleFavoriteUsecase,
    this._categoriesUsecase,
    this._fetchFavoritesUsecase,
  ) : super(HomeInitialState()) {
    if (CachedHelper.getData('token') != null) {
      ftechHomeData();
    }
  }
  factory HomeCubit.initData(context) {
    return HomeCubit.get(context)..ftechHomeData();
  }
  final HomeDataUsecase _homeDataUsecase;
  final ToggleFavoriteUsecase _toggleFavoriteUsecase;
  final CategoriesUsecase _categoriesUsecase;
  final FetchFavoritesUsecase _fetchFavoritesUsecase;
  bool homeDataLoading = false;
  bool categoriesLoading = false;
  bool favoritesLoading = false;
  bool shouldAutoPlay = true;
  bool showActions = false;
  int index = 0;
  HomeDataEntity? homeData;
  List<ProductEntity> homeProducts = [];
  List<BannerEntity> homeBanners = [];
  List<CategoryEntity> categories = [];
  List<ProductEntity> favorites = [];

  static HomeCubit get(context) => BlocProvider.of(context);

  void updateAutoPlay(bool autoplay) {
    shouldAutoPlay = autoplay;
    emit(UpdateAutoPlayBannersState());
  }

  void updateActionsVisibility(bool visibility) {
    showActions = visibility;
    emit(UpdateActionsVisibilityState());
  }

  void updateIndex(int newIndex) {
    index = newIndex;
    if (newIndex == 1 && categories.isEmpty) {
      fetchCategories();
    }
    if (newIndex == 2) {
      fetchFavorites();
    }
    emit(BottomNavUpdateIndexState());
  }

  Future<void> ftechHomeData() async {
    homeDataLoading = true;
    emit(HomeDataLoadingState());
    final response =
        await _homeDataUsecase.call(params: CachedHelper.getData('token'));
    if (response is DataSuccess) {
      homeData = response.data;
      homeProducts = homeData!.products;
      homeBanners = homeData!.banners;
      emit(HomeDataSuccessState());
    } else {
      if (response is DataFailureDio) {
        emit(HomeDataErrorState(response.dioError.toString()));
      }
      emit(HomeDataErrorState(response.error ?? StringsManager.defaultError));
    }
    homeDataLoading = false;
    emit(HomeDataLoadingState());
  }

  Future<void> toggleFavorite({required ProductEntity product}) async {
    final newState = !product.inFavorites;
    product.inFavorites = newState;
    homeProducts.firstWhere((element) => element.id == product.id).inFavorites =
        newState;
    favorites.removeWhere((element) => element.id == product.id);
    emit(RealTimeToggleFavoriteState());
    final response = await _toggleFavoriteUsecase.call(params: {
      'productId': product.id,
      'token': CachedHelper.getData('token'),
    });
    if (response is DataFailure || response is DataFailureDio) {
      product.inFavorites = !newState;
      homeProducts
          .firstWhere((element) => element.id == product.id)
          .inFavorites = !newState;
      favorites.add(product);
      emit(RealTimeToggleFavoriteState());
      if (state is DataFailureDio) {
        emit(ToggleFavoriteErrorState(response.dioError.toString()));
      }
      emit(
        ToggleFavoriteErrorState(response.error ?? StringsManager.defaultError),
      );
    }
  }

  Future<void> fetchCategories() async {
    categoriesLoading = true;
    emit(CategoriesLoadingState());
    final response = await _categoriesUsecase.call();
    if (response is DataSuccess) {
      categories = response.data!;
      emit(CategoriesSuccessState());
    } else {
      if (response is DataFailureDio) {
        emit(CategoriesErrorState(response.dioError.toString()));
      }
      emit(CategoriesErrorState(response.error ?? StringsManager.defaultError));
    }
    categoriesLoading = false;
    emit(CategoriesLoadingState());
  }

  Future<void> fetchFavorites() async {
    favoritesLoading = true;
    emit(FavoritesLoadingState());
    final response = await _fetchFavoritesUsecase.call(
      params: CachedHelper.getData('token'),
    );
    if (response is DataSuccess) {
      favorites = response.data!;
      emit(FavoritesSuccessState());
    } else {
      if (response is DataFailureDio) {
        emit(FavoritesErrorState(response.dioError.toString()));
      }
      emit(FavoritesErrorState(response.error ?? StringsManager.defaultError));
    }
    favoritesLoading = false;
    emit(FavoritesLoadingState());
  }
}
