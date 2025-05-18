import 'package:get/get.dart';
import 'package:prompita/api/prompts_api.dart';
import 'package:prompita/services/supabase_services.dart';

class PromptsController extends GetxController {
  RxBool isLoading = false.obs;
  late final PromptsApi promptsApi;

  @override
  void onInit() {
    promptsApi = PromptsApi(SupabaseServices.supabase);
    super.onInit();
  }

//   To create a new method
  void createPrompt(String title, String prompts) async {
    isLoading.value = true;
    Map<String, dynamic> body = {
      'title': title,
      'prompt': prompts,
      'user_id': SupabaseServices.supabase.auth.currentUser?.id,
    };
    await promptsApi.createPrompts(body);
    isLoading.value = false;
  }
}
