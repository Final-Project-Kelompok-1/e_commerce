import 'package:flutter/cupertino.dart';

import '../data/repository/apps_repository.dart';
import '../models/product_model.dart';
import '../utils/utils.dart';

class CategoryProductViewModel extends ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  List<Product> _products = [];
  AppState _appState = AppState.loading;

  List<Product> get products => _products;
  AppState get appState => _appState;

  void fetchCategoryProduct(String value) async {
    _products.clear();
    try {
      changeAppState(AppState.loading);
      _products = await appsRepository.fetchCategoryProduct(value);
      notifyListeners();
      changeAppState(AppState.loaded);

      if (_products.isEmpty) {
        changeAppState(AppState.noData);
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
