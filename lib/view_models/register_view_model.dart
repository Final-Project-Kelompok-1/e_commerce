import 'package:flutter/material.dart';

import '../data/repository/auth_repository.dart';
import '../models/register_model.dart';

class RegisterViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordConfirmationController =
      TextEditingController();

  bool _obscureText = true;
  bool _obscureText2 = true;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordConfirmationController =>
      _passwordConfirmationController;

  bool get obscureText => _obscureText;
  bool get obscureText2 => _obscureText2;

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

  void changeVisibleText(bool obscureText) {
    _obscureText = obscureText;
    notifyListeners();
  }

  void changeVisibleText2(bool obscureText) {
    _obscureText2 = obscureText;
    notifyListeners();
  }
}
