import 'package:e_commerce/config/config.dart';
import 'package:e_commerce/utils/navigator/navigator.dart';
import 'package:e_commerce/view_models/login_view_model.dart';
import 'package:e_commerce/view_models/user_view_model.dart';
import 'package:e_commerce/views/auth/login_screen.dart';
import 'package:e_commerce/views/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColor.thirdColor, AppColor.secondColor])),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 64.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    "Profil Saya",
                    style: AppFont.heading2.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: 40.h),
                _profileContainer(width),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileContainer(double width) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.sp),
          topRight: Radius.circular(30.sp),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            Center(
              child: SvgPicture.asset(
                'assets/icons/account.svg',
                width: 90.w,
                height: 90.h,
                color: AppColor.secondColor,
              ),
            ),
            SizedBox(height: 16.h),
            _detailProfile(),
            SizedBox(height: 40.h),
            Consumer<LoginViewModel>(
              builder: (context, logout, _) => ButtonWidget(
                  buttonText: "Logout",
                  height: 45,
                  width: width,
                  onpressed: () async {
                    await logout.logout().then(
                          (_) => Fluttertoast.showToast(msg: "Berhasil Logout")
                              .then(
                            (_) => Navigator.of(context).pushAndRemoveUntil(
                                NavigatorFadeTransitionHelper(
                                    child: const LoginScreen()),
                                (route) => false),
                          ),
                        );
                  },
                  radius: 10,
                  fontSize: 16),
            ),
            SizedBox(height: 120.h),
          ],
        ),
      ),
    );
  }

  Widget _detailProfile() {
    return Consumer<UserViewModel>(
      builder: (context, user, _) => Column(
        children: [
          customProfile(icon: Icons.person, title: user.user.name),
          customProfile(icon: Icons.email, title: user.user.email),
          customProfile(icon: Icons.phone, title: user.user.phone),
        ],
      ),
    );
  }

  Widget customProfile(
      {required IconData icon, required String title, context}) {
    return SizedBox(
      height: 50.h,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(icon, size: 28.sp, color: AppColor.secondColor),
              const SizedBox(
                width: 8,
              ),
              Text(title,
                  style: AppFont.paragraphLarge
                      .copyWith(color: Colors.grey.shade600)),
            ],
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
