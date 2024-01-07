import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/assets_manager.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';

class BannersSlider extends StatelessWidget {
  const BannersSlider({
    super.key,
    required this.homeCubit,
  });

  final HomeCubit homeCubit;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: homeCubit.homeBanners
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: e.image,
                  placeholder: (context, file) =>
                      Image.asset(AssetsManager.placeholderImage),
                  errorWidget: (context, file, error) =>
                      Image.asset(AssetsManager.errorImage),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: MediaQuery.of(context).size.width * 0.6,
        viewportFraction: 0.85,
        autoPlay: homeCubit.shouldAutoPlay,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayInterval: const Duration(seconds: 2),
      ),
    );
  }
}
