import 'package:supabase_flutter/supabase_flutter.dart';

class AuthApi {
  final SupabaseClient supabaseClient;
  AuthApi(this.supabaseClient);

  // Login Method
  Future<AuthResponse> login(String email, String password) async {
    final AuthResponse response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return response;
  }

  // Register Method
  Future<AuthResponse> register(
      String name, String email, String password) async {
    final AuthResponse response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );
    return response;
  }

// logout Method

  Future<void> logout() async {
    if (supabaseClient.auth.currentUser != null) {
      await supabaseClient.auth.signOut();
    }
  }
}
