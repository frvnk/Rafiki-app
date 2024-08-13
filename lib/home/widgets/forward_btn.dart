import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class ForwardBtn extends StatelessWidget {
  final Function() onTap;
  const ForwardBtn({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(15)
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}