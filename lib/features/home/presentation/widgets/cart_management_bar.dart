import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';

class CartManagementBar extends StatelessWidget {
  const CartManagementBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 32,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 5,
      ),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
        color: ColorsManager.primary,
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            height: 50,
            width: (MediaQuery.of(context).size.width - 32) * 0.35,
            decoration: const ShapeDecoration(
              shape: StadiumBorder(),
              color: ColorsManager.darkGrey,
            ),
            child: const Row(
              children: [
                Spacer(),
                Icon(
                  Icons.remove,
                  color: ColorsManager.white,
                ),
                Spacer(),
                Text(
                  '1',
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.add,
                  color: ColorsManager.white,
                ),
                Spacer(),
              ],
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 50,
              child: FilledButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    ColorsManager.white,
                  ),
                  shape: MaterialStatePropertyAll(StadiumBorder()),
                ),
                child: const Text(
                  StringsManager.addToCartLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorsManager.primary,
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
