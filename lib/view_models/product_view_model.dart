import 'package:e_commerce/data/repository/apps_repository.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/app_state/app_state.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  late ProductModel _products;
  AppState _appState = AppState.loading;

  ProductModel get products => _products;
  AppState get appState => _appState;

  void fetchListProduct() async {
    try {
      changeAppState(AppState.loading);
      _products = await appsRepository.fetchProduct();
      notifyListeners();
      changeAppState(AppState.loaded);

      if (_products.product.isEmpty) {
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
