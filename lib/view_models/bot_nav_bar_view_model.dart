import 'package:e_commerce/views/history/history_screen.dart';
import 'package:e_commerce/views/home/home_screen.dart';
import 'package:e_commerce/views/profile/profile_scree.dart';
import 'package:e_commerce/views/wishlist/wish_list_screen.dart';
import 'package:flutter/cupertino.dart';

class BotNavBarViewModel extends ChangeNotifier {
  final List<Widget> _pages = [
    const HomeScreen(),
    const WishListScreen(),
    const HistoryScreen(),
    const ProfileScreen(),
  ];

  List<Widget> get pages => _pages;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
