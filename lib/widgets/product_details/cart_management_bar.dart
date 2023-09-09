import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black,
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            height: 50,
            width: (MediaQuery.of(context).size.width - 32) * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(94, 158, 158, 158),
            ),
            child: const Row(
              children: [
                Spacer(),
                Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                Spacer(),
                Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.add,
                  color: Colors.white,
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
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.white),
                ),
                child: const Text(
                  'ADD TO CART',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
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