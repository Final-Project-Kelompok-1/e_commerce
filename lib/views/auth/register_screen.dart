import 'package:e_commerce/utils/navigator/navigator.dart';
import 'package:e_commerce/view_models/providers/auth_view_model.dart';
import 'package:e_commerce/views/auth/register_success_screen.dart';
import 'package:e_commerce/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _header(width),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    SizedBox(height: 180.h),
                    _form(width, context),
                    SizedBox(height: AppDimen.w32)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(double width) {
    return Container(
      height: 350.h,
      width: width,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100.h),
          Text(
            'Register',
            style: AppFont.display3.copyWith(color: Colors.white),
          ),
        ],
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
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _formLogin(width),
              SizedBox(height: AppDimen.h16),
              ButtonWidget(
                  buttonText: "Register",
                  height: 45.h,
                  width: width,
                  onpressed: () {
                    Navigator.of(context).push(
                      NavigatorFadeTransitionHelper(
                        child: const RegisterSuccessScreen(),
                      ),
                    );
                  },
                  radius: 5),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    Text(
                      "Already have an account?",
                      style: AppFont.paragraphMedium
                          .copyWith(color: Colors.grey.shade700),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Login",
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
    return Consumer<AuthViewModel>(
      builder: (context, auth, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppDimen.h32),
          Text("Username", style: AppFont.paragraphMedium),
          SizedBox(height: AppDimen.h12),
          //username field
          SizedBox(
            height: 45.h,
            width: width,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 8, top: 5, right: 8),
                hintStyle: AppFont.paragraphMedium
                    .copyWith(color: Colors.grey.shade400),
                hintText: "Username",
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

          Text("Email", style: AppFont.paragraphMedium),
          SizedBox(height: AppDimen.h12),
          //email field
          SizedBox(
            height: 45.h,
            width: width,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 8, top: 5, right: 8),
                hintStyle: AppFont.paragraphMedium
                    .copyWith(color: Colors.grey.shade400),
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

          Text("Phone Number", style: AppFont.paragraphMedium),
          SizedBox(height: AppDimen.h12),
          //phone number field
          SizedBox(
            height: 45.h,
            width: width,
            child: TextField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(left: 8, top: 5, right: 8),
                hintStyle: AppFont.paragraphMedium
                    .copyWith(color: Colors.grey.shade400),
                hintText: "Enter the phone number",
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

          Text("Passowrd", style: AppFont.paragraphMedium),
          SizedBox(height: AppDimen.h12),
          //password field
          SizedBox(
            height: 45.h,
            width: width,
            child: TextField(
              obscureText: auth.obscureText,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    auth.changeVisibleText(!auth.obscureText);
                  },
                  child: auth.obscureText
                      ? const Icon(Icons.visibility_off, color: Colors.grey)
                      : const Icon(Icons.visibility, color: Colors.grey),
                ),
                contentPadding:
                    const EdgeInsets.only(left: 8, top: 5, right: 8),
                hintStyle: AppFont.paragraphMedium
                    .copyWith(color: Colors.grey.shade400),
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
          SizedBox(height: AppDimen.h16),

          Text("Confirm Passowrd", style: AppFont.paragraphMedium),
          SizedBox(height: AppDimen.h12),
          //confirm password field
          SizedBox(
            height: 45.h,
            width: width,
            child: TextField(
              obscureText: auth.obscureText2,
              decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: () {
                    auth.changeVisibleText2(!auth.obscureText2);
                  },
                  child: auth.obscureText2
                      ? const Icon(Icons.visibility_off, color: Colors.grey)
                      : const Icon(Icons.visibility, color: Colors.grey),
                ),
                contentPadding:
                    const EdgeInsets.only(left: 8, top: 5, right: 8),
                hintStyle: AppFont.paragraphMedium
                    .copyWith(color: Colors.grey.shade400),
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
      ),
    );
  }
}
