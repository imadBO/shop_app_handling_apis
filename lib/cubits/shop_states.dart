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
