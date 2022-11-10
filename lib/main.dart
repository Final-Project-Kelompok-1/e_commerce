import 'package:e_commerce/utils/responsive/responsive_layout_helper.dart';
import 'package:e_commerce/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: const [],
      child: MultiBlocProvider(
        providers: const [],
        child: ScreenUtilInit(
          designSize: ResponsiveLayout.isMobile(context)
              ? const Size(360, 640)
              : const Size(601, 962),
          builder: (context, _) => const MaterialApp(
            home: HomeScreen(),
          ),
        ),
      ),
    );
  }
}
