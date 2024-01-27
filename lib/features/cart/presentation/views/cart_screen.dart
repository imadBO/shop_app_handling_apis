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
        if (state is RemoveFromCartErrorState) {
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
            : cartCubit.cartEntity == null ||
                    cartCubit.cartEntity!.cartItems.isEmpty
                ? const Center(
                    child: Text(StringsManager.emptyCartLabel),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CartItem(
                              cartItemEntity:
                                  cartCubit.cartEntity!.cartItems[index],
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
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: MaterialButton(
                            color: const Color.fromRGBO(0, 0, 0, 1),
                            textColor: ColorsManager.white,
                            minWidth: double.infinity,
                            height: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            onPressed: () {},
                            child: Text(
                              '${StringsManager.checkOutLabel}\t\t\$${cartCubit.cartEntity!.total.toStringAsFixed(2)}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
      },
    );
  }
}
