import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_item_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_states.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';

class CartManagementBar extends StatefulWidget {
  const CartManagementBar({
    super.key,
    required this.product,
  });
  final ProductEntity product;

  @override
  State<CartManagementBar> createState() => _CartManagementBarState();
}

class _CartManagementBarState extends State<CartManagementBar> {
  int quantity = 1;
  bool loading = false;
  CartItemEntity? cartItem;

  @override
  void initState() {
    if (widget.product.inCart) {
      loading = true;
      final cartCubit = CartCubit.get(context);
      cartCubit.getCarts().then((value) {
        cartItem = cartCubit.cartEntity?.cartItems
            .firstWhere((element) => element.product.id == widget.product.id);
        quantity = cartItem?.quantity ?? 1;
        setState(() {
          loading = false;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 32,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: ColorsManager.primary,
      ),
      padding: const EdgeInsets.all(5),
      child: BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {
          if (state is AddToCartSuccessState ||
              state is CartUpdateSuccessState) {
            Fluttertoast.showToast(
              msg: StringsManager.cartSuccessFullyUpdated,
              backgroundColor: ColorsManager.green,
              textColor: ColorsManager.white,
            );
          }
          if (state is AddToCartErrorState) {
            Fluttertoast.showToast(
              msg: state.error,
              backgroundColor: ColorsManager.error,
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
        builder: (BuildContext context, Object? state) {
          final cartCubit = CartCubit.get(context);
          return Row(
            children: [
              Container(
                height: 50,
                width: (MediaQuery.of(context).size.width - 32) * 0.35,
                decoration: const ShapeDecoration(
                  shape: StadiumBorder(),
                  color: ColorsManager.darkGrey,
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity -= 1;
                          }
                        });
                      },
                      child: const Icon(
                        Icons.remove,
                        color: ColorsManager.white,
                      ),
                    ),
                    const Spacer(),
                    loading
                        ? const SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(
                              color: ColorsManager.white,
                            ),
                          )
                        : Text(
                            quantity.toString(),
                            style: const TextStyle(
                              color: ColorsManager.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quantity += 1;
                        });
                      },
                      child: const Icon(
                        Icons.add,
                        color: ColorsManager.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      widget.product.inCart
                          ? cartCubit.updateCart(
                              item: cartItem!,
                              newQuantity: quantity,
                            )
                          : cartCubit.addToCart(widget.product, quantity);
                    },
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        ColorsManager.white,
                      ),
                      shape: MaterialStatePropertyAll(StadiumBorder()),
                    ),
                    child: cartCubit.addingRemovingLoading || cartCubit.updating
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.primary,
                            ),
                          )
                        : Text(
                            widget.product.inCart
                                ? StringsManager.updateCartLabel
                                : StringsManager.addToCartLabel,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: ColorsManager.primary,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
