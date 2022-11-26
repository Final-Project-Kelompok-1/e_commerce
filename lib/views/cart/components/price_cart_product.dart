import 'package:flutter/material.dart';

import '../../../config/theme/theme.dart';

class PriceCartProduct extends StatelessWidget {
  const PriceCartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total", style: AppFont.paragraphMediumBold),
        Text(
          "Rp 250000",
          style:
              AppFont.paragraphMediumBold.copyWith(color: AppColor.mainColor),
        ),
      ],
    );
  }
}
