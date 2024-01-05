import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/gubits/shop_cubit.dart';

class BannersSlider extends StatelessWidget {
  const BannersSlider({
    super.key,
    required this.shopCubit,
  });

  final ShopCubit shopCubit;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: shopCubit.homeResponseModel!.data.banners
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: e.image!,
                  placeholder: (context, file) => Image.asset(
                      'assets/images/placeholder.png'),
                  errorWidget: (context, file, error) =>
                      Image.asset(
                          'assets/images/error_image.png'),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width * 0.6,
        viewportFraction: 0.85,
        autoPlay: shopCubit.shouldAutoPlay,
        autoPlayAnimationDuration:
            const Duration(milliseconds: 800),
        autoPlayInterval: const Duration(seconds: 2),
      ),
    );
  }
}