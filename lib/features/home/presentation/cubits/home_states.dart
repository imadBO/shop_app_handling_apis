abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

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
