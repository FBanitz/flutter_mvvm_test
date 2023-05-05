import 'package:flutter/material.dart';
import 'package:flutter_mvvm_test/views/widgets/button.dart';

abstract class ILoginViewModel extends ChangeNotifier {
  bool get isLoading;
  String? get generalErrorMessage;
  String? get emailFieldErrorMessage;
  String? get passwordFieldErrorMessage;
  String? get generalSuccessMessage;
  bool get hasGeneralErrorMessage;
  bool get hasGeneralSuccessMessage;

  TextEditingController get emailController;
  TextEditingController get passwordController;

  login() async {}
}

class LoginScreen extends StatelessWidget {
  final ILoginViewModel _viewModel;
  const LoginScreen(
    this._viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedBuilder(
          animation: _viewModel,
          builder: (context, child) {
            return Column(
              children: [
                TextFormField(
                  controller: _viewModel.emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [
                    AutofillHints.username,
                    AutofillHints.email,
                  ],
                  decoration: InputDecoration(
                    labelText: "Email",
                    errorText: _viewModel.emailFieldErrorMessage,
                  ),
                  onFieldSubmitted: (_) => _viewModel.login(),
                ),
                TextFormField(
                  controller: _viewModel.passwordController,
                  obscureText: true,
                  autofillHints: const [AutofillHints.password],
                  decoration: InputDecoration(
                    labelText: "Password",
                    errorText: _viewModel.passwordFieldErrorMessage,
                  ),
                  onFieldSubmitted: (_) => _viewModel.login(),
                ),
                const SizedBox(height: 8),
                ButtonWidget(
                  onPressed: _viewModel.login,
                  isLoading: _viewModel.isLoading,
                  icon: const Icon(Icons.login),
                  child: const Text("Login"),
                ),
                Visibility(
                  visible: _viewModel.hasGeneralErrorMessage,
                  child: Text(
                    _viewModel.generalErrorMessage ?? "",
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                Visibility(
                  visible: _viewModel.hasGeneralSuccessMessage,
                  child: Text(
                    _viewModel.generalSuccessMessage ?? "",
                    style: const TextStyle(color: Colors.green),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
