import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/navigator/navigator.dart';
import 'package:e_commerce/views/checkout/components/checkout_components.dart';
import 'package:e_commerce/views/checkout/success_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/config.dart';
import '../widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  final Product product;
  const CheckoutScreen({super.key, required this.product});

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
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text("Products", style: AppFont.paragraphLargeBold),
                SizedBox(height: 20.h),
                CheckoutProductNow(product: product),
                const Spacer(),
                const QuantityCheckoutProduct(),
                SizedBox(height: 16.h),
                const PriceCheckoutProduct(),
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
      ),
    );
  }
}
