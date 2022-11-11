import 'package:e_commerce/states/providers/botnavbar/botnavbar_provider.dart';
import 'package:e_commerce/views/widgets/botnavbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => BotNavBarProvider(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, _) => const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BotNavBar(),
        ),
      ),
    );
  }
}
