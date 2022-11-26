import 'package:flutter/cupertino.dart';

class CheckoutViewModel extends ChangeNotifier {
  int _quantityProduct = 1;
  int _sumPriceProduct = 0;
  int get quantityProduct => _quantityProduct;
  int get sumPriceProduct => _sumPriceProduct;

  void addInitialPrice(int priceProduct) {
    _sumPriceProduct = priceProduct;
  }

  void plusQuantityProduct(int productStock, int hargaProduct) {
    if (_quantityProduct < productStock) {
      _sumPriceProduct += hargaProduct;
      _quantityProduct++;
    }
    notifyListeners();
  }

  void minusQuantityProduct(int productStock, int hargaProduct) {
    if (_quantityProduct > 1) {
      _sumPriceProduct -= hargaProduct;
      _quantityProduct--;
    }
    notifyListeners();
  }

  void resetQuantity() {
    _quantityProduct = 1;
  }
}
