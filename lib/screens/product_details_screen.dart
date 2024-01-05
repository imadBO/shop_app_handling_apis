import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/gubits/shop_cubit.dart';
import 'package:shop_app_handeling_apis/gubits/shop_states.dart';
import 'package:shop_app_handeling_apis/widgets/product_details/cart_management_bar.dart';
import 'package:shop_app_handeling_apis/widgets/product_details/images_slider.dart';
import 'package:shop_app_handeling_apis/widgets/product_details/price_panel.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: BlocConsumer<ShopCubit, ShopStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          ShopCubit shopCubit = ShopCubit.get(context);
          return shopCubit.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImagesSlider(images: shopCubit.productDetailsResponse!.data!.images),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 2),
                              child: Text(
                                shopCubit.productDetailsResponse!.data!.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            PricePanel(
                              price: shopCubit.productDetailsResponse!.data!.price,
                              oldPrice: shopCubit.productDetailsResponse!.data!.oldPrice,
                              discount: shopCubit.productDetailsResponse!.data!.discount,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 2, 16, 80),
                              child: Text(
                                shopCubit.productDetailsResponse!.data!.description,
                                // style: const TextStyle(
                                //   fontSize: 20,
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Positioned(
                        bottom: 0,
                        child: CartManagementBar(),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
