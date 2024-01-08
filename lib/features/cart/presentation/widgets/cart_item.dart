import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/resources/assets_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/entities/cart_item_entity.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_states.dart';

class CartItem extends StatelessWidget {
  final CartItemEntity cartItemEntity;
  const CartItem({super.key, required this.cartItemEntity});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 190,
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: cartItemEntity.product.image,
            placeholder: (context, url) =>
                Image.asset(AssetsManager.placeholderImage),
            errorWidget: (context, url, error) =>
                Image.asset(AssetsManager.errorImage),
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 3),
                    Expanded(
                      flex: 7,
                      child: Text(
                        cartItemEntity.product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),
                    const Expanded(
                      flex: 1,
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      '\$${cartItemEntity.product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const Spacer(),
                    QuantityControlPanel(
                      cartItemEntity: cartItemEntity,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityControlPanel extends StatelessWidget {
  final CartItemEntity cartItemEntity;
  const QuantityControlPanel({
    super.key,
    required this.cartItemEntity,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartStates>(
        listener: (context, state) {},
        builder: (BuildContext context, Object? state) {
          final cartCubit = CartCubit.get(context);
          return Row(
            children: [
              IconButton(
                onPressed: () {
                  if (cartItemEntity.quantity > 1) {
                    cartCubit.updateCart(
                      item: cartItemEntity,
                      newQuantity: cartItemEntity.quantity - 1,
                    );
                  }
                },
                icon: const Icon(Icons.remove),
                style: IconButton.styleFrom(
                  backgroundColor: ColorsManager.white,
                  foregroundColor: ColorsManager.primary,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: ColorsManager.grey, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(width: 3),
              Text(
                cartItemEntity.quantity.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 3),
              IconButton(
                onPressed: () {
                  cartCubit.updateCart(
                    item: cartItemEntity,
                    newQuantity: cartItemEntity.quantity + 1,
                  );
                },
                icon: const Icon(Icons.add),
                style: IconButton.styleFrom(
                  backgroundColor: ColorsManager.white,
                  foregroundColor: ColorsManager.green,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(color: ColorsManager.green, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
