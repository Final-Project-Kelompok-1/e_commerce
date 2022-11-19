import 'package:e_commerce/config/config.dart';
import 'package:e_commerce/view_models/category_product_view_model.dart.dart';
import 'package:e_commerce/views/category/components/category_components.dart';
import 'package:e_commerce/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';
import '../widgets/skeleton_container.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryName;
  const CategoryScreen({super.key, required this.categoryName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<CategoryProductViewModel>(context, listen: false)
          .fetchCategoryProduct(widget.categoryName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final focusField = FocusNode();

    final width = MediaQuery.of(context).size.width;
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
              HeaderCategory(category: widget.categoryName),
              SizedBox(height: AppDimen.h16),
              _listProduct(),
              SizedBox(height: AppDimen.h30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ButtonWidget(
                    buttonText: 'Filter & Sorting',
                    height: 46.h,
                    width: width,
                    onpressed: () {},
                    radius: 10,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _listProduct() {
    return Consumer<CategoryProductViewModel>(
      builder: (context, category, _) {
        if (category.appState == AppState.loading) {
          return _loadingContainer();
        }

        if (category.appState == AppState.failure) {
          return Center(
            child: Text("Failed get product data from server",
                style: AppFont.paragraphMediumBold),
          );
        }

        if (category.appState == AppState.loaded) {
          return GridCategoryProduct(product: category.products);
        }

        if (category.appState == AppState.noData) {
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
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1 / 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12),
        itemBuilder: (context, index) =>
            const SkeletonContainer(width: 150, height: 250, borderRadius: 20),
      ),
    );
  }
}
