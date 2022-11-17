import 'package:e_commerce/views/home/widgets/banner_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/config/config.dart';
import 'widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BannerListWidget(),
            SizedBox(height: AppDimen.h30),
            const CategoriesHomeWidget(),
            SizedBox(height: AppDimen.h26),
            const ButtonCategoryWidget(),
            SizedBox(height: AppDimen.h40),
            GridHomeProductWidget(
                onTap: () {}, productCategory: 'Featured Product'),
            SizedBox(
              height: AppDimen.h36,
            ),
            const BannerProductWidget(
                nameBanner: 'New Era - Handphone',
                assetImage: 'assets/images/hp.png',
                color: AppColor.secondColor),
            SizedBox(height: AppDimen.h30),
            GridHomeProductWidget(
                onTap: () {}, productCategory: 'Best Sellers'),
            SizedBox(height: AppDimen.h30),
            const BannerProductWidget(
                nameBanner: 'New Era - Handphone',
                assetImage: 'assets/images/power_bank.png',
                color: AppColor.secondColor),
            SizedBox(height: AppDimen.h30),
            GridHomeProductWidget(onTap: () {}, productCategory: 'Top Rated'),
            SizedBox(height: AppDimen.h30),
          ],
        ),
      ),
    );
  }
}
