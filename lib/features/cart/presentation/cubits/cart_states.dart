import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';

abstract class CartStates {}

class InitialCartState extends CartStates {}

class CartsFetchedSuccessState extends CartStates {}

class CartsFetchedErrorState extends CartStates {
  final String error;
  CartsFetchedErrorState(this.error);
}

class CartsLoadingState extends CartStates {}

class CartUpdateSuccessState extends CartStates {
  String message = StringsManager.cartSuccessFullyUpdated;
}

class CartUpdateErrorState extends CartStates {
  final String error;
  CartUpdateErrorState(this.error);
}

class RealTimeQuantityUpdate extends CartStates {}

class AddToCartSuccessState extends CartStates {}

class AddToCartErrorState extends CartStates {
  final String error;
  AddToCartErrorState(this.error);
}

class RealTimeAddToCartUpdate extends CartStates {}

class AdiingRemovingLoadingState extends CartStates {}

class RemoveFromCartSuccessState extends CartStates {}

class RemoveFromCartErrorState extends CartStates {
  final String error;
  RemoveFromCartErrorState(this.error);
}

class RealTimeRemoveFromCartUpdate extends CartStates {}
