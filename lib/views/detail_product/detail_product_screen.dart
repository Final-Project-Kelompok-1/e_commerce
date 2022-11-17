import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';

class DetailProduct extends StatelessWidget {
  final Product product;
  const DetailProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 330.h,
              child: Stack(
                children: [
                  _headerProduct(context),
                  Positioned(
                    top: 70.h,
                    child: SizedBox(
                      height: 270.h,
                      width: 250.w,
                      child: CachedNetworkImage(
                        imageUrl: product.image,
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimen.h16),
            _detailProduct(),
            SizedBox(height: AppDimen.h40),
            _buttonChartAndWishlist(),
            SizedBox(height: AppDimen.h16),
          ],
        ),
      ),
    );
  }

  Widget _headerProduct(BuildContext context) {
    return Container(
      height: 280.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.mainColor, AppColor.thirdColor],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppDimen.h32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                  Container(),
                ],
              ),
              SizedBox(height: AppDimen.h10),
              Row(
                children: [
                  SizedBox(width: 200.w),
                  const Spacer(),
                  SizedBox(
                    width: 120.w,
                    height: 150.h,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            product.productCategory.name,
                            textAlign: TextAlign.right,
                            style: AppFont.paragraphSmall.copyWith(
                              color: const Color(0xffD9D9D9),
                            ),
                          ),
                          SizedBox(height: AppDimen.h8),
                          SizedBox(
                            height: 50.h,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(product.name,
                                  textAlign: TextAlign.right,
                                  style: AppFont.paragraphLargeBold),
                            ),
                          ),
                          SizedBox(height: AppDimen.h16),
                          Text(
                            "Price",
                            textAlign: TextAlign.right,
                            style: AppFont.paragraphSmall.copyWith(
                              color: const Color(0xffD9D9D9),
                            ),
                          ),
                          SizedBox(height: AppDimen.h8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              "Rp ${product.harga}",
                              textAlign: TextAlign.right,
                              style: AppFont.paragraphLargeBold.copyWith(
                                color: AppColor.mainColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailProduct() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
                  RatingBarIndicator(
                    itemSize: 16.sp,
                    rating: double.parse('5.0'),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.yellow.shade600,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    '5.0',
                    style: AppFont.paragraphMedium
                        .copyWith(color: Colors.yellow.shade600),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      "25 reviews",
                      style: AppFont.paragraphMedium.copyWith(
                        color: const Color(0xff888888),
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right, size: 16.sp),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppDimen.h32),
          Text(product.name, style: AppFont.componentLarge),
          SizedBox(height: AppDimen.h20),
          Text(
            product.deskripsi,
            textAlign: TextAlign.justify,
            style: AppFont.paragraphSmall.copyWith(
              color: const Color(0xff888888),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonChartAndWishlist() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWidget(
            buttonText: 'ADD TO CART',
            height: 50,
            width: 240,
            radius: 10,
            fontSize: 14,
            onpressed: () {},
          ),
          IconButtonWidget(
            iconAsset: 'assets/icons/shopping_bag.svg',
            height: 55,
            width: 50,
            radius: 100,
            widthIcon: 30,
            heightIcon: 30,
            onpressed: () {},
          ),
        ],
      ),
    );
  }
}
