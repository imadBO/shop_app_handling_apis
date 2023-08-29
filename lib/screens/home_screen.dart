import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/cubits/shop_cubit.dart';
import 'package:shop_app_handeling_apis/cubits/shop_states.dart';
import 'package:shop_app_handeling_apis/widgets/home/banners_slider.dart';
import 'package:shop_app_handeling_apis/widgets/home/product_item.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        ShopCubit shopCubit = ShopCubit.get(context);
        return shopCubit.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VisibilityDetector(
                      key: const Key('visibility-key'),
                      onVisibilityChanged: (VisibilityInfo info) {
                        shopCubit.updateAutoPlay(!(info.visibleFraction == 0));
                      },
                      child: BannersSlider(shopCubit: shopCubit),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Text(
                        'Products',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 1/1.5,
                      ),
                      itemBuilder: (context, index) {
                        var prodruct =
                            shopCubit.homeResponseModel!.data.products[index];
                        return ProductItem(
                          image: prodruct.image,
                          title: prodruct.name,
                          price: prodruct.price,
                          oldPrice:prodruct.oldPrice,
                          discount: prodruct.discount,
                        );
                      },
                      itemCount:
                          shopCubit.homeResponseModel!.data.products.length,
                    ),
                  ],
                ),
              );
      },
    );
  }
}
