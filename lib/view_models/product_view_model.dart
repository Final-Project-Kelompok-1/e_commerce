import 'package:e_commerce/data/repository/apps_repository.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/utils/app_state/app_state.dart';
import 'package:flutter/cupertino.dart';

class ProductViewModel extends ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  List<Product> _filterProduct = [];
  final List<Product> _productsFeaturedProduct = [];
  final List<Product> _bestSellerProduct = [];
  final List<Product> _topRatedProduct = [];
  AppState _appState = AppState.loading;
  final TextEditingController _searchController = TextEditingController();

  List<Product> get products => _filterProduct;
  List<Product> get productsFeatured => _productsFeaturedProduct;
  List<Product> get bestSellerProduct => _bestSellerProduct;
  List<Product> get topRatedProduct => _topRatedProduct;
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

  void filterCategoryProduct() async {
    try {
      changeAppState(AppState.loading);
      final List<Product> products = await appsRepository.fetchProduct();

      for (var i in products) {
        if (i.productCategory.name == 'k-4-1_featured' &&
            !_productsFeaturedProduct.contains(i)) {
          _productsFeaturedProduct.add(i);
          notifyListeners();
        }

        if (i.productCategory.name == 'k-4-1_bestseller' &&
            !_bestSellerProduct.contains(i)) {
          _productsFeaturedProduct.add(i);
          notifyListeners();
        }

        if (i.productCategory.name == 'k-4-1_toprated' &&
            !_topRatedProduct.contains(i)) {
          _productsFeaturedProduct.add(i);
          notifyListeners();
        }
      }

      changeAppState(AppState.loaded);
      notifyListeners();
      if (_filterProduct.isEmpty) {
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
