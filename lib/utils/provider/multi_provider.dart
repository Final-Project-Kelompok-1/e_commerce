import 'package:e_commerce/view_models/best_seller_product_view_model.dart';
import 'package:e_commerce/view_models/bot_nav_bar_view_model.dart';
import 'package:e_commerce/view_models/cart_view_model.dart';
import 'package:e_commerce/view_models/category_product_view_model.dart.dart';
import 'package:e_commerce/view_models/featured_product_view_model.dart';
import 'package:e_commerce/view_models/login_view_model.dart';
import 'package:e_commerce/view_models/product_view_model.dart';
import 'package:e_commerce/view_models/register_view_model.dart';
import 'package:e_commerce/view_models/search_view_model.dart';
import 'package:e_commerce/view_models/top_rated_product_view_model.dart';
import 'package:e_commerce/view_models/transaction_view_model.dart';
import 'package:e_commerce/view_models/user_view_model.dart';
import 'package:e_commerce/view_models/wishlist_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Function multiProvider = (Widget widget) {
  return MultiProvider(providers: [
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
      create: (_) => WishListViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => UserViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => SearchProductViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => CartViewModel(),
    ),
    ChangeNotifierProvider(
      create: (_) => TransactionViewModel(),
    ),
  ], child: widget);
};
