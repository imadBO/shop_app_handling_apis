import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_states.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {
        if (state is CartsFetchedErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: ColorsManager.error,
            textColor: ColorsManager.white,
          );
        }
        if (state is CartUpdateSuccessState) {
          Fluttertoast.showToast(
            msg: state.message,
            backgroundColor: ColorsManager.green,
            textColor: ColorsManager.white,
          );
        }
        if (state is CartUpdateErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: ColorsManager.error,
            textColor: ColorsManager.white,
          );
        }
      },
      builder: (context, state) {
        final cartCubit = CartCubit.get(context);
        return cartCubit.cartsLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.primary,
                ),
              )
            : cartCubit.cartEntity == null
                ? const Center(
                    child: Text(StringsManager.emptyCartLabel),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return CartItem(
                        cartItemEntity: cartCubit.cartEntity!.cartItems[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1.5,
                          color: ColorsManager.lightGrey,
                        ),
                      );
                    },
                    itemCount: cartCubit.cartEntity!.cartItems.length,
                  );
      },
    );
  }
}
