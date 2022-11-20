import 'package:e_commerce/view_models/category_product_view_model.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../config/config.dart';

class HeaderCategory extends StatelessWidget {
  final String category;
  const HeaderCategory({super.key, required this.category});

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
              SizedBox(height: 30.h),
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
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.keyboard_arrow_left,
                          color: Colors.black,
                          size: 22.sp,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Category',
                    style: AppFont.paragraphLarge
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 25.w,
                      child: Stack(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/cart.svg',
                            color: Colors.black,
                            width: 22.w,
                            height: 22.h,
                          ),
                          Positioned(
                            left: 13.w,
                            child: Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                  100,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                category,
                style: AppFont.heading2.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30.h),
              _searchTextField(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return SizedBox(
      height: 40,
      child: Consumer<CategoryProductViewModel>(
        builder: (context, category, _) => TextField(
          controller: category.searchController,
          onChanged: (value) {
            category.search();
          },
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
      ),
    );
  }
}
