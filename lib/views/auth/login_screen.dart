import 'package:e_commerce/common/navigator_fade_transition.dart';
import 'package:e_commerce/views/auth/register_screen.dart';
import 'package:e_commerce/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: Stack(
          children: [
            _header(),
            Positioned(
              top: 250.h,
              right: 12.w,
              left: 12.w,
              child: _form(width, context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      height: 350.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.mainColor, AppColor.thirdColor],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        child:
            Image.asset('assets/images/logo.png', width: 230.w, height: 230.w),
      ),
    );
  }

  Widget _form(double width, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(20.sp),
        ),
        border: Border.all(color: Colors.grey.shade400),
      ),
      width: width,
      height: 400.h,
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _formLogin(width),
              SizedBox(height: AppDimen.h16),
              ButtonWidget(
                  buttonText: "Login",
                  height: 45.h,
                  width: width,
                  onpressed: () {},
                  radius: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: AppFont.paragraphMedium
                          .copyWith(color: Colors.grey.shade700),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          NavigatorFadeTransition(
                            child: const RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Register",
                        style: AppFont.paragraphMedium
                            .copyWith(color: AppColor.mainColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formLogin(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppDimen.h32),
        Text("Email/Username", style: AppFont.paragraphMedium),
        SizedBox(height: AppDimen.h12),
        //email field
        SizedBox(
          height: 45.h,
          width: width,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 8, top: 5, right: 8),
              hintStyle:
                  AppFont.paragraphMedium.copyWith(color: Colors.grey.shade400),
              hintText: "Enter the email",
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: Colors.grey[50],
            ),
          ),
        ),
        SizedBox(height: AppDimen.h16),

        Text("Password", style: AppFont.paragraphMedium),
        SizedBox(height: AppDimen.h12),
        //password field
        SizedBox(
          height: 45.h,
          width: width,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 8, top: 5, right: 8),
              hintStyle:
                  AppFont.paragraphMedium.copyWith(color: Colors.grey.shade400),
              hintText: "Enter the password",
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(8),
              ),
              fillColor: Colors.grey[50],
            ),
          ),
        ),
      ],
    );
  }
}
