import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.productsList,
    required this.favoriteCallback,
    this.shrinkWrap = false,
    this.physics,
  });
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final List productsList;
  final Future<void> Function({required ProductEntity product})?
      favoriteCallback;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1 / 1.5,
        mainAxisExtent: 300,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          product: productsList[index],
          favoriteCallback: favoriteCallback,
        );
      },
      itemCount: productsList.length,
    );
  }
}
