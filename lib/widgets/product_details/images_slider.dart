import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class ImagesSlider extends StatelessWidget {
  ImagesSlider({
    super.key,
    required this.images,
  });

  
  final PageController pageController = PageController();
  final List<dynamic> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: PageView.builder(
            controller: pageController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl: images[index],
                  placeholder: (context, file) => Image.asset(
                    'assets/images/placeholder.png',
                  ),
                  errorWidget: (context, file, error) =>
                      Image.asset(
                    'assets/images/error_image.png',
                  ),
                ),
              );
            },
            itemCount: images.length,
          ),
        ),
        const SizedBox(height: 3),
        SmoothPageIndicator(
          controller: pageController,
          count: images.length,
          effect: const SlideEffect(
            radius: 4,
            dotWidth: 8,
            dotHeight: 8,
            spacing: 3,
            activeDotColor: Colors.black,
          ),
        ),
      ],
    );
  }
}