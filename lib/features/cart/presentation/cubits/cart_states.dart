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

class AddRemoveCartSuccessState extends CartStates {}

class AddRemoveCartErrorState extends CartStates {
  final String error;
  AddRemoveCartErrorState(this.error);
}

class RealTimeAddRemoveUpdate extends CartStates {}

class AdiingRemovingLoadingState extends CartStates {}
