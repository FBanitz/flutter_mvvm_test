import 'package:flutter/material.dart';
import 'package:flutter_mvvm_test/views/screens/login/login_sreen.dart';

class LoginViewModel extends ILoginViewModel {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _generalErrorMessage;
  String? _emailFieldErrorMessage;
  String? _passwordFieldErrorMessage;
  String? _generalSuccessMessage;

  @override
  bool get isLoading => _isLoading;
  @override
  String? get generalErrorMessage => _generalErrorMessage;
  @override
  String? get emailFieldErrorMessage => _emailFieldErrorMessage;
  @override
  String? get passwordFieldErrorMessage => _passwordFieldErrorMessage;
  @override
  String? get generalSuccessMessage => _generalSuccessMessage;
  @override
  bool get hasGeneralErrorMessage =>
      _generalErrorMessage != null && _generalErrorMessage!.isNotEmpty;
  @override
  bool get hasGeneralSuccessMessage =>
      _generalSuccessMessage != null && _generalSuccessMessage!.isNotEmpty;

  @override
  set emailController(TextEditingController controller) =>
      _emailController = controller;

  @override
  TextEditingController get emailController => _emailController;

  @override
  TextEditingController get passwordController => _passwordController;

  @override
  set passwordController(TextEditingController controller) =>
      _passwordController = controller;

  @override
  Future<void> login() async {
    String? email = _emailController.text;
    String? password = _passwordController.text;

    _emailFieldErrorMessage = null;
    _passwordFieldErrorMessage = null;
    _generalErrorMessage = null;
    _generalSuccessMessage = null;

    bool error = false;

    if (email.isEmpty) {
      _emailFieldErrorMessage = "Email is required";
      error = true;
    } else if (!email.contains("@")) {
      _emailFieldErrorMessage = "Email is not valid";
      error = true;
    }

    if (password.isEmpty) {
      _passwordFieldErrorMessage = "Password is required";
      error = true;
    }

    if (error) {
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    if (password != 'OK') {
      _generalErrorMessage = "Login failed";
      notifyListeners();
      return;
    }

    _generalSuccessMessage = "Login succesful. Welcome $email!";
    notifyListeners();
  }
}
