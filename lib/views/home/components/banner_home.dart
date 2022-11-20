import 'package:e_commerce/models/banner_model.dart';
import 'package:e_commerce/utils/navigator/navigator.dart';
import 'package:e_commerce/views/category/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';

class BannerList extends StatelessWidget {
  const BannerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.mainColor, AppColor.mainColor, AppColor.thirdColor],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h, bottom: 12.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(100),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 22.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18.h),
              _searchTextField(),
              SizedBox(height: 36.h),
              _listBanner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listBanner() {
    return SizedBox(
      height: 75.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(width: 16.w),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: BannerModel.banners.length,
        itemBuilder: (context, index) {
          final data = BannerModel.banners[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                NavigatorFadeTransitionHelper(
                  child: CategoryScreen(
                      categoryName: data.name, displayCategoryName: data.name),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(data.assetImage),
                ),
              ),
              width: 145.w,
              height: 75.h,
              child: Text(
                data.name,
                style: AppFont.paragraphLarge
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _searchTextField() {
    return SizedBox(
      height: 40,
      child: TextField(
        readOnly: true,
        onChanged: (value) {},
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.search, color: Colors.black87),
            ),
            contentPadding: EdgeInsets.only(left: 20.w, top: 5, right: 20.h),
            hintStyle:
                AppFont.paragraphSmall.copyWith(color: Colors.grey.shade700),
            hintText: "Search Product Name",
            filled: true,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            fillColor: Colors.white),
      ),
    );
  }
}
