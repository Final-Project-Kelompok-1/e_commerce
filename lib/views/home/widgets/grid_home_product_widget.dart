import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';
import '../../widgets/widgets.dart';

class GridHomeProductWidget extends StatelessWidget {
  final Function onTap;
  final String productCategory;
  final List<Product> product;
  const GridHomeProductWidget(
      {super.key,
      required this.onTap,
      required this.productCategory,
      required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          titleCategory(),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: product.length < 2 ? product.length : 2,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.5,
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12),
            itemBuilder: (context, index) {
              final data = product[index];
              return ProductWidget(product: data);
            },
          ),
        ],
      ),
    );
  }

  Widget titleCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          productCategory,
          style: AppFont.paragraphLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: () {
            onTap;
          },
          child: Text(
            "See all",
            style: AppFont.paragraphLarge.copyWith(color: AppColor.secondColor),
          ),
        ),
      ],
    );
  }
}
