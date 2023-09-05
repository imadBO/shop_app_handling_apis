import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.icon, required this.callback});
  final IconData icon;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      icon: Icon(icon),
    );
  }
}
