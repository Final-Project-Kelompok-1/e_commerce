import 'package:e_commerce/data/repository/auth_repository.dart';
import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/models/register_model.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  late UserData _userData;
  bool _obscureText = true;
  bool _obscureText2 = true;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordConfirmationController =>
      _passwordConfirmationController;
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

    emailController.clear();
    passwordController.clear();
    notifyListeners();
  }

  Future<void> postRegister() async {
    await _authRepository.postRegister(
      RegisterModel(
          name: _usernameController.text,
          email: _emailController.text,
          handphone: _phoneController.text,
          password: _passwordController.text,
          passwordConfirmation: _passwordConfirmationController.text),
    );

    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
    _phoneController.clear();
    _passwordConfirmationController.clear();
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
