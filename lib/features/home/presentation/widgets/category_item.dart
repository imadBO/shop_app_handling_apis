import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.image, required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.3,
                width: double.infinity,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              // CachedNetworkImage(
              //   height: MediaQuery.of(context).size.width * 0.3,
              //   width: double.infinity,
              //   fit: BoxFit.cover,
              //   imageUrl: image,
              //   placeholder: (context, url) =>
              //       Image.asset(AssetsManager.placeholderImage),
              //   errorWidget: (context, url, error) =>
              //       Image.asset(AssetsManager.errorImage),
              // ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.width * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.3, 1],
                colors: [
                  ColorsManager.primary
                      .withOpacity(0.7), // Darker color at the bottom
                  ColorsManager.transparent, // Transparent in the middle
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
