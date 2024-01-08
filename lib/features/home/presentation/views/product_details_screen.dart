import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/cart_management_bar.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/images_slider.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/price_panel.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringsManager.productDetailsScreenTitle),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImagesSlider(
                    images: product.images.isNotEmpty
                        ? product.images
                        : [product.image],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  PricePanel(
                    price: product.price,
                    oldPrice: product.oldPrice,
                    discount: product.discount,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 2, 16, 80),
                    child: Text(product.description),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: CartManagementBar(product: product),
            ),
          ],
        ),
      ),
    );
  }
}
