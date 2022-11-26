import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/view_models/checkout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../config/config.dart';
import '../../../models/product_model.dart';

class CheckoutProductNow extends StatelessWidget {
  final Product product;
  const CheckoutProductNow({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 115.h,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            Expanded(
              flex: 1,
              child: _cartImage(product.image),
            ),
            Expanded(
              flex: 1,
              child: _cartDetailProduct(
                  productName: product.name, harga: product.harga),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cartDetailProduct({required String productName, required int harga}) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(productName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppFont.paragraphSmallBold),
          SizedBox(height: 8.h),
          Text(
            "Rp $harga",
            style:
                AppFont.paragraphSmallBold.copyWith(color: AppColor.mainColor),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 8.h),
          Consumer<CheckoutViewModel>(
              builder: (context, checkout, _) => Text(
                  "Quantity : ${checkout.quantityProduct}",
                  style: AppFont.paragraphMedium)),
        ],
      ),
    );
  }

  Widget _cartImage(String urlImage) {
    return CachedNetworkImage(
      imageUrl: urlImage,
      errorWidget: (context, url, error) {
        return const Center(
          child: Icon(Icons.error, color: Colors.red),
        );
      },
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      fit: BoxFit.fill,
    );
  }
}
