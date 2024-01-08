import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/cart/data/data_sources/remote/cart_service.dart';
import 'package:shop_app_handeling_apis/features/cart/data/models/cart_model.dart';
import 'package:shop_app_handeling_apis/features/cart/data/models/update_cart_model.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/update_cart_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService _cartService;
  CartRepositoryImpl(this._cartService);
  @override
  Future<DataState<CartModel>> getCarts({required String token}) async {
    try {
      final response = await _cartService.getCarts(token: token);
      if (response.data['status'] == true) {
        // print(response.data['data']);
        return DataSuccess(CartModel.fromJSON(response.data['data']));
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      if (error is DioException) {
        return DataFailureDio(error);
      }
      return DataFailure(error.toString());
    }
  }

  @override
  Future<DataState<UpdateCartEntity>> updateCart({
    required String token,
    required int quantity,
    required int cartId,
  }) async {
    try {
      final response = await _cartService.updateCart(
        token: token,
        quantity: quantity,
        cartId: cartId,
      );
      if (response.data['status'] == true) {
        return DataSuccess(UpdateCartModel.fromJSON(response.data['data']));
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      if (error is DioException) {
        return DataFailureDio(error);
      }
      return DataFailure(error.toString());
    }
  }

  @override
  Future<DataState<int>> addOrRemoveCart({
    required int productId,
    required String token,
  }) async {
    try {
      final response = await _cartService.addOrRemoveCart(
        productId: productId,
        token: token,
      );
      if (response.data['status'] == true) {
        return DataSuccess(response.data['data']['id']);
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      if (error is DioException) {
        return DataFailureDio(error);
      }
      return DataFailure(error.toString());
    }
  }
}
