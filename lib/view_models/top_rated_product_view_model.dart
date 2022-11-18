import 'package:e_commerce/data/repository/apps_repository.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/app_state/app_state.dart';
import 'package:flutter/cupertino.dart';

class TopRatedProductViewModel extends ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  final List<Product> _topRatedProduct = [];
  AppState _appState = AppState.loading;

  List<Product> get topRatedProduct => _topRatedProduct;
  AppState get appState => _appState;

  void filterCategoryProduct() async {
    try {
      changeAppState(AppState.loading);
      final List<Product> products = await appsRepository.fetchProduct();

      for (var i in products) {
        if (i.productCategory.name == 'k-4-1_toprated' &&
            !_topRatedProduct.contains(i)) {
          _topRatedProduct.add(i);
          notifyListeners();
        }
      }

      changeAppState(AppState.loaded);
      notifyListeners();
      if (_topRatedProduct.isEmpty) {
        changeAppState(AppState.noData);
        notifyListeners();
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }
}
