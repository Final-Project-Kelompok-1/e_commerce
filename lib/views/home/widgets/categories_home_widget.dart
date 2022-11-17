import 'package:e_commerce/models/category_icon_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../config/config.dart';

class CategoriesHomeWidget extends StatelessWidget {
  const CategoriesHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                style: AppFont.paragraphLarge
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "See all",
                  style: AppFont.paragraphLarge
                      .copyWith(color: AppColor.secondColor),
                ),
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
            child: Align(
              child: _listCategory(),
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
        separatorBuilder: (context, index) => SizedBox(width: AppDimen.w8),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          final data = CategoryIconModel.categoriesIcon[index];

          return SizedBox(
            width: 50.w,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(100.sp),
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
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: data.color.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: SvgPicture.asset(data.assetIcon,
                            width: 20.w, height: 20.h),
                      ),
                      SizedBox(height: AppDimen.h4),
                      SizedBox(
                        height: 20.h,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            data.name,
                            style: AppFont.paragraphSmall
                                .copyWith(fontWeight: FontWeight.w500),
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
}
