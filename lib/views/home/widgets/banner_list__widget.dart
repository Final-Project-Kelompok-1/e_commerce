import 'package:e_commerce/models/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';

class BannerListWidget extends StatelessWidget {
  const BannerListWidget({super.key});

  @override
  Widget build(BuildContext context) {
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

  Widget _listBanner() {
    return SizedBox(
      height: 75.h,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => SizedBox(width: AppDimen.w16),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: BannerModel.banners.length,
        itemBuilder: (context, index) {
          final data = BannerModel.banners[index];
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(data.assetImage),
              ),
            ),
            width: 140.w,
            height: 75.h,
            child: Text(
              data.name,
              style:
                  AppFont.paragraphLarge.copyWith(fontWeight: FontWeight.w600),
            ),
          );
        },
      ),
    );
  }
}
