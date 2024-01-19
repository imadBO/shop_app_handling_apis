import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_item_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/add_remove_cart_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/delete_cart_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/get_carts_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/update_cart_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_states.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit(
    this._getCartsUsecase,
    this._updateCartUsecase,
    this._addToCartsUsecase,
    this._deleteCartsUsecase,
  ) : super(InitialCartState());
  final GetCartsUsecase _getCartsUsecase;
  final UpdateCartUsecase _updateCartUsecase;
  final AddToCartsUsecase _addToCartsUsecase;
  final DeleteFromCartsUsecase _deleteCartsUsecase;
  bool cartsLoading = false;
  bool addingRemovingLoading = false;
  bool updating = false;
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
    updating = true;
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
      updating = false;
      emit(CartUpdateSuccessState());
    } else {
      item.quantity = oldQuantity;
      updating = false;
      if (response is DataFailureDio) {
        emit(CartUpdateErrorState(response.dioError.toString()));
      }
      emit(
        CartUpdateErrorState(response.error ?? StringsManager.defaultError),
      );
    }
  }

  Future<void> addToCart(ProductEntity product, int quantity) async {
    addingRemovingLoading = true;
    emit(AdiingRemovingLoadingState());
    product.inCart = !product.inCart;
    emit(RealTimeAddToCartUpdate());
    final response = await _addToCartsUsecase.call(params: {
      'productId': product.id,
      'token': CachedHelper.getData('token'),
    });
    if (response is DataSuccess) {
      emit(AddToCartSuccessState());
      if (quantity > 1) {
        final updateResponse = await _updateCartUsecase.call(params: {
          'token': CachedHelper.getData('token'),
          'cartId': response.data,
          'quantity': quantity,
        });
        if (updateResponse is DataSuccess) {
          emit(CartUpdateSuccessState());
        } else {
          if (response is DataFailureDio) {
            emit(CartUpdateErrorState(response.dioError.toString()));
          }
          emit(
            CartUpdateErrorState(response.error ?? StringsManager.defaultError),
          );
        }
      }
    } else {
      product.inCart = !product.inCart;
      if (response is DataFailureDio) {
        emit(AddToCartErrorState(response.dioError.toString()));
      }
      emit(
        AddToCartErrorState(response.error ?? StringsManager.defaultError),
      );
    }
    addingRemovingLoading = false;
    emit(AdiingRemovingLoadingState());
  }

  Future<void> removeCart(CartItemEntity cart, BuildContext context) async {
    final homeCubit = HomeCubit.get(context);
    cartEntity!.cartItems.removeWhere((item) => item.id == cart.id);
    homeCubit.homeData?.products
        .firstWhere((product) => product.id == cart.product.id)
        .inCart = false;
    emit(RealTimeRemoveFromCartUpdate());
    final response = await _deleteCartsUsecase.call(params: {
      'token': CachedHelper.getData('token'),
      'cartId': cart.id,
    });
    if (response is DataSuccess) {
      cartEntity!.subTotal = response.data!.subTotal.toDouble();
      cartEntity!.total = response.data!.total.toDouble();
      emit(RemoveFromCartSuccessState());
    } else {
      cartEntity!.cartItems.add(cart);
      homeCubit.homeData?.products
          .firstWhere((product) => product.id == cart.product.id)
          .inCart = true;
      if (response is DataFailureDio) {
        emit(RemoveFromCartErrorState(response.error.toString()));
      }
      emit(RemoveFromCartErrorState(response.error!));
    }
  }
}
