import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';
import '../../utils/utils.dart';
import '../detail_product/detail_product_screen.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  const ProductWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          NavigatorFadeTransitionHelper(
            child: DetailProduct(product: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(product.image),
                      fit: BoxFit.fill),
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 4.h, left: 12.w, right: 12.w, bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                      child: Text(
                        product.name,
                        style: AppFont.paragraphSmall
                            .copyWith(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      height: 20.h,
                      child: Text(
                        "Rp. ${product.harga}",
                        style: AppFont.paragraphSmall.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.red.shade600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    SizedBox(
                      height: 20.h,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15.sp, color: Colors.yellow.shade600),
                              SizedBox(width: 4.w),
                              Text("5.0", style: AppFont.componentSmall),
                            ],
                          ),
                          SizedBox(width: 12.w),
                          Text("25 Reviews", style: AppFont.componentSmall),
                          const Spacer(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                _modalAction(context, width);
                              },
                              child: Icon(Icons.more_vert, size: 15.sp),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _modalAction(BuildContext context, double width) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Center(
          child: Padding(
            padding: EdgeInsets.all(16.sp),
            child: Container(
              height: 210.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.grey[50],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 72.h,
                    width: width,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Color(0xffEDEDED), width: 2),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 16.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Product Action",
                              style: AppFont.paragraphLargeBold),
                          Material(
                            color: Colors.transparent,
                            child: IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close,
                                  size: 25, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 60.h,
                          width: width,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Color(0xffEDEDED), width: 2),
                            ),
                          ),
                          child: Text(
                            "Add to wishlist",
                            style: AppFont.paragraphMedium
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 60.h,
                          width: width,
                          child: Text(
                            "Add to cart",
                            style: AppFont.paragraphMedium
                                .copyWith(fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
