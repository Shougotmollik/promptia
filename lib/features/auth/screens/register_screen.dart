import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompita/constants/app_configure.dart';
import 'package:prompita/features/auth/controller/auth_controller.dart';
import 'package:prompita/features/auth/widgets/custom_elevated_button.dart';
import 'package:prompita/features/auth/widgets/text_input_field.dart';
import 'package:prompita/route/route_names.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded, size: 32)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 18,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppConfigure.appName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                        Text('Welcome to the world of AI Chats prompts')
                      ],
                    ),
                  ),
                  TextInputField(
                    labelText: 'Name',
                    textEditingController: _nameTEController,
                    errorMsg: 'Enter your name',
                    hintText: 'Enter your name',
                    prefixIcon: Icons.person_2_outlined,
                  ),
                  TextInputField(
                    labelText: 'Email',
                    textEditingController: _emailTEController,
                    errorMsg: 'Enter your email',
                    hintText: 'Enter your email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  TextInputField(
                    labelText: 'Password',
                    textEditingController: _passwordTEController,
                    errorMsg: 'Enter your password',
                    hintText: 'Enter your password',
                    prefixIcon: Icons.lock_outline,
                    showToggle: true,
                  ),
                  TextInputField(
                    labelText: 'Confirm Password',
                    textEditingController: _confirmPasswordTEController,
                    errorMsg: 'Enter Your confirm password',
                    hintText: 'Enter your confirm password',
                    prefixIcon: Icons.lock_outline,
                    showToggle: true,
                  ),
                  Obx(
                    () => CustomElevatedButton(
                        onTap: _registerButton,
                        buttonText: authController.loginLoading.value
                            ? 'Loading...'
                            : 'Register'),
                  ),
                  Text('--OR--', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text.rich(TextSpan(
                    text: 'Already have an account ? ',
                    children: [
                      TextSpan(
                          text: 'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offNamed(RouteNames.logInScreen);
                            })
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _registerButton() {
    if (_formKey.currentState!.validate() &&
        authController.registerLoading.value == false) {
      authController.register(
        _nameTEController.text,
        _emailTEController.text,
        _passwordTEController.text,
      );
    }
  }
}
