import 'package:supabase_flutter/supabase_flutter.dart';

class PromptsApi {
  final SupabaseClient supabaseClient;
  final String tableName = 'prompts';

  PromptsApi(this.supabaseClient);

//   create Prompts
  Future<void> createPrompts(Map<String, dynamic> body) async {
    await supabaseClient.from(tableName).insert(body);
  }

//   Fetch Prompts
  Future<List<dynamic>> fetchPrompts() async {
    final response = await supabaseClient
        .from(tableName)
        .select('''id,title,prompt,user_id,created_at ,user:user_id(metadata,email)''').order(
            "id",
            ascending: false);
    return response;
  }

  //   Fetch User Prompts
  Future<List<dynamic>> fetchUserPrompts() async {
    final response = await supabaseClient.from(tableName).select(
        '''id,title,prompt,user_id,created_at ,user:user_id(metadata,email)''').match({
      "user_id": supabaseClient.auth.currentUser!.id
    }).order("id", ascending: false);
    return response;
  }

//  Delete Prompts
  Future<void> deletePrompt(int id) async {
    await supabaseClient.from(tableName).delete().match({"id": id});
  }
}
