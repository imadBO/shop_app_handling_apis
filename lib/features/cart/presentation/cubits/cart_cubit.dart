import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_item_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/get_carts_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/update_cart_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit(
    this._getCartsUsecase,
    this._updateCartUsecase,
  ) : super(InitialCartState());
  final GetCartsUsecase _getCartsUsecase;
  final UpdateCartUsecase _updateCartUsecase;
  bool cartsLoading = false;
  CartEntity? cartEntity;

  static CartCubit get(context) => BlocProvider.of(context);

  Future<void> getCarts() async {
    cartsLoading = true;
    emit(CartsLoadingState());
    final response = await _getCartsUsecase.call(
      params: CachedHelper.getData('token'),
    );
    if (response is DataSuccess) {
      cartEntity = response.data;
      emit(CartsFetchedSuccessState());
    } else {
      if (response is DataFailureDio) {
        emit(CartsFetchedErrorState(response.dioError.toString()));
      }
      emit(
        CartsFetchedErrorState(response.error ?? StringsManager.defaultError),
      );
    }
    cartsLoading = false;
    emit(CartsLoadingState());
  }

  Future<void> updateCart({
    required CartItemEntity item,
    required int newQuantity,
  }) async {
    final int oldQuantity = item.quantity;

    item.quantity = newQuantity;
    emit(RealTimeQuantityUpdate());
    final response = await _updateCartUsecase.call(params: {
      'token': CachedHelper.getData('token'),
      'cartId': item.id,
      'quantity': newQuantity,
    });
    if (response is DataSuccess) {
      cartEntity!.subTotal = response.data!.subTotal.toDouble();
      cartEntity!.total = response.data!.total.toDouble();
      emit(CartUpdateSuccessState());
    } else {
      item.quantity = oldQuantity;
      if (response is DataFailureDio) {
        emit(CartUpdateErrorState(response.dioError.toString()));
      }
      emit(
        CartUpdateErrorState(response.error ?? StringsManager.defaultError),
      );
    }
  }
}
