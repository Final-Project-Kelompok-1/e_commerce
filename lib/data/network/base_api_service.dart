import 'package:e_commerce/models/login_model.dart';

abstract class BaseApiServices {
  Future<dynamic> postLogin(String url, LoginModel login);
  void register(String url);
}
