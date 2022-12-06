import 'package:e_commerce/utils/provider/multi_provider.dart';
import 'package:e_commerce/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return multiProvider(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, _) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
