import 'package:e_commerce/view_models/best_seller_product_view_model.dart';
import 'package:e_commerce/view_models/bot_nav_bar_view_model.dart';
import 'package:e_commerce/view_models/category_product_view_model.dart.dart';
import 'package:e_commerce/view_models/checkout_view_model.dart';
import 'package:e_commerce/view_models/featured_product_view_model.dart';
import 'package:e_commerce/view_models/login_view_model.dart';
import 'package:e_commerce/view_models/product_view_model.dart';
import 'package:e_commerce/view_models/register_view_model.dart';
import 'package:e_commerce/view_models/top_rated_product_view_model.dart';
import 'package:e_commerce/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BotNavBarViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => TopRatedProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => BestSellerProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => FeaturedProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CategoryProductViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => CheckoutViewModel(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, _) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
