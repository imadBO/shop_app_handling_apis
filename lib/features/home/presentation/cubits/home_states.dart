abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class BottomNavUpdateIndexState extends HomeStates {}

class HomeDataSuccessState extends HomeStates {}

class HomeDataErrorState extends HomeStates {
  String error;
  HomeDataErrorState(this.error);
}

class HomeDataLoadingState extends HomeStates {}

class UpdateAutoPlayBannersState extends HomeStates {}

class UpdateActionsVisibilityState extends HomeStates {}

class ToggleFavoriteSuccessState extends HomeStates {}

class RealTimeToggleFavoriteState extends HomeStates {}

class ToggleFavoriteErrorState extends HomeStates {
  String error;
  ToggleFavoriteErrorState(this.error);
}

class CategoriesSuccessState extends HomeStates {}

class CategoriesErrorState extends HomeStates {
  final String error;
  CategoriesErrorState(this.error);
}

class CategoriesLoadingState extends HomeStates {}

class FavoritesSuccessState extends HomeStates {}

class FavoritesErrorState extends HomeStates {
  final String error;
  FavoritesErrorState(this.error);
}

class FavoritesLoadingState extends HomeStates {}

class ProductDetailsSuccessState extends HomeStates {}

class ProductDetailsErrorState extends HomeStates {
  final String error;
  ProductDetailsErrorState(this.error);
}

class ProductDetailsLoadingState extends HomeStates {}

class CategoryProductsSuccessState extends HomeStates {}

class CategoryProductsErrorState extends HomeStates {
  final String error;
  CategoryProductsErrorState(this.error);
}

class CategoryProductsLoadingState extends HomeStates {}
