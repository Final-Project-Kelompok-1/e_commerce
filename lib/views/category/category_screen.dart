import 'package:e_commerce/view_models/category_product_view_model.dart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      body: Consumer<CategoryProductViewModel>(
        builder: (context, category, _) {
          return Center(child: Text(category.products.length.toString()));
        },
      ),
    );
  }
}
