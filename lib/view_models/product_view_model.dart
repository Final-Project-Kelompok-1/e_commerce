import 'package:e_commerce/data/repository/apps_repository.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/app_state/app_state.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  List<ProductDetailModel> _filterProduct = [];
  AppState _appState = AppState.loading;
  final TextEditingController _searchController = TextEditingController();

  List<ProductDetailModel> get products => _filterProduct;
  TextEditingController get searchController => _searchController;
  AppState get appState => _appState;

  void filterProductByName(String value) async {
    try {
      changeAppState(AppState.loading);
      _filterProduct = await appsRepository.fetchProduct();
      notifyListeners();
      changeAppState(AppState.loaded);

      if (_filterProduct.isEmpty) {
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
