import 'dart:developer';

import 'package:get/get.dart';
import 'package:prompita/api/auth_api.dart';
import 'package:prompita/services/supabase_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  late AuthApi authApi;
  RxBool loginLoading = false.obs;
  RxBool registerLoading = false.obs;

  @override
  void onInit() {
    authApi = AuthApi(SupabaseServices.supabase);
    super.onInit();
  }

  // Login Method
  void login(String email, String password) async {
    loginLoading.value = true;
    final AuthResponse response = await authApi.login(email, password);
    loginLoading.value = false;

    log("The login response=> ${response.user!.toJson()}");
  }

// Signup Method
  void register(String name, String email, String password) async {
    registerLoading.value = true;
    final AuthResponse response = await authApi.register(name, email, password);
    registerLoading.value = false;

    log("The registration response=> ${response.user!.toJson()}");
  }
}
