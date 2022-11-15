import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/utils/utils.dart';
import 'package:e_commerce/views/detail_product/detail_product_screen.dart';
import 'package:e_commerce/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(),
            SizedBox(height: AppDimen.h12),
            _buttonCategory(),
            SizedBox(height: AppDimen.h12),
            _categories(),
            SizedBox(height: AppDimen.h12),
            _listProduct(),
            SizedBox(
              height: AppDimen.h36,
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 240.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.mainColor, AppColor.thirdColor],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 12.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 22.sp,
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 22.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppDimen.h10),
            _listBanner(),
            SizedBox(height: AppDimen.h30),
          ],
        ),
      ),
    );
  }

  Widget _buttonCategory() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ButtonWidget(
            buttonText: "Popular",
            height: 40,
            width: 147,
            radius: 10,
            onpressed: () {},
          ),
          ButtonWidget(
            buttonText: "New",
            height: 40,
            width: 147,
            radius: 10,
            onpressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _categories() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: AppFont.paragraphLargeBold
                    .copyWith(color: AppColor.secondColor),
              ),
              Text(
                "See all",
                style: AppFont.paragraphMedium
                    .copyWith(color: AppColor.secondColor),
              ),
            ],
          ),
          SizedBox(
            height: AppDimen.h10,
          ),
          Container(
            height: 100.h,
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Align(
                child: _listCategory(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listCategory() {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(width: AppDimen.w8),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 60.w,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10.sp),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 35.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: AppDimen.h4),
                      SizedBox(
                        height: 20.h,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            "Gadget",
                            style: AppFont.paragraphSmall.copyWith(
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _listProduct() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                NavigatorFadeTransitionHelper(
                  child: const DetailProduct(),
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
                        color: Colors.grey[50],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://i.ibb.co/MRFbzFX/jade-knight-removebg-preview.png',
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
                              "Action Figure Honkai Impact - Li Sushang",
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
                              "Rp. 2.500.000",
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
                                        size: 15.sp,
                                        color: Colors.yellow.shade600),
                                    SizedBox(width: AppDimen.w4),
                                    Text("5.0", style: AppFont.componentSmall),
                                  ],
                                ),
                                SizedBox(width: AppDimen.w12),
                                Text("25 Reviews",
                                    style: AppFont.componentSmall),
                                const Spacer(),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                      onTap: () {},
                                      child:
                                          Icon(Icons.more_vert, size: 15.sp)),
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
        },
      ),
    );
  }

  Widget _listBanner() {
    return SizedBox(
      height: 95.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(width: AppDimen.w16),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            width: 230.w,
            height: 95.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 60.w,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    width: 155.w,
                    height: 95.h,
                  ),
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    width: 135.w,
                    height: 95.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
