import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/models/register_model.dart';
import 'package:e_commerce/models/user_model.dart';

import '../network/network_api_services.dart';

class AppsRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<UserModel> postLogin(LoginModel login) async {
    try {
      dynamic response = await _apiServices.postLogin('/api/login', login);
      return response = UserModel.fromJson(response);
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
}
