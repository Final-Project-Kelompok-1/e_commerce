import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../config/config.dart';
import '../../../utils/utils.dart';
import '../../../view_models/product_view_model.dart';
import '../../widgets/widgets.dart';

class GridHomeProductWidget extends StatefulWidget {
  final Function onTap;
  final String productCategory;
  const GridHomeProductWidget(
      {super.key, required this.onTap, required this.productCategory});

  @override
  State<GridHomeProductWidget> createState() => _GridHomeProductWidgetState();
}

class _GridHomeProductWidgetState extends State<GridHomeProductWidget> {
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () => Provider.of<ProductViewModel>(context, listen: false)
          .fetchListProduct(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            titleCategory(),
            Consumer<ProductViewModel>(
              builder: (context, product, _) {
                if (product.appState == AppState.loading) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.5,
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                    itemBuilder: (context, index) => SkeletonContainer(
                        width: 150.w, height: 250.h, borderRadius: 20),
                  );
                }

                if (product.appState == AppState.failure) {
                  return Center(
                    child: Text("Failed get product data from server",
                        style: AppFont.paragraphMediumBold),
                  );
                }

                if (product.appState == AppState.loaded) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: product.products.product.length < 2
                        ? product.products.product.length
                        : 2,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.5,
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12),
                    itemBuilder: (context, index) {
                      final data = product.products.product[index];
                      return ProductWidget(product: data);
                    },
                  );
                }

                if (product.appState == AppState.noData) {
                  return Center(
                    child: Text("Product is empty",
                        style: AppFont.paragraphMediumBold),
                  );
                }

                return const SizedBox();
              },
            ),
          ],
        ));
  }

  Widget titleCategory() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.productCategory,
          style: AppFont.paragraphLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: () {
            widget.onTap;
          },
          child: Text(
            "See all",
            style: AppFont.paragraphLarge.copyWith(color: AppColor.secondColor),
          ),
        ),
      ],
    );
  }
}
