import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
              child: CachedNetworkImage(
                height: MediaQuery.of(context).size.width * 0.3,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl: image,
                placeholder: (context, url) =>
                    Image.asset('assets/images/placeholder.png'),
                errorWidget: (context, url, error) =>
                    Image.asset('assets/images/error_image.png'),
              ),
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
                colors: [
                  Colors.black.withOpacity(0.7), // Darker color at the bottom
                  Colors.transparent, // Transparent in the middle
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