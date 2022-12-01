import 'dart:math';

import 'package:e_commerce/config/config.dart';
import 'package:e_commerce/view_models/review_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.keyboard_arrow_left),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Review Product",
          style: AppFont.paragraphLarge.copyWith(fontWeight: FontWeight.w500),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[50],
        elevation: 0.5,
        actions: [
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow.shade700, size: 20.sp),
              SizedBox(width: 4.w),
              Text(
                "4.6",
                style: AppFont.paragraphLarge
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 16.w),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 30.h),
              _numberRatings(),
              SizedBox(height: 40.h),
              _listReviews(),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _numberRatings() {
    return SizedBox(
      height: 135.h,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Consumer<ReviewViewModel>(
          builder: (context, review, _) => Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 150.h,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Color(0xFFEDEDED), width: 1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: review.averageSumRating
                                    .toStringAsPrecision(2)
                                    .toString(),
                                style: AppFont.heading1),
                            TextSpan(
                                text: ' / 5', style: AppFont.paragraphMedium),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text("25 Reviews", style: AppFont.paragraphMedium),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ratingNumber(5.0, review.fiveRatingReviews.length,
                        review.averageRating5),
                    SizedBox(height: 8.h),
                    _ratingNumber(4.0, review.fourRatingReviews.length,
                        review.averageRating4),
                    SizedBox(height: 8.h),
                    _ratingNumber(3.0, review.threeRatingReviews.length,
                        review.averageRating3),
                    SizedBox(height: 8.h),
                    _ratingNumber(2.0, review.twoRatingReviews.length,
                        review.averageRating2),
                    SizedBox(height: 8.h),
                    _ratingNumber(1.0, review.oneRatingReviews.length,
                        review.averageRating1),
                    SizedBox(height: 8.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ratingNumber(
      double rating, int jumlahReview, double percentageRating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RatingBarIndicator(
          itemSize: 15.sp,
          rating: rating,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.yellow.shade700,
          ),
        ),
        SizedBox(width: 6.w),
        Stack(
          children: [
            Container(
              height: 4.h,
              width: 90.w,
              decoration: BoxDecoration(
                color: const Color(0XFFEDEDED),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              height: 4.h,
              width: 90.w * percentageRating,
              decoration: BoxDecoration(
                color: Colors.yellow.shade700,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
        SizedBox(width: 10.w),
        Container(
          alignment: Alignment.centerRight,
          width: 20.w,
          child: Text(
            jumlahReview.toString(),
            style: AppFont.paragraphSmall.copyWith(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _listReviews() {
    return Consumer<ReviewViewModel>(
      builder: (context, review, _) => ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 24.h),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: review.reviews.length,
        itemBuilder: (context, index) {
          final data = review.reviews[index];
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  data.user.name[0].toUpperCase(),
                  style:
                      AppFont.paragraphLargeBold.copyWith(color: Colors.white),
                ),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.user.name,
                    style: AppFont.paragraphMedium
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 6.h),
                  RatingBarIndicator(
                    itemSize: 15.sp,
                    rating: data.star.toDouble(),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.yellow.shade700,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    width: 250.w,
                    child: Text(data.review,
                        style: AppFont.paragraphSmall,
                        textAlign: TextAlign.justify),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
