import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;

  const SlideDots({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: isActive ? Colors.red[800] : Colors.grey,
      ),
    );
  }
}
