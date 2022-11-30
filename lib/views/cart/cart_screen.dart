import 'package:e_commerce/config/config.dart';
import 'package:e_commerce/utils/app_state/app_state.dart';
import 'package:e_commerce/utils/navigator/navigator.dart';
import 'package:e_commerce/view_models/cart_view_model.dart';
import 'package:e_commerce/views/checkout/success_checkout_screen.dart';
import 'package:e_commerce/views/search/components/feature_product_recommendation.dart';
import 'package:e_commerce/views/search/search_screen.dart';
import 'package:e_commerce/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'components/cart_components.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<CartViewModel>(context, listen: false).fetchCart());
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, size: 22.sp, color: Colors.black),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text("My Cart", style: AppFont.paragraphLargeBold),
            ),
            SizedBox(height: 50.h),
            Consumer<CartViewModel>(
              builder: (context, cart, _) {
                if (cart.appState == AppState.loaded) {
                  return _hasDataCart();
                }
                return _noDataCart(width);
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _hasDataCart() {
    return Column(
      children: [
        const ListCart(),
        SizedBox(height: 40.h),
        const QuantityCartProduct(),
        SizedBox(height: 16.h),
        const PriceCartProduct(),
        SizedBox(height: 30.h),
        ButtonWidget(
            buttonText: 'BUY NOW',
            height: 50,
            width: 300,
            onpressed: () {
              Navigator.of(context).push(
                NavigatorFadeTransitionHelper(
                  child: const SuccessCheckoutScreen(),
                ),
              );
            },
            radius: 10,
            fontSize: 16),
      ],
    );
  }

  Widget _noDataCart(double width) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 110.h,
                width: width,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        "assets/images/empty_cart_image.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Text("Wah, keranjang belanjamu kosong",
                              style: AppFont.paragraphLargeBold),
                          SizedBox(height: 8.h),
                          Text(
                            "Yuk, isi dengan barang-barang impianmu!",
                            style: AppFont.paragraphMedium
                                .copyWith(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              ButtonWidget(
                  buttonText: "Mulai Belanja",
                  height: 35,
                  width: width,
                  onpressed: () {
                    Navigator.of(context).pushReplacement(
                      NavigatorFadeTransitionHelper(
                          child: const SearchScreen()),
                    );
                  },
                  radius: 10,
                  fontSize: 14)
            ],
          ),
        ),
        SizedBox(height: 32.h),
        const FeaturedProductRecommendation(),
      ],
    );
  }
}
