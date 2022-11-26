import 'package:e_commerce/config/config.dart';
import 'package:e_commerce/utils/navigator/navigator.dart';
import 'package:e_commerce/views/checkout/success_checkout_screen.dart';
import 'package:e_commerce/views/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'components/cart_components.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text("My Cart", style: AppFont.paragraphLargeBold),
              SizedBox(height: 50.h),
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
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
