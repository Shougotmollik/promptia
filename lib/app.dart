import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prompita/constants/app_configure.dart';
import 'package:prompita/route/route_names.dart';
import 'package:prompita/route/routes.dart';
import 'package:prompita/services/storage_service.dart';
import 'package:prompita/theme/app_theme.dart';

class PromptiaApp extends StatelessWidget {
  const PromptiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfigure.appName,
      theme: lightTheme,
      initialRoute: StorageService.getUserSession != null
          ? RouteNames.homeScreen
          : RouteNames.logInScreen,
      getPages: Routes.pages,
      defaultTransition: Transition.fade,
    );
  }
}
