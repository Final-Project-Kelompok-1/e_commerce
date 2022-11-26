import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';

class ListCart extends StatelessWidget {
  const ListCart({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
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
                  Expanded(
                    flex: 1,
                    child: _checkBoxButton(),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    flex: 5,
                    child: _cartImage(),
                  ),
                  Expanded(
                    flex: 6,
                    child: _cartDetailProduct(),
                  ),
                  Expanded(
                    flex: 1,
                    child: _deleteCart(),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 24.h),
        itemCount: 3);
  }

  _checkBoxButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Icon(Icons.check, color: Colors.grey, size: 20.sp),
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _deleteCart() {
  return SizedBox(
    width: 30.w,
    height: 30.h,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onLongPress: () {},
          child: Icon(Icons.delete, color: Colors.grey, size: 24.sp),
        ),
      ),
    ),
  );
}

Widget _cartDetailProduct() {
  return Padding(
    padding: EdgeInsets.only(left: 10.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Realme GT 2 Pro 5G 12/256GB",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppFont.paragraphSmallBold),
        SizedBox(height: 8.h),
        Text(
          "Rp 750000",
          style: AppFont.paragraphSmallBold.copyWith(color: AppColor.mainColor),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Icon(Icons.remove, size: 15.sp),
                  ),
                ),
              ),
            ),
            SizedBox(width: 15.w),
            Text("1", style: AppFont.paragraphMediumBold),
            SizedBox(width: 15.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Icon(Icons.add, size: 15.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _cartImage() {
  return CachedNetworkImage(
    imageUrl:
        "https://api1.sib3.nurulfikri.com/storage/product//S3a76cNkebyQh3DUxQVJLXL14mPpCK1sm7a2wX2z.png",
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
