import 'package:flutter/material.dart';

import '../../../config/config.dart';

class QuantityCheckoutProduct extends StatelessWidget {
  const QuantityCheckoutProduct({super.key});

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
          "1",
          style: AppFont.paragraphMedium.copyWith(
            color: const Color(0xff888888),
          ),
        ),
      ],
    );
  }
}
