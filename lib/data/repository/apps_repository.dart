import 'package:e_commerce/models/cart_model.dart';
import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/models/register_model.dart';

import '../../models/wishlist_model.dart';
import '../network/network_api_services.dart';

class AppsRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<void> postLogin(LoginModel login) async {
    try {
      await _apiServices.postLogin('/api/login', login);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> postRegister(RegisterModel register) async {
    try {
      await _apiServices.postRequest('/api/register', register);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Product>> fetchProduct() async {
    try {
      dynamic response = await _apiServices.getRequest('/api/barang');

      ProductModel product = ProductModel.fromJson(response);

      return product.product;
    } catch (_) {
      rethrow;
    }
  }

  Future<List<Product>> fetchCategoryProduct(String value) async {
    try {
      dynamic response = await _apiServices.getRequest('/api/barang');

      ProductModel product = ProductModel.fromJson(response);

      return product.product
          .where(
            (element) => element.productCategory.name.toLowerCase().contains(
                  value.toLowerCase(),
                ),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> filterProductByName(String value) async {
    try {
      dynamic response = await _apiServices.getRequest('/api/barang');

      ProductModel product = ProductModel.fromJson(response);

      return product.product
          .where((element) =>
              element.name.toLowerCase().contains(
                    value.toLowerCase(),
                  ) &&
              element.productCategory.name.toLowerCase().contains('k-4-1'))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<WishListModel>> fetchWishlistProduct() async {
    try {
      dynamic response = await _apiServices.getRequest('/api/wishlist/');
      return (response['data'] as List)
          .map((e) => WishListModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postWishlist(int idBarang) async {
    try {
      await _apiServices.postRequest(
        '/api/wishlist',
        {
          'product_id': idBarang.toString(),
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> deleteWishlist(int id) async {
    try {
      await _apiServices.deleteRequest('/api/wishlist/$id');
    } catch (_) {
      rethrow;
    }
  }

  Future<List<CartModel>> fetchCart() async {
    try {
      dynamic response = await _apiServices.getRequest('/api/keranjang/');
      return (response['data'] as List)
          .map((e) => CartModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postCart({required int productId, required int quantity}) async {
    try {
      await _apiServices.postRequest(
        '/api/keranjang',
        {
          'product_id': productId.toString(),
          'qty': quantity.toString(),
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  Future<void> deleteCart(int id) async {
    try {
      await _apiServices.deleteRequest('/api/keranjang/$id');
    } catch (_) {
      rethrow;
    }
  }

  Future<void> postTransaction(String address) async {
    try {
      await _apiServices.postRequest(
        '/api/transaksi',
        {
          'alamat': address,
        },
      );
    } catch (_) {
      rethrow;
    }
  }
}
