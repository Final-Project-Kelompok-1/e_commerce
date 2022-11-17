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
                    SizedBox(height: AppDimen.h4),
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
                    SizedBox(height: AppDimen.h4),
                    SizedBox(
                      height: 20.h,
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,
                                  size: 15.sp, color: Colors.yellow.shade600),
                              SizedBox(width: AppDimen.w4),
                              Text("5.0", style: AppFont.componentSmall),
                            ],
                          ),
                          SizedBox(width: AppDimen.w12),
                          Text("25 Reviews", style: AppFont.componentSmall),
                          const Spacer(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
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
}
