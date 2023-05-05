import 'package:flutter/material.dart';
import 'package:flutter_mvvm_test/views/screens/login/login_sreen.dart';
import 'package:flutter_mvvm_test/views/screens/login/login_view_model.dart';

void main() {
  runApp(const MvvmApp());
}

class MvvmApp extends StatelessWidget {
  const MvvmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(LoginViewModel()),
    );
  }
}
