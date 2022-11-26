import 'package:e_commerce/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../view_models/bot_nav_bar_view_model.dart';

class BotNavBar extends StatelessWidget {
  const BotNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BotNavBarViewModel>(
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
          child: Consumer<BotNavBarViewModel>(
            builder: (context, navbar, _) => BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset('assets/icons/home.svg',
                      width: 24.w, height: 24.h, color: AppColor.secondColor),
                  icon: SvgPicture.asset('assets/icons/home.svg',
                      width: 24.w, height: 24.h, color: Colors.grey),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset('assets/icons/shopping_bag.svg',
                      width: 24.w, height: 24.h, color: AppColor.secondColor),
                  icon: SvgPicture.asset('assets/icons/shopping_bag.svg',
                      width: 24.w, height: 24.h, color: Colors.grey),
                  label: 'Wishlist',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(Icons.history,
                      size: 24.sp, color: AppColor.mainColor),
                  icon: Icon(Icons.history, size: 24.sp, color: Colors.grey),
                  label: 'Transaksi',
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
