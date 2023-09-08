abstract class ShopStates {}

class InitialShopState extends ShopStates {}

class BottomNavUpdateIndexState extends ShopStates {}

class LoadingState extends ShopStates {}

class AutoplayState extends ShopStates {}

class ActionsState extends ShopStates {}

class HomeDataFetchingSuccessStae extends ShopStates {}

class HomeDataFetchingErrorStae extends ShopStates {
  HomeDataFetchingErrorStae(this.error);
  final String error;
}

class CategoriesFetchingSuccessState extends ShopStates {}

class CategoriesFetchingErrorState extends ShopStates {
  CategoriesFetchingErrorState(this.error);
  final String error;
}

class SearchMatchesSuccessState extends ShopStates {
  SearchMatchesSuccessState(this.status, this.message);
  final bool status;
  final String? message;
}

class SearchMatchesErrorState extends ShopStates {
  SearchMatchesErrorState(this.error);
  final String error;
}

class ToggleFavoriteSuccessState extends ShopStates {
  ToggleFavoriteSuccessState(this.status, this.message);
  final bool status;
  final String? message;
}

class ToggleFavoriteErrorState extends ShopStates {
  ToggleFavoriteErrorState(this.error);
  final String error;
}

class RealTimeToggleFavoriteSuccessState extends ShopStates {}

class RealTimeToggleFavoriteErrorState extends ShopStates {}

class FetchFavoritesSuccessState extends ShopStates {
  FetchFavoritesSuccessState(this.status, this.message);
  final bool status;
  final String? message;
}

class FetchFavoritesErrorState extends ShopStates {
  FetchFavoritesErrorState(this.error);
  final String error;
}

class DeleteFavoriteSuccessState extends ShopStates {
  DeleteFavoriteSuccessState(this.status, this.message);
  final bool status;
  final String? message;
}

class DeleteFavoriteErrorState extends ShopStates {
  DeleteFavoriteErrorState(this.error);
  final String error;
}

class RealTimeDeleteFavoriteSuccessState extends ShopStates {}

class RealTimeDeleteFavoriteErrorState extends ShopStates {}
