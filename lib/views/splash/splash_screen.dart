import 'package:e_commerce/utils/navigator/navigator.dart';
import 'package:e_commerce/views/auth/login_screen.dart';
import 'package:e_commerce/views/widgets/botnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce/config/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AssetImage? assetImage;
  startTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        NavigatorFadeTransitionHelper(
          child: prefs.getString('token') != null
              ? const BotNavBar()
              : const LoginScreen(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    assetImage = const AssetImage('assets/images/logo.png');
    startTime();
  }

  @override
  void didChangeDependencies() {
    precacheImage(assetImage!, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColor.mainColor, AppColor.thirdColor],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 312.w,
                height: 413.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: assetImage!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
