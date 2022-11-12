import 'package:e_commerce/views/auth/login_screen.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../../../common/navigator_fade_transition.dart';
import 'package:e_commerce/config/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AssetImage? assetImage;
  startTime() async {
    await Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.of(context).pushReplacement(
        NavigatorFadeTransition(
          child: const LoginScreen(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    assetImage = const AssetImage('assets/logo.png');
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
        )),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(
              8,
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 312,
                      height: 413,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: assetImage!,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
