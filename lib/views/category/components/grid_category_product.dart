import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/view_models/category_product_view_model.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgets.dart';

class GridCategoryProduct extends StatelessWidget {
  final List<Product> product;
  const GridCategoryProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Consumer<CategoryProductViewModel>(
        builder: (context, category, _) => GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: product.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.5,
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12),
          itemBuilder: (context, index) {
            final data = product[index];
            return ProductWidget(product: data);
          },
        ),
      ),
    );
  }
}
