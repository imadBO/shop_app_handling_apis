import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/assets_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/views/product_details_screen.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/favorite_button.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    this.favoriteCallback,
  });

  final ProductEntity product;
  final Future<void> Function({required ProductEntity product})?
      favoriteCallback;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Stack(
        children: [
          Card(
            color: ColorsManager.white,
            elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: ColorsManager.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        height: 200,
                        fit: BoxFit.cover,
                        imageUrl: product.image,
                        placeholder: (context, url) =>
                            Image.asset(AssetsManager.placeholderImage),
                        errorWidget: (context, url, error) =>
                            Image.asset(AssetsManager.errorImage),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      Visibility(
                        visible: product.discount != 0.0,
                        child: Text(
                          '\$${product.oldPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: ColorsManager.error,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: ColorsManager.error,
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
          Positioned(
            top: 10,
            right: 10,
            child: CircleAvatar(
              radius: 20,
              child: product.inFavorites
                  ? FavoriteButton(
                      icon: Icons.favorite,
                      callback: () {
                        favoriteCallback!(product: product);
                      },
                    )
                  : FavoriteButton(
                      icon: Icons.favorite_outline,
                      callback: () {
                        favoriteCallback!(product: product);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
