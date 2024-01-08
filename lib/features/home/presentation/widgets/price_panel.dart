import 'package:flutter/material.dart';

class PricePanel extends StatelessWidget {
  const PricePanel({
    super.key,
    required this.price,
    this.oldPrice,
    this.discount,
  });

  final double price;
  final double? oldPrice;
  final double? discount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        children: [
          Text(
            '\$$price',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 8),
          Visibility(
            visible: discount != 0,
            child: Text(
              '\$$oldPrice',
              style: const TextStyle(
                color: Colors.grey,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.grey,
                decorationThickness: 2,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Visibility(
            visible: discount != 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey[300],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  '$discount%',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}