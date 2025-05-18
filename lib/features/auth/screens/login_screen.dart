import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompita/constants/app_configure.dart';
import 'package:prompita/features/auth/controller/auth_controller.dart';
import 'package:prompita/features/auth/widgets/custom_elevated_button.dart';
import 'package:prompita/features/auth/widgets/text_input_field.dart';
import 'package:prompita/route/route_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                spacing: 18,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppConfigure.appName,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text('Welcome back'),
                      ],
                    ),
                  ),
                  TextInputField(
                    labelText: 'Email',
                    textEditingController: _emailTEController,
                    errorMsg: 'Enter your email',
                    hintText: 'Enter your email address',
                    prefixIcon: Icons.email_outlined,
                  ),
                  TextInputField(
                    labelText: 'Password',
                    textEditingController: _passwordTEController,
                    errorMsg: 'Enter Your Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icons.lock_outline,
                    showToggle: true,
                  ),
                  Obx(
                    () => CustomElevatedButton(
                      buttonText: authController.loginLoading.value
                          ? 'Loading...'
                          : 'Login',
                      onTap: _loginButton,
                    ),
                  ),
                  const Text('--OR--',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteNames.registerScreen);
                            }),
                    ], text: "Don't have an Account ? "),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginButton() {
    if (_formKey.currentState!.validate() &&
        authController.loginLoading.value == false) {
      authController.login(
        _emailTEController.text,
        _passwordTEController.text,
      );
    }
  }
}
