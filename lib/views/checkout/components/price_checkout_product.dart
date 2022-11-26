import 'package:e_commerce/view_models/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/theme.dart';

class PriceCheckoutProduct extends StatelessWidget {
  const PriceCheckoutProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total", style: AppFont.paragraphMediumBold),
        Consumer<CheckoutViewModel>(
          builder: (context, checkout, _) => Text(
            checkout.sumPriceProduct.toString(),
            style:
                AppFont.paragraphMediumBold.copyWith(color: AppColor.mainColor),
          ),
        ),
      ],
    );
  }
}
