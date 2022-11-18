import 'package:e_commerce/view_models/best_seller_product_view_model.dart';
import 'package:e_commerce/view_models/featured_product_view_model.dart';
import 'package:e_commerce/view_models/top_rated_product_view_model.dart';
import 'package:e_commerce/views/home/widgets/banner_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/config/config.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../utils/app_state/finite_state.dart';
import '../../view_models/product_view_model.dart';
import '../widgets/widgets.dart';
import 'widgets/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () {
        Provider.of<ProductViewModel>(context, listen: false)
            .fetchListProduct();
        Provider.of<ProductViewModel>(context, listen: false)
            .filterCategoryProduct();
        Provider.of<TopRatedProductViewModel>(context, listen: false)
            .filterCategoryProduct();
        Provider.of<BestSellerProductViewModel>(context, listen: false)
            .filterCategoryProduct();
        Provider.of<FeaturedProductViewModel>(context, listen: false)
            .filterCategoryProduct();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          focusField.unfocus();
          FocusScope.of(context).requestFocus(FocusNode());
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BannerListWidget(),
              SizedBox(height: AppDimen.h30),
              const CategoriesHomeWidget(),
              SizedBox(height: AppDimen.h40),
              _featuredProduct(),
              SizedBox(
                height: AppDimen.h36,
              ),
              const BannerProductWidget(
                  nameBanner: 'New Era - Handphone',
                  assetImage: 'assets/images/hp.png',
                  color: AppColor.secondColor),
              SizedBox(height: AppDimen.h30),
              _besetSellerProduct(),
              SizedBox(height: AppDimen.h30),
              const BannerProductWidget(
                  nameBanner: 'New Era - Handphone',
                  assetImage: 'assets/images/power_bank.png',
                  color: AppColor.thirdColor),
              SizedBox(height: AppDimen.h30),
              _topRatedProduct(),
              SizedBox(height: AppDimen.h30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _featuredProduct() {
    return Consumer<FeaturedProductViewModel>(
      builder: (context, product, _) {
        if (product.appState == AppState.loading) {
          return _loadingContainer();
        }

        if (product.appState == AppState.failure) {
          return Center(
            child: Text("Failed get product data from server",
                style: AppFont.paragraphMediumBold),
          );
        }

        if (product.appState == AppState.loaded) {
          return GridHomeProductWidget(
              onTap: () {},
              productCategory: 'Featured Product',
              product: product.featuredProduct);
        }

        if (product.appState == AppState.noData) {
          return Center(
            child: Text("Product is empty", style: AppFont.paragraphMediumBold),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _besetSellerProduct() {
    return Consumer<BestSellerProductViewModel>(
      builder: (context, product, _) {
        if (product.appState == AppState.loading) {
          return _loadingContainer();
        }

        if (product.appState == AppState.failure) {
          return Center(
            child: Text("Failed get product data from server",
                style: AppFont.paragraphMediumBold),
          );
        }

        if (product.appState == AppState.loaded) {
          return GridHomeProductWidget(
              onTap: () {},
              productCategory: 'Best Seller',
              product: product.bestSellerProduct);
        }

        if (product.appState == AppState.noData) {
          return Center(
            child: Text("Product is empty", style: AppFont.paragraphMediumBold),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _topRatedProduct() {
    return Consumer<TopRatedProductViewModel>(
      builder: (context, product, _) {
        if (product.appState == AppState.loading) {
          return _loadingContainer();
        }

        if (product.appState == AppState.failure) {
          return Center(
            child: Text("Failed get product data from server",
                style: AppFont.paragraphMediumBold),
          );
        }

        if (product.appState == AppState.loaded) {
          return GridHomeProductWidget(
              onTap: () {},
              productCategory: 'Top Rated',
              product: product.topRatedProduct);
        }

        if (product.appState == AppState.noData) {
          return Center(
            child: Text("Product is empty", style: AppFont.paragraphMediumBold),
          );
        }

        return const SizedBox();
      },
    );
  }

  Widget _loadingContainer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        itemBuilder: (context, index) =>
            SkeletonContainer(width: 150.w, height: 250.h, borderRadius: 20),
      ),
    );
  }
}
