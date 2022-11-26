import 'package:flutter/material.dart';

import '../../../config/config.dart';

class QuantityCartProduct extends StatelessWidget {
  const QuantityCartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Products",
          style: AppFont.paragraphMedium.copyWith(
            color: const Color(0xff888888),
          ),
        ),
        Text(
          "3",
          style: AppFont.paragraphMedium.copyWith(
            color: const Color(0xff888888),
          ),
        ),
      ],
    );
  }
}
