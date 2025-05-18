import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient supabaseClient;

  AuthService(this.supabaseClient);

//   Get User Name
  String userName() => supabaseClient.auth.currentUser?.userMetadata?['name'];

//   Get User Email
  String? userEmail() => supabaseClient.auth.currentUser?.email;
}
