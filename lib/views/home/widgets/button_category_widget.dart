import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/config.dart';
import '../../widgets/widgets.dart';

class ButtonCategoryWidget extends StatelessWidget {
  const ButtonCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: ButtonWidget(
              buttonText: "All",
              height: 25,
              width: 50,
              radius: 5,
              fontSize: 12,
              onpressed: () {},
            ),
          ),
          SizedBox(width: AppDimen.w12),
          Expanded(
            flex: 2,
            child: ButtonWidget(
              buttonText: "Best Selers",
              height: 25,
              width: 100,
              radius: 5,
              fontSize: 12,
              onpressed: () {},
            ),
          ),
          SizedBox(width: AppDimen.w12),
          Expanded(
            flex: 2,
            child: ButtonWidget(
              buttonText: "Top Rated",
              height: 25,
              width: 100,
              radius: 5,
              fontSize: 12,
              onpressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
