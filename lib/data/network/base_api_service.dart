import 'package:e_commerce/models/login_model.dart';

abstract class BaseApiServices {
  Future<dynamic> postLogin(String url, LoginModel login);
  Future<void> postRequest(String url, dynamic data);
  Future<dynamic> getRequest(String url);
  Future<dynamic> deleteRequest(String url);
}
