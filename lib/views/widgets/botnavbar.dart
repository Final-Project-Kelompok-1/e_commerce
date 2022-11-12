import 'package:e_commerce/config/config.dart';
import 'package:e_commerce/states/providers/botnavbar/botnavbar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<BotNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BotNavBarProvider>(
        builder: (context, navbar, _) => Center(
          child: navbar.pages[navbar.selectedIndex],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.0, 1.00),
                blurRadius: 15,
                color: Colors.grey,
                spreadRadius: 1.00),
          ],
        ),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
          ),
          child: Consumer<BotNavBarProvider>(
            builder: (context, navbar, _) => BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset('assets/icons/home.svg',
                      width: 26.w, height: 26.h, color: AppColor.secondColor),
                  icon: SvgPicture.asset('assets/icons/home.svg',
                      width: 26.w, height: 26.h, color: Colors.grey),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_outlined),
                  label: 'Wishlist',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_outlined),
                  label: 'Cart',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profil',
                ),
              ],
              selectedFontSize: 24.sp,
              iconSize: 24.sp,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: navbar.selectedIndex,
              selectedItemColor: AppColor.secondColor,
              selectedLabelStyle:
                  AppFont.componentSmall.copyWith(color: AppColor.secondColor),
              unselectedItemColor: Colors.grey,
              unselectedLabelStyle:
                  AppFont.componentSmall.copyWith(color: Colors.grey),
              unselectedFontSize: 12,
              onTap: navbar.changeIndex,
            ),
          ),
        ),
      ),
    );
  }
}