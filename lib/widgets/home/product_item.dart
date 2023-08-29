import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });

  final String image;
  final String title;
  final double price;
  final double oldPrice;
  final double discount;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          color: Colors.white,
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      height: 200,
                      fit: BoxFit.cover,
                      imageUrl: image,
                      placeholder: (context, url) =>
                          Image.asset('assets/images/placeholder.png'),
                      errorWidget: (context, url, error) =>
                          Image.asset('assets/images/error_image.png'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Visibility(
                      visible: discount != 0.0,
                      child: Text(
                        '\$${oldPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          decorationThickness: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Positioned(
          top: 10,
          right: 10,
          child: CircleAvatar(
            radius: 20,
            child: Icon(Icons.favorite_outline),
          ),
        ),
      ],
    );
  }
}
