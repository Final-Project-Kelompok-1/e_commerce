import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/models/register_model.dart';
import 'package:e_commerce/models/user_model.dart';

import '../../config/config.dart';
import '../network/network_api_services.dart';

class AuthRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<UserModel> postLogin(LoginModel login) async {
    try {
      dynamic response =
          await _apiServices.postLogin('$baseUrl/api/login', login);
      return response = UserModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postRegister(RegisterModel register) async {
    try {
      await _apiServices.postRequest('$baseUrl/api/register', register);
    } catch (e) {
      rethrow;
    }
  }
}
