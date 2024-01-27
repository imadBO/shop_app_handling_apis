import 'package:flutter/material.dart';

class FilledCircle extends StatelessWidget {
  const FilledCircle({
    super.key,
    required this.radius,
    required this.color,
  });
  final double radius;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
