import 'package:e_commerce/data/repository/auth_repository.dart';
import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late UserData _userData;
  bool _obscureText = true;
  bool _obscureText2 = true;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  UserData get userData => _userData;
  bool get obscureText => _obscureText;
  bool get obscureText2 => _obscureText2;

  Future<void> postLogin() async {
    await _authRepository
        .postLogin(
          LoginModel(
              email: _emailController.text, password: _passwordController.text),
        )
        .then((value) => _userData = value.userData);
    notifyListeners();
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    notifyListeners();
  }

  void changeVisibleText(bool obscureText) {
    _obscureText = obscureText;
    notifyListeners();
  }

  void changeVisibleText2(bool obscureText) {
    _obscureText2 = obscureText;
    notifyListeners();
  }
}
