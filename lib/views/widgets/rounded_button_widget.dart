import 'package:flutter/material.dart';
import 'package:e_commerce/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final double width;
  final double height;
  final Function onpressed;

  const RoundedButtonWidget({
    super.key,
    required this.buttonText,
    required this.height,
    required this.width,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onPressed: () {
        onpressed();
      },
      child: Ink(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.thirdColor, AppColor.secondColor],
          ),
        ),
        child: Container(
          width: width.w,
          height: height.h,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Text(
            buttonText,
            style: AppFont.buttonMedium.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
