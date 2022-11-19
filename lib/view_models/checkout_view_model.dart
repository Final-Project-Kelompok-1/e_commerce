import 'package:flutter/cupertino.dart';

class CheckoutViewModel extends ChangeNotifier {
  int _quantityProduct = 1;
  int get quantityProduct => _quantityProduct;

  void plusQuantityProduct(int productStock) {
    if (_quantityProduct <= productStock) {
      _quantityProduct++;
    }
    notifyListeners();
  }

  void minusQuantityProduct(int productStock) {
    if (_quantityProduct > 1) {
      _quantityProduct--;
    }
    notifyListeners();
  }
}
