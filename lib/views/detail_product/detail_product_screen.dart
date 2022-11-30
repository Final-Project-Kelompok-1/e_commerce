import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/navigator/navigator.dart';
import 'package:e_commerce/view_models/wishlist_view_model.dart';
import 'package:e_commerce/views/review/review_screen.dart';
import 'package:e_commerce/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../config/config.dart';
import 'components/detail_components.dart';

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
            SizedBox(height: 16.h),
            _detailProduct(context),
            SizedBox(height: 40.h),
            _buttonChartAndWishlist(context),
            SizedBox(height: 16.h),
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
              SizedBox(height: 32.h),
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
              SizedBox(height: 10.h),
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
                          SizedBox(
                            height: 50.h,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(product.name,
                                  textAlign: TextAlign.right,
                                  style: AppFont.paragraphLargeBold),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            "Price",
                            textAlign: TextAlign.right,
                            style: AppFont.paragraphSmall.copyWith(
                              color: const Color(0xffD9D9D9),
                            ),
                          ),
                          SizedBox(height: 8.h),
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

  Widget _detailProduct(BuildContext context) {
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
                onTap: () {
                  Navigator.of(context).push(
                    NavigatorFadeTransitionHelper(
                      child: const ReviewScreen(),
                    ),
                  );
                },
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
          SizedBox(height: 32.h),
          Text(product.name, style: AppFont.componentLarge),
          SizedBox(height: 20.h),
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

  Widget _buttonChartAndWishlist(BuildContext context) {
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
            onpressed: () {
              _addToCartBottomSheet(context);
            },
          ),
          Consumer<WishListViewModel>(
            builder: (context, wishlist, _) => IconButtonWidget(
              iconAsset: 'assets/icons/shopping_bag.svg',
              height: 55,
              width: 50,
              radius: 100,
              widthIcon: 30,
              heightIcon: 30,
              onpressed: () async {
                try {
                  await wishlist
                      .postWishList(
                        idBarang: product.id,
                      )
                      .then(
                        (_) => Fluttertoast.showToast(
                            msg: 'Berhasil ditambahkan ke wishlist'),
                      );
                } catch (e) {
                  Fluttertoast.showToast(msg: e.toString());
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _addToCartBottomSheet(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.6),
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: ModalContainer(product: product),
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }
}
